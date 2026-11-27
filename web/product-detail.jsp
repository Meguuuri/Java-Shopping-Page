<%@page contentType="text/html" pageEncoding="UTF-8" import="models.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // SCRIPTLET: guard - redirect to ProductServlet if accessed without a product attribute
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect(request.getContextPath() + "/ProductServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title><c:out value="${product.name}"/> - Product Detail</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <%-- Relative link back to ProductServlet --%>
            <p><a href="ProductServlet">&larr; Back to Products</a></p>

            <div class="product-detail">
                <div class="product-detail-image">
                    <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="<c:out value='${product.name}'/>">
                </div>

                <div class="product-detail-info">
                    <h1><c:out value="${product.name}"/></h1>
                    <p class="price">₱<c:out value="${product.price}"/></p>
                    <p class="description"><c:out value="${product.description}"/></p>
                    <p class="stock">
                        Available Stock: <strong><c:out value="${product.stock}"/></strong>
                    </p>

                    <%-- Add-to-cart form (POST to user/CartServlet as noted in starter TODO) --%>
                    <form action="${pageContext.request.contextPath}/user/CartServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${product.id}">
                        <p>
                            <label>Quantity: 
                                <input type="number" name="quantity" value="1" min="1" max="${product.stock}" required>
                            </label>
                        </p>
                        <p>
                            <input type="submit" value="Add to Cart" ${product.stock <= 0 ? 'disabled' : ''}>
                        </p>
                    </form>
                </div>
            </div>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
