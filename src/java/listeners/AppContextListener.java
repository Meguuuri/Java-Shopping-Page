package listeners;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Runs once when the web app starts. Stores the startup Date plus the
 * common header/footer text in the ServletContext (application scope).
 *
 * Attributes created (use in JSP as ${applicationScope.xxx}):
 *   appDate, headerText, footerText
 */
public class AppContextListener implements ServletContextListener {
    
    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
       final ServletContext ctx = sce.getServletContext();
        
        dao.UserDAO.seed();
        dao.ProductDAO.seed();
        ctx.setAttribute("appDate", new Date());

        String subject = ctx.getInitParameter("headerSubject");
        String section = ctx.getInitParameter("headerSection");
        String rawMembers = ctx.getInitParameter("headerMembers");
        
        ctx.setAttribute("headerSubject", subject);
        ctx.setAttribute("headerSection", section);
        if(rawMembers != null && !rawMembers.trim().isEmpty())
        {
            String[] members = rawMembers.split("\\s*;\\s*");
            ctx.setAttribute("headerMembers", members);
        }
        
        // Header: SUBJECT / SECTION / LASTNAME1 - LASTNAME2
        String header = subject + " / " + section + " / " + rawMembers;
        ctx.setAttribute("headerText", header);
        ctx.setAttribute("footerMP", ctx.getInitParameter("footerMP"));

        
        scheduler = Executors.newSingleThreadScheduledExecutor();
        final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        scheduler.scheduleAtFixedRate(new Runnable() {
            @Override
            public void run() {
                String currentTime = df.format(new Date());
                ctx.setAttribute("liveClock", currentTime);
            }
        }, 0, 1, TimeUnit.SECONDS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null)
            scheduler.shutdownNow();
        
        ServletContext ctx = sce.getServletContext();
        ctx.removeAttribute("appDate");
        ctx.removeAttribute("headerSubject");
        ctx.removeAttribute("headerSection");
        ctx.removeAttribute("headerMembers");
        ctx.removeAttribute("headerText");
        ctx.removeAttribute("footerText");
        ctx.removeAttribute("liveClock");
    }
}