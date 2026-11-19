<%@page contentType="text/html" pageEncoding="UTF-8" import="models.User, utils.Constants, models.Order, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // SCRIPTLET: current user (AuthFilter guarantees non-null)
    User currentUser = (User) session.getAttribute(Constants.SESSION_USER);
    List<Order> recentOrders = (List<Order>) request.getAttribute("recentOrders");
    if(recentOrders==null){
        recentOrders =(List<Order>) session.getAttribute("recentOrders");
    }
    int maxRecent = 5;
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
            <%-- TODO: recent orders summary --%>
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
                        <th>Status</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
           <%
                    for (int i = 0; i < limit; i++) {
                        Order order = recentOrders.get(i);
                        int itemCount = (order.getItems() != null) ? order.getItems().size() : 0;
            %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getOrderDate() %></td>
                        <td><%= itemCount %></td>
                        <td><%= String.format("%.2f", order.getTotal()) %></td>
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
