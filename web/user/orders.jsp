<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List, dao.OrderDAO, models.Order, models.User, utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User currentUser = (User) session.getAttribute(Constants.SESSION_USER);
    List<Order> userOrders = (currentUser != null)
            ? OrderDAO.findByUsername(currentUser.getUsername())
            : null;
%>
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
            <%
                if (userOrders != null && !userOrders.isEmpty()) {
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
                    for (int i = userOrders.size() - 1; i >= 0; i--) {
                        Order order = userOrders.get(i);
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
            <%
                } else {
            %>
            <p>You have not placed any orders yet.</p>
            <%
                }
            %>
            <p><a href="account.jsp">Back to My Account</a> | <a href="../ProductServlet">Continue shopping</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>