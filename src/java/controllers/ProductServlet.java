package controllers;

import dao.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;
import utils.Validator;

/** Public catalog: list all products, or one product when ?id= is present. */
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      System.out.println("detail page product=" + request.getAttribute("product"));

        String idParam = request.getParameter("id");

        // ?id= present -> show one product
        if (idParam != null && !Validator.isEmpty(idParam)) {
            idParam = idParam.trim();

            if (!Validator.isPositiveInt(idParam)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID.");
                return;
            }

            Product product = ProductDAO.findById(Integer.parseInt(idParam));
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
            return;
        }

      
        request.setAttribute("products", ProductDAO.findAll());
        request.getRequestDispatcher("/products.jsp").forward(request, response);
     
    }
}