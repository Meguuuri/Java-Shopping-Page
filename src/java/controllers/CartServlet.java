package controllers;

import dao.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CartItem;
import models.Product;
import utils.Constants;
import utils.Validator;

/** Cart actions for logged-in Users. Uses ServletConfig init-param maxQuantity. */
public class CartServlet extends HttpServlet {

    private int maxQuantity;

    @Override
    public void init() throws ServletException {
        String param = getInitParameter("maxQuantity");
        try {
            maxQuantity = (param != null) ? Integer.parseInt(param.trim()) : 10;
            if (maxQuantity <= 0) {
                maxQuantity = 10;
            }
        } catch (NumberFormatException e) {
            maxQuantity = 10;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute(Constants.SESSION_CART);
        if (cart == null) {
            cart = new ArrayList<CartItem>();
            session.setAttribute(Constants.SESSION_CART, cart);
        }

        String action = request.getParameter("action"); // add | update | remove | clear
        if ("clear".equalsIgnoreCase(action)) {
            cart.clear();
            response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
            return;
        }

        String productIdStr = request.getParameter("productId");
        if (!Validator.isPositiveInt(productIdStr)) {
            response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
            return;
        }

        int productId = Integer.parseInt(productIdStr.trim());
        Product product = ProductDAO.findById(productId);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
            return;
        }

        int qty = 1;
        String qtyStr = request.getParameter("quantity");
        if (Validator.isPositiveInt(qtyStr)) {
            qty = Integer.parseInt(qtyStr.trim());
        }

        int allowedMax = Math.min(maxQuantity, product.getStock());

        if ("add".equalsIgnoreCase(action)) {
            if (allowedMax > 0) {
                CartItem existing = findItem(cart, productId);
                if (existing != null) {
                    int newQty = Math.min(existing.getQuantity() + qty, allowedMax);
                    existing.setQuantity(newQty);
                } else {
                    cart.add(new CartItem(product, Math.min(qty, allowedMax)));
                }
            }
        } else if ("update".equalsIgnoreCase(action)) {
            CartItem existing = findItem(cart, productId);
            if (existing != null) {
                if (qty <= 0 || allowedMax <= 0) {
                    cart.remove(existing);
                } else {
                    existing.setQuantity(Math.min(qty, allowedMax));
                }
            }
        } else if ("remove".equalsIgnoreCase(action)) {
            Iterator<CartItem> it = cart.iterator();
            while (it.hasNext()) {
                if (it.next().getProduct().getId() == productId) {
                    it.remove();
                    break;
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
    }

    private CartItem findItem(List<CartItem> cart, int productId) {
        for (CartItem item : cart) {
            if (item.getProduct() != null && item.getProduct().getId() == productId) {
                return item;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
    }
}