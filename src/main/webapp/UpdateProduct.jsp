<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/inputproduct.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
    <title>Update Product</title>
    <style>
        .form-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        table {
            width: 100%;
        }
        
        td {
            padding: 10px;
        }
        
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <ul>
        <li><a href="dashboard.jsp"><img src="resource/logo.png" height="20px"></a></li>
        <li><a href="InputProduct.jsp">Input Product</a></li>
        <li><a href="Profile.jsp">Profile</a></li>
    </ul>
    
    <main>
        <div class="form-container">
            <h1>Update Product</h1>
            <%
                ResultSet rs = (ResultSet)request.getAttribute("product");
                if(rs != null) {
            %>
            <form action="UpdateProductServlet" method="post">
                <input type="hidden" name="productId" value="<%= rs.getInt("ProductId") %>">
                <table>
                    <tr>
                        <td><label for="productName">Product Name</label></td>
                        <td><input type="text" id="productName" name="productName" 
                                 value="<%= rs.getString("ProductName") %>" required></td>
                    </tr>
                    <tr>
                        <td><label for="productQuantity">Product Quantity</label></td>
                        <td><input type="number" id="productQuantity" name="productQuantity" 
                                 value="<%= rs.getInt("ProductQuantity") %>" min="0" required></td>
                    </tr>
                    <tr>
                        <td><label for="productPrice">Product Price</label></td>
                        <td><input type="number" step="0.01" id="productPrice" name="productPrice" 
                                 value="<%= rs.getDouble("ProductPrice") %>" min="0" required></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="submit">Update</button>
                        </td>
                    </tr>
                </table>
            </form>
            <%
                } else {
            %>
                <p style="color: red; text-align: center;">Error: Product data not found!</p>
                <p style="text-align: center;">
                    <a href="dashboard.jsp" style="color: blue; text-decoration: none;">Return to Dashboard</a>
                </p>
            <%
                }
            %>
        </div>
    </main>
</body>
</html>