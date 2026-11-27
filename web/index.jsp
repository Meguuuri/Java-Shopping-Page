<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SariUNO!</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <%
                // SCRIPTLET: determine user role from session
                Object currentUser = session.getAttribute("user");
                String roleLabel = (currentUser != null) ? "Customer" : "Guest";
            %>

            <section class="hero-banner">
                <h1>Welcome to the SariUNO! Online Shop, <%= roleLabel %>!</h1>
                <p>Explore our curated collection of quality products at great prices.</p>
                <p>Visitors so far: <strong><c:out value="${applicationScope.visitorCount}" default="1"/></strong></p>

                <%-- Relative links (same folder) --%>
                <p>
                    <a href="ProductServlet" class="button-form">Browse Products</a>
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            | <a href="login.jsp" class="button-form">Login</a>
                            | <a href="register.jsp" class="button-form">Register</a>
                        </c:when>
                        <c:otherwise>
                            <%-- Absolute paths using contextPath --%>
                            | <a href="${pageContext.request.contextPath}/user/home.jsp" class="button-form">My Dashboard</a>
                            | <a href="${pageContext.request.contextPath}/user/CartServlet" class="button-form">My Cart</a>
                            | <a href="${pageContext.request.contextPath}/LogoutServlet" class="button-form">Logout</a>
                        </c:otherwise>
                    </c:choose>
                </p>
            </section>

            <section class="featured-section">
                <h2>Why Shop With Us?</h2>
                <div class="product-grid">
                    <div class="product-card">
                        <h3>Fast Checkout</h3>
                        <p>Add items to your cart and place orders seamlessly.</p>
                        <a href="${pageContext.request.contextPath}/ProductServlet" class="button-form">Start Shopping &rarr;</a>
                    </div>
                    <div class="product-card">
                        <h3>Member Access</h3>
                        <p>Create an account to track your order history anytime.</p>
                        <a href="register.jsp" class="button-form">Create Account &rarr;</a>
                    </div>
                </div>
            </section>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>
