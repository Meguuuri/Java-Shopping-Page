package dao;

import java.util.ArrayList;
import java.util.List;
import models.User;

/** In-memory user store (no database). */
public class UserDAO {

    private static final List<User> USERS = new ArrayList<User>();

    public static void seed() {
        // TODO: add at least one test account, e.g. new User("user", "user123", "Dela Cruz, Juan", Constants.ROLE_USER)
    }

    public static User authenticate(String username, String password) {
        // TODO: return the matching User, or null if none
        return null;
    }

    public static boolean exists(String username) {
        // TODO
        return false;
    }

    public static void add(User user) {
        // TODO: synchronized add to USERS
    }
}
