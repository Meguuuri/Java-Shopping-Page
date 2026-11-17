package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constants;

/** Public catalog: list all products, or one product when ?id= is present. */
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: if "id" param present -> dao.ProductDAO.findById, set "product", forward /product-detail.jsp
        // TODO: otherwise set "products" = dao.ProductDAO.findAll(), forward /products.jsp
        request.setAttribute("products", dao.ProductDAO.findAll());
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}
