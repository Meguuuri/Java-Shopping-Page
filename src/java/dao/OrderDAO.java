package dao;

import java.util.ArrayList;
import java.util.List;
import models.Order;

/** In-memory order store. */
public class OrderDAO {

    private static final List<Order> ORDERS = new ArrayList<Order>();

    public static void save(Order order) {
        // TODO: assign id, add to ORDERS
    }

    public static List<Order> findByUsername(String username) {
        // TODO: return only this user's orders
        return new ArrayList<Order>();
    }
}
