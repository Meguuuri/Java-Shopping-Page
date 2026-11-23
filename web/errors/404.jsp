<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>404 - Page Not Found</title>
    <%@ include file="/includes/head.jspf" %>
</head>
<body>
    <%@ include file="/includes/header.jspf" %>

    <main class="container error-page">
        <div class="card error-box">
            <h1>404</h1>
            <h2>Page Not Found</h2>
            <p>The page you are looking for does not exist, was moved, or is temporarily unavailable.</p>
            <a href="<%= ctx %>/index.jsp" class="btn">Return to Home</a>
        </div>
    </main>

    <%@ include file="/includes/footer.jspf" %>
</body>
</html>
