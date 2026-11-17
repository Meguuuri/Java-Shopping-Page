<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Login</h1>
            <p class="error"><c:out value="${requestScope.errorMessage}"/></p>
            <form action="LoginServlet" method="post">
                <p><label>Username <input type="text" name="username"></label></p>
                <p><label>Password <input type="password" name="password"></label></p>
                <p><input type="submit" value="Login"></p>
            </form>
            <p>No account? <a href="register.jsp">Register</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
