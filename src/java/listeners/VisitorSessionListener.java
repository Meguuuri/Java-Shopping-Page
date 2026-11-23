package listeners;

import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import utils.Constants;


public class VisitorSessionListener implements ServletRequestListener {

    // IPs already counted. Lives as long as this listener (the whole app run).
    private final Set<String> seenVisitors = new HashSet<String>();

    public void requestInitialized(ServletRequestEvent sre) {
        if (sre == null) {
            return;
        }

        ServletRequest request = sre.getServletRequest();
        String ip = (request != null) ? request.getRemoteAddr() : null;
        if (ip == null) {
            return;
        }

        ServletContext ctx = sre.getServletContext();
        synchronized (seenVisitors) {
            // add() returns true only if the IP was not already in the set
            if (seenVisitors.add(ip)) {
                Integer current = (Integer) ctx.getAttribute(Constants.APP_VISITORS);
                int count = (current != null) ? current.intValue() : 0;
                count++;
                ctx.setAttribute(Constants.APP_VISITORS, Integer.valueOf(count));
            }
        }
    }

    public void requestDestroyed(ServletRequestEvent sre) {
        // Intentionally empty: the total never decreases.
    }
}