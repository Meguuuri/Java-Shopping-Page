package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constants;

/** Creates a new User account. */
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: read fullName, username, password from request
        // TODO: validate; reject if dao.UserDAO.exists(username)
        // TODO: dao.UserDAO.add(new User(..., Constants.ROLE_USER)); redirect to login.jsp
        //       on error: set "errorMessage" and forward back to /register.jsp
        response.sendRedirect(request.getContextPath() + "/register.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/register.jsp");
    }
}
