package dao;

import java.util.ArrayList;
import java.util.List;
import models.Order;

/** In-memory order store. */
public class OrderDAO {

    private static final List<Order> ORDERS = new ArrayList<Order>();
    private static int nextId = 1;

    public static void save(Order order) {
        if (order == null) {
            return;
        }
        synchronized (ORDERS) {
            if (order.getId() == 0) {
                order.setId(nextId++);
            } else if (order.getId() >= nextId) {
                nextId = order.getId() + 1;
            }
            ORDERS.add(order);
        }
    }

    public static List<Order> findByUsername(String username) {
        List<Order> result = new ArrayList<Order>();
        if (username == null) {
            return result;
        }
        synchronized (ORDERS) {
            for (Order order : ORDERS) {
                if (order != null && username.equals(order.getUsername())) {
                    result.add(order);
                }
            }
        }
        return result;
    }
}