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

            <c:if test="${not empty requestScope.errorMessage}">
                <p class="error"><c:out value="${requestScope.errorMessage}"/></p>
            </c:if>
            <c:if test="${not empty requestScope.successMessage}">
                <p class="success"><c:out value="${requestScope.successMessage}"/></p>
            </c:if>
            <c:if test="${param.logout == 'true'}">
                <p class="success">You have been logged out successfully.</p>
            </c:if>

            <%-- Relative action to LoginServlet --%>
            <form action="LoginServlet" method="post">
                <p><label>Username <input type="text" name="username" value="<c:out value='${param.username}'/>" required></label></p>
                <p><label>Password <input type="password" name="password" required></label></p>
                <p><input type="submit" value="Login"></p>
            </form>

            <%-- Mix of relative and absolute links --%>
            <p>No account? <a href="register.jsp">Register</a> | <a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
