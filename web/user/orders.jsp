<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Orders</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>My Orders</h1>
            <%-- TODO: list dao.OrderDAO.findByUsername(current user) --%>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
