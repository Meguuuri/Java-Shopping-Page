package listeners;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import utils.Constants;

/** Counts visitors: +1 for every new session. Count lives in ServletContext. */
public class VisitorSessionListener implements HttpSessionListener {

    public void sessionCreated(HttpSessionEvent se) {
        ServletContext ctx = se.getSession().getServletContext();
        synchronized (ctx) {
            // TODO: read Constants.APP_VISITORS (Integer), add 1, store it back
        }
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        // Intentionally empty: the total visitor count never decreases.
    }
}
