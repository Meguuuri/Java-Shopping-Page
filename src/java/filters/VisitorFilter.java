package filters;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Constants;

/**
 * Counts unique visitors (browsers/devices) using a cookie with a random ID.
 * The first time an ID is seen, the shared counter in the ServletContext goes up by 1.
 */
public class VisitorFilter implements Filter {

    private static final String COOKIE_NAME = "visitorId";

    private final Set<String> seenVisitors = new HashSet<String>();
    private ServletContext ctx;

    public void init(FilterConfig filterConfig) throws ServletException {
        ctx = filterConfig.getServletContext();
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        if (isPageRequest(request)) {
            String id = readVisitorId(request);

            if (id == null) {
                // New browser: hand it an ID that lasts one year
                id = UUID.randomUUID().toString();
                Cookie cookie = new Cookie(COOKIE_NAME, id);
                cookie.setMaxAge(60 * 60 * 24 * 365);
                String path = request.getContextPath();
                cookie.setPath(path.length() == 0 ? "/" : path);
                response.addCookie(cookie);
            }

            synchronized (seenVisitors) {
                if (seenVisitors.add(id)) {   // true only the first time this ID is seen
                    Integer current = (Integer) ctx.getAttribute(Constants.APP_VISITORS);
                    int count = (current != null) ? current.intValue() : 0;
                    ctx.setAttribute(Constants.APP_VISITORS, Integer.valueOf(count + 1));
                }
            }
        }

        // The count is updated before the page renders, so the page shows it immediately
        chain.doFilter(req, res);
    }

    // Returns the visitor ID from the cookie, or null if missing or malformed
    private String readVisitorId(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }
        for (int i = 0; i < cookies.length; i++) {
            if (COOKIE_NAME.equals(cookies[i].getName())) {
                String value = cookies[i].getValue();
                if (value != null && value.matches("[0-9a-fA-F-]{36}")) {
                    return value;
                }
            }
        }
        return null;
    }

    // Count only normal page loads, not images, CSS or JS files
    private boolean isPageRequest(HttpServletRequest request) {
        if (!"GET".equalsIgnoreCase(request.getMethod())) {
            return false;
        }
        String uri = request.getRequestURI().toLowerCase();
        String[] skip = {".css", ".js", ".jpg", ".jpeg", ".png", ".gif", ".ico", ".svg"};
        for (int i = 0; i < skip.length; i++) {
            if (uri.endsWith(skip[i])) {
                return false;
            }
        }
        return true;
    }

    public void destroy() { }
}