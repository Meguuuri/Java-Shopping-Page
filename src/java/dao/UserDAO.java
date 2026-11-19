package dao;

import java.util.ArrayList;
import java.util.List;
import models.User;
import utils.Constants;

/** In-memory user store (no database). */
public class UserDAO {

    private static final List<User> USERS = new ArrayList<User>();

    public static void seed() {
        synchronized (USERS) {
            if (!USERS.isEmpty()) {
                return;
            }
            USERS.add(new User("itsAllGoodman", "loremipsum", "McGill, James", Constants.ROLE_USER));
            USERS.add(new User("theCloser627", "thelazybrownfox", "Price, John", Constants.ROLE_USER));
        }
    }

    public static User authenticate(String username, String password) {
        if (username == null || password == null) {
            return null;
        }
        synchronized (USERS) {
            for (User u : USERS) {
                if (u != null && username.equals(u.getUsername()) && password.equals(u.getPassword())) {
                    return u;
                }
            }
        }
        return null;
    }

    public static boolean exists(String username) {
        if (username == null) {
            return false;
        }
        synchronized (USERS) {
            for (User u : USERS) {
                if (u != null && username.equals(u.getUsername())) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void add(User user) {
        if (user == null) {
            return;
        }
        synchronized (USERS) {
            USERS.add(user);
        }
    }
}