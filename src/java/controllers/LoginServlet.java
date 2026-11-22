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

/** Handles login. Uses ServletConfig init-params successPage / failurePage. */
public class LoginServlet extends HttpServlet {

    private String successPage;
    private String failurePage;

    @Override
    public void init() throws ServletException {
        successPage = getInitParameter("successPage");
        failurePage = getInitParameter("failurePage");
        if (Validator.isEmpty(successPage)) successPage = "/user/home.jsp";
        if (Validator.isEmpty(failurePage)) failurePage = Constants.PAGE_LOGIN;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (Validator.isEmpty(username) || Validator.isEmpty(password))
        {
            request.setAttribute("errorMessage", "Username and password are required");
            request.getRequestDispatcher(failurePage).forward(request, response);
            return;
        }
        
        User user = UserDAO.authenticate(username, password);
        if (user == null)
        {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher(failurePage).forward(request, response);
            return;
        }
        
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null)
            oldSession.invalidate();
        
        HttpSession newSession = request.getSession(true);
        newSession.setAttribute (Constants.SESSION_USER, user);
        
        response.sendRedirect(request.getContextPath() + successPage);
            
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN);
    }
}


