package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constants;

/** Mapped to /user/* : only logged-in Users may pass. Guests go to login.jsp. */
public class AuthFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException { }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        // TODO: if session == null or session.getAttribute(Constants.SESSION_USER) == null
        //       -> response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN); return;
        boolean loggedIn = session != null 
                && session.getAttribute(Constants.SESSION_USER) != null;
        if(!loggedIn){
            response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN);
            return;
        }
        chain.doFilter(req, res);
    }

    public void destroy() { }
}
