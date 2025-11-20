<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/profile.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
<title>Storify</title>
</head>
<body>
    <ul>
        <li><a href="dashboard.jsp"><img src="resource/logo.png" height="20px"></a></li>
        <li><a href="InputProduct.jsp">Input Product</a></li>
        <li><a class="active" href="profile.jsp">Profile</a></li>
    </ul>
    <main>
        <div class="form-container">
            <h1>Your Profile</h1>
            <form action="UpdateUserServlet" method="post">
                <%
                String loggedUser = (String) session.getAttribute("loggedUser");

                if (loggedUser == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/storify";
                        String username = "root";
                        String password = "";
                        String query = "SELECT * FROM users WHERE UserName = ?";

                        Connection conn = DriverManager.getConnection(url, username, password);
                        PreparedStatement ps = conn.prepareStatement(query);
                        ps.setString(1, loggedUser);
                        ResultSet rs = ps.executeQuery();

                        if (rs.next()) {
                %>
                <input type="hidden" name="username" value="<%= loggedUser %>">
                <table>
                    <tr>
                        <td><label>Name</label></td>
                        <td><input type="text" name="name" value="<%= rs.getString("UserFullName") %>"></td>
                    </tr>
                    <tr>
                        <td><label>Password</label></td>
                        <td><input type="password" name="password" value="<%= rs.getString("UserPassword") %>"></td>
                    </tr>
                    <tr>
                        <td><label>Email</label></td>
                        <td><input type="email" name="email" value="<%= rs.getString("UserEmail") %>"></td>
                    </tr>
                    <tr>
                        <td><label>Date of Birth</label></td>
                        <td><input type="date" name="dob" value="<%= rs.getDate("UserDOB") %>"></td>
                    </tr>
                    <tr>
                        <td><label>Address</label></td>
                        <td><textarea name="address"><%= rs.getString("UserAddress") %></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="submit">Update Profile</button>
                        </td>
                    </tr>
                </table>
                <%
                        }
                        rs.close();
                        ps.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p>Error retrieving user data.</p>");
                    }
                }
                %>
            </form>

            <form action="LogoutServlet" method="post">
                <button type="submit">Logout</button>
            </form>
        </div>
    </main>
</body>
</html>
