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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>My Cart</h1>
            <%
                double total = 0;
                if (cart != null && !cart.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
            <%
                    for (int i = 0; i < cart.size(); i++) {
                        CartItem item = cart.get(i);
                        double subtotal = item.getSubtotal();
                        total += subtotal;
            %>
                    <tr>
                        <td><%= item.getName() %></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="update" />
                                <input type="hidden" name="index" value="<%= i %>" />
                                <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" required />
                                <button type="submit">Update</button>
                            </form>
                        </td>
                        <td><%= String.format("%.2f", subtotal) %></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="remove" />
                                <input type="hidden" name="index" value="<%= i %>" />
                                <button type="submit">Remove</button>
                            </form>
                        </td>
                    </tr>
            <%
                    }
            %>
                </tbody>
            </table>
            <p>Total: <strong><%= String.format("%.2f", total) %></strong></p>
            <p><a href="checkout.jsp">Proceed to checkout</a></p>
            <%
                } else {
            %>
            <p>Your cart is currently empty.</p>
            <p><a href="products.jsp">Continue shopping</a></p>
            <%
                }
            %>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>