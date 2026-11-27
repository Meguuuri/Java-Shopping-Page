<%@page contentType="text/html" pageEncoding="UTF-8" import="models.User, utils.Constants, models.Order, models.CartItem, dao.OrderDAO, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // SCRIPTLET: current user (AuthFilter guarantees non-null)
    User currentUser = (User) session.getAttribute(Constants.SESSION_USER);

    // SCRIPTLET: load this user's orders straight from the DAO
    List<Order> recentOrders = (currentUser != null)
            ? OrderDAO.findByUsername(currentUser.getUsername())
            : null;
    int maxRecent = 3;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Account</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Welcome, <%= currentUser.getFullName() %></h1>
            <%-- Relative links (same folder) and parent folder (..) --%>
            <p><a href="cart.jsp">My cart</a> | <a href="orders.jsp">My orders</a> | <a href="../ProductServlet">Shop</a></p>

            <h2>Recent Orders</h2>
            <%
                if (recentOrders != null && !recentOrders.isEmpty()) {
                    int limit = Math.min(recentOrders.size(), maxRecent);
            %>
            <table>
                <thead>
                    <tr>
                        <th>Order #</th>
                        <th>Date</th>
                        <th>Items</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
            <%
                    // Newest first: the DAO list is oldest-to-newest, so walk it backwards
                    for (int i = recentOrders.size() - 1; i >= recentOrders.size() - limit; i--) {
                        Order order = recentOrders.get(i);

                        // Total quantity across all products in this order
                        int itemCount = 0;
                        if (order.getItems() != null) {
                            for (CartItem ci : order.getItems()) {
                                itemCount += ci.getQuantity();
                            }
                        }
            %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getOrderDate() %></td>
                        <td><%= itemCount %></td>
                        <td>₱<%= String.format("%.2f", order.getTotal()) %></td>
                    </tr>
            <%
                    }
            %>
                </tbody>
            </table>
            <p><a href="orders.jsp">View all orders</a></p>
            <%
                } else {
            %>
            <p>You have no recent orders yet.</p>
            <%
                }
            %>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>