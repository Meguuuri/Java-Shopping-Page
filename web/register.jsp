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

            <c:if test="${not empty requestScope.errorMessage}">
                <p class="error"><c:out value="${requestScope.errorMessage}"/></p>
            </c:if>

            <%-- Relative action to RegisterServlet --%>
            <form action="RegisterServlet" method="post">
                <p><label>Full Name <input type="text" name="fullName" value="<c:out value='${param.fullName}'/>" required></label></p>
                <p><label>Username <input type="text" name="username" value="<c:out value='${param.username}'/>" required></label></p>
                <p><label>Password <input type="password" name="password" minlength="6" required></label></p>
                <p><label>Confirm Password <input type="password" name="confirmPassword" minlength="6" required></label></p>
                <p><input type="submit" value="Create account"></p>
            </form>

            <p>Already have an account? <a href="login.jsp">Login</a> | <a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
