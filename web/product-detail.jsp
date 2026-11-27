<%@page contentType="text/html" pageEncoding="UTF-8" import="models.Product, utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // The servlet sets "product" before forwarding here
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect(request.getContextPath() + "/ProductServlet");
        return;
    }
    boolean loggedIn = session.getAttribute(Constants.SESSION_USER) != null;
%>
<!DOCTYPE html>
<html>
    <head>
        <title><%= product.getName() %></title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <p><a href="ProductServlet">&larr; Back to Products</a></p>

            <div class="product-card">
                <img src="<%= request.getContextPath() %>/images/<%= product.getImage() %>"
                     alt="<%= product.getName() %>">
                <h1><%= product.getName() %></h1>
                <p><%= product.getDescription() %></p>
                <p class="price">₱<%= String.format("%.2f", product.getPrice()) %></p>
                <p class="stock">In Stock: <%= product.getStock() %></p>

                <% if (loggedIn) { %>
                    <form action="<%= request.getContextPath() %>/user/CartServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <input type="number" name="quantity" value="1" min="1" max="10">
                        <input type="submit" value="Add to Cart" <%= (product.getStock() <= 0) ? "disabled" : "" %>>
                    </form>
                <% } else { %>
                    <p><a href="login.jsp">Login to add to cart</a></p>
                <% } %>
            </div>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>