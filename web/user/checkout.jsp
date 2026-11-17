<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Checkout</h1>
            <%-- TODO: order summary + confirm button --%>
            <form action="CheckoutServlet" method="post">
                <p><input type="submit" value="Place order"></p>
            </form>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
