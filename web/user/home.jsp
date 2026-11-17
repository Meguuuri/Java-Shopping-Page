<%@page contentType="text/html" pageEncoding="UTF-8" import="models.User, utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // SCRIPTLET: current user (AuthFilter guarantees non-null)
    User currentUser = (User) session.getAttribute(Constants.SESSION_USER);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Account</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Welcome, <%= currentUser.getFullName() %></h1>
            <%-- Relative links (same folder) and parent folder (..) --%>
            <p><a href="cart.jsp">My cart</a> | <a href="orders.jsp">My orders</a> | <a href="../ProductServlet">Shop</a></p>
            <%-- TODO: recent orders summary --%>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
