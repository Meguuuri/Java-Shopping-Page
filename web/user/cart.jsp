<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List, models.CartItem, utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute(Constants.SESSION_CART);
    double total = 0;
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

            <% if (cart == null || cart.isEmpty()) { %>
                <p>Your cart is empty. <a href="../ProductServlet">Browse products</a></p>
            <% } else { %>
                <div class="product-grid">
                <%
                    for (CartItem item : cart) {
                        total += item.getSubtotal();
                %>
                    <div class="product-card">
                        <h3><%= item.getProduct().getName() %></h3>
                        <p>₱<%= String.format("%.2f", item.getProduct().getPrice()) %>
                           x <%= item.getQuantity() %>
                           = ₱<%= String.format("%.2f", item.getSubtotal()) %></p>

                        <form action="CartServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1"style="width:60px;">
                            <input type="submit" value="Update">
                        </form>
                        <form action="CartServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                            <input type="submit" value="Remove">
                        </form>
                    </div>
                <%
                    }
                %>
                </div>

                <p>Total: <strong>₱<%= String.format("%.2f", total) %></strong></p>
                <form action="CartServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="clear">
                    <input type="submit" value="Empty cart">
                    <a href="checkout.jsp" class="button-form">Proceed to checkout</a>
                </form>
               
            <% } %>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>