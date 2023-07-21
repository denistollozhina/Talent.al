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

        .textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
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

        .linkBtn {
            text-decoration: none;
            color: #007BFF;
            padding: 10px 15px;
            border-radius: 5px;
            border: 1px solid #007BFF;
            background-color: transparent;
        }

        .button:hover, .linkBtn:hover {
            background-color: #0056b3;
        }

        .text-danger {
            color: #FF0000;
            font-size: 12px;
        }
    </style>
    <title>Edit Jobs</title>
</head>
<body>

<div class="container">
    <h2><a href="/dashboard">Talent.al</a></h2>

    <h1>Edit Job</h1>

    <form:form action="/jobs/edit/${job.id}" method="post" modelAttribute="job">

        <div class="form-row">
            <label for="title">Job Title:</label>
            <form:errors path="title" class="text-danger"/>
            <form:input class="input" path="title" value="${job.title}"/>
        </div>

        <div class="form-row">
            <label for="description">Job Description:</label>
            <form:errors path="description" class="text-danger"/>
            <form:textarea rows="4" class="textarea" path="description" value="${job.description}"/>
        </div>

        <div class="form-row">
            <label for="dueDate">Due Date:</label>
            <form:errors path="dueDate" class="text-danger"/>
            <form:input path="dueDate" type="date" value="${job.dueDate}"/>
        </div>

        <div class="form-row">
            <a class="linkBtn" href="/dashboard">Cancel</a>
            <input class="button" type="submit" value="Submit"/>
        </div>
    </form:form>
</div>
</body>
</html>
