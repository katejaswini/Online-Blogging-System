<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="auth.jsp" %>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
    body {
        background-color: #f0f0f0;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 100vh;
        overflow: hidden;
    }

    h2 {
        color: #333;
        text-align: center;
        font-size: 3em;
        margin: 0;
        position: fixed;
        top: 20px;
        width: 100%;
        background-color: #f0f0f0;
        z-index: 1;
        padding: 20px 0;
        box-shadow: 0 4px 2px -2px gray;
    }

    ul {
        list-style-type: none;
        padding: 0;
        margin-top: 100px;
    }

    li {
        margin: 20px 0;
    }

    a {
        text-decoration: none;
        color: #fff;
        background-color: #007BFF;
        padding: 20px 40px;
        border-radius: 5px;
        display: block;
        width: 200px;
        text-align: center;
        transition: background-color 0.3s, transform 0.3s;
    }

    a:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    a:active {
        transform: scale(0.95);
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    body {
        animation: fadeIn 1s ease-in-out;
    }
</style>
</head>
<body>
<h2>Welcome, <%= session.getAttribute("username") %>!</h2>
<ul>
    <li><a href="Create_post.jsp">Create New Post</a></li>
    <li><a href="Display.jsp">View All Posts</a></li>
    <li><a href="logout.jsp">Logout</a></li>
</ul>
</body>
</html>
