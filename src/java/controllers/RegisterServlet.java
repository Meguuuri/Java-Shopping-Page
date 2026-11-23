package controllers;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import utils.Constants;
import utils.Validator;

/** Creates a new User account. */
public class RegisterServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException
    {
        UserDAO.seed();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String fullName = request.getParameter("fullName");
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      
      if (fullName == null || username == null || password == null || Validator.isEmpty(fullName) || Validator.isEmpty(username) || Validator.isEmpty(password))
      {
          request.setAttribute("errorMessage", "All fields are required.");
          request.getRequestDispatcher("/register.jsp").forward(request, response);
          return;
      }
      
      if (password.trim().length() < 4)
      {
          request.setAttribute("errorMessage", "Password must be at least 4 characters");
          request.getRequestDispatcher("/register.jsp").forward(request, response);
          return;
      }
      
      if(UserDAO.exists(username.trim()))
      {
          request.setAttribute("errorMessage", "Username is already taken.");
          request.getRequestDispatcher("/register.jsp").forward(request, response);
          return;
      }
      
      User newUser = new User(username.trim(), password, fullName.trim(), Constants.ROLE_USER);
      UserDAO.add(newUser);
      
      response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN);
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/register.jsp");
    }
}
