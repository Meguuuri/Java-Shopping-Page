<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>500 - Internal Server Error</title>
    <%@ include file="/includes/head.jspf" %>
</head>
<body>
    <%@ include file="/includes/header.jspf" %>

    <main class="container error-page">
        <div class="card error-box">
            <h1>500</h1>
            <h2>Internal Server Error</h2>
            <p>An unexpected error occurred on the server while processing your request.</p>
            <% if (exception != null) { %>
                <p class="error-details">
                    <strong>Details:</strong> <%= exception.getClass().getSimpleName() %>
                    <% if (exception.getMessage() != null) { %>
                        - <%= exception.getMessage() %>
                    <% } %>
                </p>
            <% } %>
            <a href="<%= ctx %>/index.jsp" class="btn">Return to Home</a>
        </div>
    </main>

    <%@ include file="/includes/footer.jspf" %>
</body>
</html>
