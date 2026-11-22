package controllers;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CartItem;
import models.Order;
import models.Product;
import models.User;
import utils.Constants;

/** Turns the cart into an Order. */
public class CheckoutServlet extends HttpServlet {

    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null)
        {
            response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN);
            return;
        }
        
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        if(user == null)
        {
             response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN);
             return;
        }
        
        List<CartItem> cart = (List<CartItem>) session.getAttribute(Constants.SESSION_CART);
        if (cart == null || cart.isEmpty())
        {
            response.sendRedirect(request.getContextPath() + "/user/checkout.jsp");
            return;
        }
        
        double total = 0;
        List<CartItem> orderItems = new ArrayList<CartItem>();
        
        for (CartItem item : cart)
        {
            Product p = ProductDAO.findById(item.getProduct().getId());
            if (p != null && item.getQuantity() > 0)
            {
                int purchasedQty = Math.min(item.getQuantity(), p.getStock());
                if (purchasedQty > 0)
                {
                    p.setStock(p.getStock() - purchasedQty);
                    CartItem finalizedItem = new CartItem(p, purchasedQty);
                    orderItems.add(finalizedItem);
                    total += finalizedItem.getSubtotal();
                }
            }
        }
        
        if (!orderItems.isEmpty())
        {
            Order order = new Order();
            order.setUsername(user.getUsername());
            order.setItems(orderItems);
            order.setTotal(total);
            order.setOrderDate(new Date());
            
            OrderDAO.save(order);
        }
        
        session.removeAttribute(Constants.SESSION_CART);
        response.sendRedirect(request.getContextPath() + "/user/orders.jsp");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/user/checkout.jsp");
    }
}

