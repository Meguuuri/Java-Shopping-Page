package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Constants;

/** Handles login. Uses ServletConfig init-params successPage / failurePage. */
public class LoginServlet extends HttpServlet {

    private String successPage;
    private String failurePage;

    @Override
    public void init() throws ServletException {
        successPage = getInitParameter("successPage");
        failurePage = getInitParameter("failurePage");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // TODO: validate input (utils.Validator), then dao.UserDAO.authenticate(...)
        // TODO: on failure: request.setAttribute("errorMessage", ...) and forward to failurePage
        // TODO: on success: invalidate old session, create new one, store User under
        //       Constants.SESSION_USER, then response.sendRedirect(contextPath + successPage)
        response.sendRedirect(request.getContextPath() + failurePage);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + Constants.PAGE_LOGIN);
    }
}
