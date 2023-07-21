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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            font-weight: bold;
        }

        .job-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .job-link a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #007BFF;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .job-link a:hover {
            background-color: #0056b3;
        }

        .delete-job {
            text-align: center;
            margin-top: 20px;
        }

        .delete-job a {
            text-decoration: none;
            color: #FF0000;
        }
    </style>
    <title>Job Details</title>
</head>
<body>

<div class="container">
    <h2><a href="/dashboard">Talent.al</a></h2>

    <h1>Job Details</h1>
    <table>
        <tbody>
        <tr>
            <th>Job Title:</th>
            <td><c:out value="${job.title}"/></td>
        </tr>

        <tr>
            <th>Description:</th>
            <td><c:out value="${job.description}"/></td>
        </tr>

        <tr>
            <th>Due Date:</th>
            <td><fmt:formatDate value="${job.dueDate}" pattern="MMMM dd"/></td>
        </tr>
        </tbody>
    </table>

    <div class="job-link">
        <a href="/jobs/${job.id}/tasks">See Job</a>
    </div>

    <c:if test="${job.lead.id == userId}">
        <div class="delete-job">
            <a href="/jobs/delete/${job.id}">Delete Job</a>
        </div>
    </c:if>
</div>
</body>
</html>
