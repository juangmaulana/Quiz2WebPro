<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
    <title>Storify - Product List</title>
</head>
<body>
<ul>
    <li><a class="active" href="dashboard.jsp"><img src="resource/logo.png" height="20px"></a></li>
    <li><a href="InputProduct.jsp">Input Product</a></li>
    <li><a href="profile.jsp">Profile</a></li>
</ul>

<header>
    <h1>Welcome to Storify - Product List</h1>
</header>

<main>
    <table border="1">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/storify";
            String username = "root";
            String password = "";
            String query = "SELECT * FROM products";

            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int productId = rs.getInt("ProductId");
        %>
            <tr>
                <td><%= productId %></td>
                <td><%= rs.getString("ProductName") %></td>
                <td><%= rs.getInt("ProductQuantity") %></td>
                <td><%= rs.getDouble("ProductPrice") %></td>
                <td class="action-buttons">
                    <form action="UpdateProductServlet" method="GET" style="display: inline;">
                        <input type="hidden" name="productId" value="<%= productId %>">
                        <button type="submit" class="btn update-btn">Update</button>
                    </form>
                    
                    <form action="DeleteProductServlet" method="POST" style="display: inline;" 
                          onsubmit="return confirm('Are you sure you want to delete this product?');">
                        <input type="hidden" name="productID" value="<%= productId %>">
                        <input type="hidden" name="productName" value="<%= rs.getString("ProductName") %>">
                        <button type="submit" class="btn delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='5'>Error retrieving products.</td></tr>");
        }
        %>
        </tbody>
    </table>
</main>
</body>
</html>