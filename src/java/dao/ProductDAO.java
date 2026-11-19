package dao;

import java.util.ArrayList;
import java.util.List;
import models.Product;

/** In-memory product catalog. */
public class ProductDAO {

    private static final List<Product> PRODUCTS = new ArrayList<Product>();

    public static void seed() {
        synchronized (PRODUCTS) {
            if (!PRODUCTS.isEmpty()) {
                return;
            }

            PRODUCTS.add(createProduct(
                    1,
                    "Mechanical Keyboard",
                    "Compact tactile keyboard with removable keycaps.",
                    2450.00,
                    15,
                    "keyboard.jpg"
            ));
            PRODUCTS.add(createProduct(
                    2,
                    "Wireless Mouse",
                    "Ergonomic optical mouse with adjustable DPI.",
                    890.00,
                    25,
                    "mouse.jpg"
            ));
            PRODUCTS.add(createProduct(
                    3,
                    "USB-C Hub",
                    "Multi-port adapter with HDMI, USB 3.0, and card reader.",
                    1350.00,
                    12,
                    "hub.jpg"
            ));
            PRODUCTS.add(createProduct(
                    4,
                    "Desk Lamp",
                    "LED task lamp with warm and cool brightness levels.",
                    1120.00,
                    10,
                    "lamp.jpg"
            ));
        }
    }

    public static List<Product> findAll() {
        synchronized (PRODUCTS) {
            return new ArrayList<Product>(PRODUCTS);
        }
    }

    public static Product findById(int id) {
        synchronized (PRODUCTS) {
            for (Product product : PRODUCTS) {
                if (product != null && product.getId() == id) {
                    return product;
                }
            }
        }
        return null;
    }

    private static Product createProduct(
            int id,
            String name,
            String description,
            double price,
            int stock,
            String image
    ) {
        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setDescription(description);
        p.setPrice(price);
        p.setStock(stock);
        p.setImage(image);
        return p;
    }
}