package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constants;

/** Turns the cart into an Order. */
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: build models.Order from the session cart + logged-in User
        // TODO: dao.OrderDAO.save(order); reduce stock; clear the cart
        // TODO: redirect to /user/orders.jsp
        response.sendRedirect(request.getContextPath() + "/user/orders.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/user/checkout.jsp");
    }
}
