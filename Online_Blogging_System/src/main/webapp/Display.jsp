<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="auth.jsp" %>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog Posts</title>
<style>
    body {
        background-color: #f0f8ff;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
        font-size: 2.5em;
    }

    table {
        width: 80%;
        border-collapse: collapse;
        background-color: #ffffcc;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        animation: fadeIn 1s ease-in-out;
    }

    th, td {
        padding: 15px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    body {
        animation: fadeIn 1s ease-in-out;
    }

    .dashboard-btn {
        background-color: #007BFF;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
        text-decoration: none;
        text-align: center;
        margin-top: 20px;
    }

    .dashboard-btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .dashboard-btn:active {
        transform: scale(0.95);
    }
</style>
</head>
<body>

<h2>BLOG POSTS</h2>
<table>
    <tr><th>Title</th><th>Content</th><th>Author</th><th>Date</th></tr>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Blogging_System?characterEncoding=latin1","root","home");
    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM posts");
    
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("content") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getTimestamp("created_at") %></td>
    </tr>
<%
    }
    
} catch (Exception e) {
    out.println("<font color='red'>Unable to connect to database: " + e.getMessage() + "</font>");
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } 
    
    catch (SQLException e) {
        out.println("<font color='red'>Error closing resources: " + e.getMessage() + "</font>");
    }
}
%>
</table>

<a href="dashboard.jsp" class="dashboard-btn">Go to Dashboard</a>

</body>
</html>
