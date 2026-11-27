<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List, models.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // SCRIPTLET: guard - if opened directly, go through the servlet first
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null) {
        response.sendRedirect(request.getContextPath() + "/ProductServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Products</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <h1>Products</h1>
            <%-- Relative link back to index.jsp --%>
            <p><a href="index.jsp">&larr; Back to Home</a></p>

            <div class="product-grid">
            <%
                // SCRIPTLET: loop through products
                for (Product p : products) {
            %>
                <div class="product-card">

                    <h3><%= p.getName() %></h3>
                    <p class="price">₱<%= String.format("%.2f", p.getPrice()) %></p>
                    <p class="stock">In Stock: <%= p.getStock() %></p>

                    <%-- Relative link to ProductServlet with id parameter --%>
                    <p><a href="ProductServlet?id=<%= p.getId() %>">View Details</a></p>

                    <%-- Add-to-cart form posting to user/CartServlet --%>
                    <form action="<%= request.getContextPath() %>/user/CartServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <input type="hidden" name="quantity" value="1">
                        <input type="submit" value="Add to Cart" <%= (p.getStock() <= 0) ? "disabled" : "" %>>
                    </form>
                </div>
            <%
                }
            %>
            </div>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
