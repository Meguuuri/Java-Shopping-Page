<%@page contentType="text/html" pageEncoding="UTF-8"Request</h1>
            <%-- TODO: friendly explanation --%>
            <p><a href="<%= request.getContextPath() %>/index.jsp">Back to Home</a></p>%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>400 - Bad Request</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>400 - Bad
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
