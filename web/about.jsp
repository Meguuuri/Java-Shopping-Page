<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>About SariUNO!</title>
        <%@ include file="/includes/head.jspf" %>
    </head>
    <body>
        <%@ include file="/includes/header.jspf" %>
        <main>
            <section class="hero-banner">
                <h1>About SariUNO!</h1>
                <p>SariUNO! is a small online shop built as a class project. It brings a neighborhood
                   "sari-sari" store feel to the web, with everyday gadgets and desk essentials at
                   friendly prices.</p>
            </section>

            <section class="featured-section">
                <h2>What You Can Do Here</h2>
                <div class="product-grid">
                    <div class="product-card">
                        <h3>Browse as a Guest</h3>
                        <p>Look through the catalog and view product details without an account.</p>
                        <a href="ProductServlet" class="button-form">Browse Products</a>
                    </div>
                    <div class="product-card">
                        <h3>Shop as a Member</h3>
                        <p>Register and log in to add items to your cart, check out, and review your past orders.</p>
                        <a href="register.jsp" class="button-form">Create Account</a>
                    </div>
                    <div class="product-card">
                        <h3>Built with Java</h3>
                        <p>Made with Java Servlets and JSP, with session-based login, filters,
                           listeners, and custom error pages.</p>
                    </div>
                </div>
            </section>

            <section>
                <h2>Meet the Team</h2>
                <p>This project was created by:</p>
                <ul>
                    <c:forEach var="m" items="${applicationScope.headerMembers}">
                        <li><c:out value="${m}"/></li>
                    </c:forEach>
                </ul>
                <p>Course: <c:out value="${applicationScope.headerSubject}"/>,
                   Section <c:out value="${applicationScope.headerSection}"/></p>
            </section>

            <p><a href="index.jsp">&larr; Back to Home</a></p>
        </main>
        <%@ include file="/includes/footer.jspf" %>
    </body>
</html>