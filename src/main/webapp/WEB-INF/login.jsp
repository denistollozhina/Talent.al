<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 10px;
            color: #007BFF;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            font-size: 18px;
            color: #666;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
        }

        table {
            width: 100%;
            border: none;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            font-weight: bold;
        }

        .float-left {
            text-align: left;
        }

        .text-danger {
            color: red;
        }

        .input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            cursor: pointer;
        }

        .input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <title>Log In</title>
</head>
<body>
<div class="container">
    <h2><a href="/dashboard">Talent.al</a></h2>

    <p>Welcome to the next generation of hiring</p>

    <form:form action="/login" method="post" modelAttribute="newLogin">
        <table>
            <tr>
                <td colspan="2">Log In</td>
            </tr>
            <tr>
                <td class="float-left">Email:</td>
                <td class="float-left">
                    <form:errors path="email" class="text-danger"/>
                    <form:input class="input" path="email"/>
                </td>
            </tr>
            <tr>
                <td class="float-left">Password:</td>
                <td class="float-left">
                    <form:errors path="password" class="text-danger"/>
                    <form:input class="input" path="password" type="password"/>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input class="input" type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
