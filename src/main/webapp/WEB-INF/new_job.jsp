<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            color: #007BFF;
            margin-bottom: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
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

        .float-left {
            float: left;
        }

        .input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        .error {
            color: #dc3545;
        }

        .linkBtn {
            color: #007BFF;
            text-decoration: none;
            border: 1px solid #007BFF;
            padding: 6px 12px;
            border-radius: 4px;
            background-color: #fff;
        }

        .linkBtn:hover {
            background-color: #007BFF;
            color: #fff;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <title>New Listing</title>
</head>
<body>
<div class="container">
    <h2><a href="/dashboard">Talent.al</a></h2>

    <h1>Create a new job</h1>

    <form:form action="/jobs/new" method="post" modelAttribute="job">

        <table>
            <thead>
            <tr>
                <td class="float-left">Job Title:</td>
                <td class="float-left">
                    <form:errors path="title" class="error"/>
                    <form:input class="input" path="title"/>
                </td>
            </tr>
            <tr>
                <td class="float-left">Job Description:</td>
                <td class="float-left">
                    <form:errors path="description" class="error"/>
                    <form:textarea rows="4" class="textarea" path="description"/>
                </td>
            </tr>
            <tr>
                <td class="float-left">Due Date:</td>
                <td class="float-left">
                    <form:errors path="dueDate" class="error"/>
                    <form:input path="dueDate" type="date" class="input"/>
                </td>
            </tr>

            <form:errors path="lead" class="error"/>
            <form:input type="hidden" path="lead" value="${userId}"/>

            <tr>
                <td><a class="linkBtn" href="/dashboard">Cancel</a></td>
                <td><input class="input" type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
