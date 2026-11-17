package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constants;

/** Cart actions for logged-in Users. Uses ServletConfig init-param maxQuantity. */
public class CartServlet extends HttpServlet {

    private int maxQuantity;

    @Override
    public void init() throws ServletException {
        // TODO: parse getInitParameter("maxQuantity") into maxQuantity (default 10 on error)
        maxQuantity = 10;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action"); // add | update | remove | clear
        // TODO: get/create List<CartItem> in session (Constants.SESSION_CART)
        // TODO: handle each action, respecting maxQuantity and product stock
        response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
    }
}
