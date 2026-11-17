<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>403 - Forbidden</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>403 - Forbidden</h1>
            <%-- TODO: friendly explanation --%>
            <p><a href="<%= request.getContextPath() %>/index.jsp">Back to Home</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
