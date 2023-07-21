<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/20/2023
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Skills</title>
</head>
<body>
<h2><a href="/dashboard">Talent.al</a></h2>

<form action="/register/add-skills" method="post">
    <!-- Your form fields for skills and programming languages -->
    <label for="skills">Skills:</label>
    <input type="text" name="skills" id="skills" value="${user.skills}" required>

    <label for="programmingLanguages">Programming Languages:</label>
    <input type="text" name="programmingLanguages" id="programmingLanguages" value="${user.programmingLanguages}" required>

    <button type="submit">Next</button>
</form>
</body>
</html>
