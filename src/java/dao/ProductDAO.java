package dao;

import java.util.ArrayList;
import java.util.List;
import models.Product;

/** In-memory product catalog. */
public class ProductDAO {

    private static final List<Product> PRODUCTS = new ArrayList<Product>();

    public static void seed() {
        // TODO: add sample products (id, name, description, price, stock, image)
    }

    public static List<Product> findAll() {
        // TODO: return PRODUCTS (or a copy)
        return new ArrayList<Product>();
    }

    public static Product findById(int id) {
        // TODO
        return null;
    }
}
