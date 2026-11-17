<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List, models.CartItem, utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute(Constants.SESSION_CART);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Cart</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>My Cart</h1>
            <%
                // SCRIPTLET: list items and compute total
                double total = 0;
                if (cart != null) {
                    for (CartItem item : cart) {
                        total += item.getSubtotal();
            %>
                <%-- TODO: row with name, qty (update form), subtotal, remove button (POST CartServlet) --%>
            <%
                    }
                }
            %>
            <p>Total: <strong><%= total %></strong></p>
            <p><a href="checkout.jsp">Proceed to checkout</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
