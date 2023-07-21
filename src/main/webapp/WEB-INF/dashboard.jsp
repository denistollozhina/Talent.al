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
        /* Styles for the navigation bar */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 200px;
            background-color: #007BFF;
            color: #fff;
            padding: 20px;
        }

        .navbar a {
            display: block;
            color: #fff;
            text-decoration: none;
            padding: 10px;
            margin-bottom: 10px;
        }

        .container {
            margin-left: 220px; /* Adjust this value to leave space for the navbar */
            padding: 20px;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #007BFF;
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            font-size: 18px;
            color: #666;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        h4 {
            color: #333;
            margin-top: 30px;
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

        td a {
            color: #007BFF;
        }

        td a:hover {
            text-decoration: underline;
        }

        /* Add some spacing between the table rows */
        tbody tr:not(:last-child) {
            margin-bottom: 10px;
        }
    </style>
    <title>Job Board Dashboard</title>
</head>
<body>
<div class="navbar">
    <p>Welcome, ${user.firstName}</p>
    <p><a href="/logout">Log Out</a></p>

    <c:if test="${user.role == 'COMPANY'}">
        <p><a href="/jobs/new">Add Job</a></p>
    </c:if>
</div>
<div class="container">
    <h1>Talent.al</h1>

    <%-- All Users Interface --%>
    <h4>Manage Jobs</h4>
    <table>
        <thead>
        <tr>
            <th>Job Title</th>
            <th>Recruiter</th>
            <th>Due Date</th>
            <th>Job Description</th>
            <%-- Company-specific column for actions --%>
            <c:if test="${user.role == 'COMPANY'}">
                <th>Action</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <%-- Iterate over all jobs --%>
        <c:forEach var="job" items="${allJobs}">
            <tr>
                <td><a href="/jobs/${job.id}">${job.title}</a></td>
                <td><c:out value="${job.lead.firstName}"></c:out></td>
                <td><fmt:formatDate value="${job.dueDate}" pattern="MMMM dd"/></td>
                <td>${job.description}</td>
                    <%-- Show company-specific action button --%>
                <c:if test="${user.role == 'COMPANY'}">
                    <td><a href="/dashboard/join/${job.id}">Publish</a></td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%-- Company User Interface --%>
    <c:if test="${user.role == 'COMPANY'}">
        <hr>

        <h4>Your Jobs</h4>
        <table>
            <thead>
            <tr>
                <th>Job Title</th>
                <th>Recruiter</th>
                <th>Due Date</th>
                <th>Job Description</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%-- Iterate over company's jobs --%>
            <c:forEach var="job" items="${companyJobs}">
                <tr>
                    <td><a href="/jobs/${job.id}">${job.title}</a></td>
                    <td><c:out value="${job.lead.firstName}"></c:out></td>
                    <td><fmt:formatDate value="${job.dueDate}" pattern="MMMM dd"/></td>
                    <td>${job.description}</td>
                    <td><a href="/jobs/edit/${job.id}">Edit Job</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
