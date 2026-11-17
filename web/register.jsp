<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Register</h1>
            <p class="error"><c:out value="${requestScope.errorMessage}"/></p>
            <form action="RegisterServlet" method="post">
                <%-- TODO: fullName, username, password, confirm password fields --%>
                <p><input type="submit" value="Create account"></p>
            </form>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
