<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
    body {
        background: linear-gradient(135deg, #add8e6, #90ee90);
        background-size: cover;
        font-family: Arial, sans-serif;
        color: #fff;
        text-align: center;
        padding: 50px;
    }
    .container {
        background-color: rgba(0, 0, 50, 0.8);
        padding: 20px;
        border-radius: 10px;
        display: inline-block;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
    .container h2 {
        margin-bottom: 20px;
    }
    .container table {
        margin: 0 auto;
    }
    .container td {
        padding: 10px;
    }
    .container input[type="text"], .container input[type="password"] {
        padding: 10px;
        border: none;
        border-radius: 5px;
        width: 200px;
    }
    .container input[type="submit"] {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #3498db;
        color: white;
        cursor: pointer;
        font-size: 16px;
    }
    .container input[type="submit"]:hover {
        background-color: #2980b9;
    }
    .message {
        margin-top: 20px;
    }
</style>
</head>
<body>

<div class="container">
    <h2>Login</h2>
    <form action="Login.jsp" method="post">
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"></td>
            </tr>
        </table>
    </form>
    <div class="message">
        <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Online_Blogging_System?characterEncoding=latin1","root","home");
                String sql = "SELECT * FROM users WHERE username=? AND password=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                rs = pst.executeQuery();
                
                if (rs.next()) {
                    session.setAttribute("username", username);
                    response.sendRedirect("dashboard.jsp");
                } else {
                    out.println("<font color='red'>Invalid username or password</font>");
                }
            } catch (Exception e) {
                out.println("<font color='red'>Error: " + e.getMessage() + "</font>");
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<font color='red'>Error closing resources: " + e.getMessage() + "</font>");
                }
            }
        }
        %>
    </div>
</div>

</body>
</html>
