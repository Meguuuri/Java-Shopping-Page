package listeners;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import utils.Constants;

/**
 * Runs when the app starts/stops.
 * - Stores header/footer info in ServletContext
 * - Keeps the "current date and time" attribute refreshed
 * - Seeds in-memory data
 */
public class AppContextListener implements ServletContextListener {

    private Timer timer;

    public void contextInitialized(ServletContextEvent sce) {
        final ServletContext ctx = sce.getServletContext();

        // Header info (from web.xml context-params)
        ctx.setAttribute(Constants.APP_SUBJECT, ctx.getInitParameter("headerSubject"));
        ctx.setAttribute(Constants.APP_SECTION, ctx.getInitParameter("headerSection"));
        // TODO: split ctx.getInitParameter("headerMembers") by ";" into a trimmed List<String>
        List<String> members = new ArrayList<String>();
        ctx.setAttribute(Constants.APP_MEMBERS, members);

        // Footer info
        ctx.setAttribute(Constants.APP_MP, ctx.getInitParameter("footerMP"));

        // Visitor counter starts at 0 (incremented by VisitorSessionListener)
        ctx.setAttribute(Constants.APP_VISITORS, Integer.valueOf(0));

        // Current date/time, refreshed periodically
        ctx.setAttribute(Constants.APP_DATE, new Date());
        timer = new Timer("date-refresher", true);
        timer.schedule(new TimerTask() {
            public void run() {
                // TODO: ctx.setAttribute(Constants.APP_DATE, new Date());
            }
        }, 1000L, 1000L);

        // TODO: call dao.UserDAO.seed() and dao.ProductDAO.seed()
    }

    public void contextDestroyed(ServletContextEvent sce) {
        if (timer != null) {
            timer.cancel();
        }
    }
}
