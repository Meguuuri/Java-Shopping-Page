package utils;

/** Shared names for session/context attributes and roles. */
public final class Constants {

    private Constants() { }

    // Roles
    public static final String ROLE_GUEST = "GUEST";
    public static final String ROLE_USER  = "USER";

    // Session attributes
    public static final String SESSION_USER = "loggedUser";   // models.User
    public static final String SESSION_CART = "cart";         // java.util.List<models.CartItem>

    // Application (ServletContext) attributes - set by listeners
    public static final String APP_DATE     = "appDate";       // java.util.Date (refreshed)
    public static final String APP_VISITORS = "visitorCount";  // Integer
    public static final String APP_SUBJECT  = "headerSubject";
    public static final String APP_SECTION  = "headerSection";
    public static final String APP_MEMBERS  = "headerMembers"; // java.util.List<String>
    public static final String APP_MP       = "footerMP";

    // Pages
    public static final String PAGE_LOGIN = "/login.jsp";
}
