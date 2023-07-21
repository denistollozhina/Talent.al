<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            font-size: 36px;
            color: #333;
        }

        h5 {
            margin-bottom: 20px;
            font-size: 16px;
            color: #666;
        }

        form {
            margin-bottom: 20px;
        }

        .form-row {
            margin-bottom: 10px;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-right: 10px;
        }

        .input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .task-card {
            background-color: #fff;
            padding: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .task-card h4 {
            margin: 0;
            font-size: 16px;
            color: #007BFF;
        }

        .task-card p {
            margin: 5px 0;
            font-size: 14px;
            color: #333;
        }
    </style>
    <title>New Task</title>
</head>
<body>

<div class="container">
    <h2><a href="/dashboard">Talent.al</a></h2>

    <h1>Job: ${job.title}</h1>
    <h5>Recruiter: ${job.lead.firstName}</h5>

    <form:form action="/jobs/${job.id}/tasks" method="post" modelAttribute="task">
        <div class="form-row">
            <label for="name">Add a comment:</label>
            <form:textarea rows="4" class="input" path="name"/>
        </div>
        <div class="form-row">
            <input class="button" type="submit" value="Submit"/>
        </div>
    </form:form>

    <hr>

    <c:forEach var="task" items="${tasks}">
        <div class="task-card">
            <h4>Added by <c:out value="${task.creator.firstName}"></c:out> at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h4>
            <p><c:out value="${task.name}"></c:out></p>
        </div>
    </c:forEach>
</div>

</body>
</html>
