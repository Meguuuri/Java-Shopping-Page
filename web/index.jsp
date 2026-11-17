<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Shop</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Welcome to the Online Shop</h1>
            <p>Visitors so far: <strong><c:out value="${applicationScope.visitorCount}"/></strong></p>
            <%-- Relative links (same folder) --%>
            <p><a href="ProductServlet">Browse products</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
            <%-- TODO: featured products / hero banner --%>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
