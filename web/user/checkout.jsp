<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List, models.CartItem, utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute(Constants.SESSION_CART);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
        <%@ include file="/includes/head.jspf" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Checkout</h1>
            <%
                double total = 0;
                if (cart != null && !cart.isEmpty()) {
            %>
            <h2>Order Summary</h2>
            <table>
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
            <%
                    for (CartItem item : cart) {
                        double subtotal = item.getSubtotal();
                        total += subtotal;
            %>
                    <tr>
                        <td><%= item.getName() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td><%= String.format("%.2f", subtotal) %></td>
                    </tr>
            <%
                    }
            %>
                </tbody>
            </table>
            <p>Order Total: <strong><%= String.format("%.2f", total) %></strong></p>

            <form action="CheckoutServlet" method="post">
                <p><input type="submit" value="Place order"></p>
            </form>
            <%
                } else {
            %>
            <p>Your cart is empty. Add items before checking out.</p>
            <p><a href="products.jsp">Browse products</a></p>
            <%
                }
            %>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>