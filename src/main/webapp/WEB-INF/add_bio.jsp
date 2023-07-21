<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Bio</title>
</head>
<body>
<h2><a href="/dashboard">Talent.al</a></h2>

<form:form action="/register/complete-registration" method="post">
    <!-- Your form field for short bio -->
    <label for="shortBio">Short Bio:</label>
    <textarea name="shortBio" id="shortBio" rows="4" required>${user.shortBio}</textarea>

    <c:if test="${!user.company}">
        <button type="submit">Complete Profile</button>
    </c:if>
</form:form>
</body>
</html>
