<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Talent.al</title>
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

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 36px;
            color: #333;
            margin: 0;
        }

        .header p {
            font-size: 18px;
            color: #666;
            margin: 0;
        }

        .top-right {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .top-right a {
            margin-left: 10px;
            text-decoration: none;
            color: #333;
            font-size: 16px;
            background-color: #007BFF;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;

        }
        .top-right a:hover {
            background-color: #0056b3;

        }

        .main-content {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .job-card {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .job-card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }

        .job-card h3 {
            color: #333;
            margin: 10px 0;
        }

        .job-card p {
            color: #666;
            margin: 5px 0;
        }

        .job-card a {
            display: inline-block;
            text-decoration: none;
            color: #007BFF;
            margin-top: 10px;
            background-color: #007BFF;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .job-card a:hover {
            background-color: #0056b3;
        }


        .job-card a i {
            margin-right: 5px;
        }

        .featured-companies {
            display: flex;
            flex-wrap: wrap;
        }

        .company-card {
            width: calc(50% - 10px);
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .company-card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }

        .company-card h3 {
            color: #333;
            margin: 10px 0;
        }

        .company-card p {
            color: #666;
            margin: 5px 0;
        }

        .company-card a {
            display: inline-block;
            text-decoration: none;
            color: #007BFF;
            margin-top: 10px;
            background-color: #007BFF;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .company-card a:hover {
            background-color: #0056b3;
        }


        .company-card a i {
            margin-right: 5px;
        }
        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ccc;
            text-align: center;
        }

        .footer p {
            color: #666;
            margin: 5px 0;
        }

        .footer a {
            color: #007BFF;
            text-decoration: none;
            margin: 0 5px;
        }


    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Talent.al</h1>
        <p>Welcome to the next generation of hiring</p>
    </div>

    <div class="top-right">
        <!-- Link to the login page -->
        <a href="/login">Login</a>

        <!-- Link to the register page -->
        <a href="/register">Register</a>
    </div>

    <div class="main-content">
        <h2>Latest Job Openings</h2>

        <div class="job-card">
            <a href="#">
                <img src="https://via.placeholder.com/150" alt="Job Image">
            </a>
            <h3>Software Engineer</h3>
            <p>Company: ABC Tech</p>
            <p>Location: New York</p>
            <p>Posted on: July 20, 2023</p>
            <a href="#"><i class="fas fa-arrow-right"></i> Apply Now</a>
        </div>

        <div class="job-card">
            <a href="#">
                <img src="https://via.placeholder.com/150" alt="Job Image">
            </a>
            <h3>Web Developer</h3>
            <p>Company: XYZ Solutions</p>
            <p>Location: San Francisco</p>
            <p>Posted on: July 20, 2023</p>
            <a href="#"><i class="fas fa-arrow-right"></i> Apply Now</a>
        </div>

        <!-- Add more job cards here... -->

        <h2>Featured Companies</h2>

        <div class="featured-companies">
            <div class="company-card">
                <a href="#">
                    <img src="https://via.placeholder.com/150" alt="Company Logo">
                </a>
                <h3>ABC Tech</h3>
                <p>New York, USA</p>
                <a href="#"><i class="fas fa-briefcase"></i> View Jobs</a>
            </div>

            <div class="company-card">
                <a href="#">
                    <img src="https://via.placeholder.com/150" alt="Company Logo">
                </a>
                <h3>XYZ Solutions</h3>
                <p>San Francisco, USA</p>
                <a href="#"><i class="fas fa-briefcase"></i> View Jobs</a>
            </div>

        </div>
    </div>
</div>
<div class="footer">
    <p>© 2023 Talent.al. All rights reserved.</p>
    <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a> | <a href="#">Contact Us</a></p>
</div>
</div>
</body>
</html>
