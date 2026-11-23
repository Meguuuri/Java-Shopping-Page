<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>403 - Access Forbidden</title>
    <%@ include file="/includes/head.jspf" %>
</head>
<body>
    <%@ include file="/includes/header.jspf" %>

    <main class="container error-page">
        <div class="card error-box">
            <h1>403</h1>
            <h2>Access Forbidden</h2>
            <p>You do not have permission to access this resource. Please log in with an authorized account.</p>
            <a href="<%= ctx %>/login.jsp" class="btn">Go to Login</a>
            <a href="<%= ctx %>/index.jsp" class="btn btn-secondary">Return to Home</a>
        </div>
    </main>

    <%@ include file="/includes/footer.jspf" %>
</body>
</html>
