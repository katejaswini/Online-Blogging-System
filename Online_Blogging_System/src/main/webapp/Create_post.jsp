<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="auth.jsp" %>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Post</title>
<style>
    body {
        background-color: #f0f0f0;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100vh;
    }

    h2 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
    }

    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    input[type="submit"]:active {
        transform: scale(0.95);
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    body {
        animation: fadeIn 1s ease-in-out;
    }

    .message {
        text-align: center;
        margin-top: 20px;
        font-size: 1.2em;
    }
</style>
</head>
<body>

<h2>CREATE NEW POST</h2>
<form action="Create_post.jsp" method="post">
    <table>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="title" required></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><textarea name="content" rows="5" cols="30" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<%
if (request.getMethod().equalsIgnoreCase("post")) {
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = (String) session.getAttribute("username");
    
    Connection con = null;
    PreparedStatement pst = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Blogging_System?characterEncoding=latin1","root","home");
        String sql = "INSERT INTO posts (title, content, author) VALUES (?, ?, ?)";
        pst = con.prepareStatement(sql);
        pst.setString(1, title);
        pst.setString(2, content);
        pst.setString(3, author);
        pst.executeUpdate();
        
        // Redirect to dashboard.jsp after successful post creation
        response.sendRedirect("dashboard.jsp");
    } catch (Exception e) {
        out.println("<div class='message'><font color='red'>Error: " + e.getMessage() + "</font></div>");
        e.printStackTrace();
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("<div class='message'><font color='red'>Error closing resources: " + e.getMessage() + "</font></div>");
        }
    }
}
%>

</body>
</html>
