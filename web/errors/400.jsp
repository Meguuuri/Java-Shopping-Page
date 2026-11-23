<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>400 - Bad Request</title>
    <%@ include file="/includes/head.jspf" %>
</head>
<body>
    <%@ include file="/includes/header.jspf" %>

    <main class="container error-page">
        <div class="card error-box">
            <h1>400</h1>
            <h2>Bad Request</h2>
            <p>The server could not understand your request due to invalid or missing parameters.</p>
            <a href="<%= ctx %>/index.jsp" class="btn">Return to Home</a>
        </div>
    </main>

    <%@ include file="/includes/footer.jspf" %>
</body>
</html>
