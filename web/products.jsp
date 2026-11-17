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
            <div class="product-grid">
            <%
                // SCRIPTLET: loop through products
                for (Product p : products) {
            %>
                <div class="product-card">
                    <%-- TODO: image, name, price, link to ProductServlet?id=, add-to-cart form --%>
                    <h3><%= p.getName() %></h3>
                </div>
            <%
                }
            %>
            </div>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
