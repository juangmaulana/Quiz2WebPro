<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/inputproduct.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
<title>Storify</title>
</head>
<body>
	<ul>
        <li><a href="dashboard.jsp"><img src="resource/logo.png" height="20px"></a></li>
        <li><a class="active" href="InputProduct.jsp">Input Product</a></li>
        <li><a href="profile.jsp">Profile</a></li>
    </ul>
    <main>
    	<div class="form-container">
	        <h1>Insert Product</h1>
	        <form action="InputProductServlet" method="post">
	            <table>
	                <tr>
	                    <td><label for="productName">Product Name</label></td>
	                    <td><input type="text" id="productName" name="productName" required></td>
	                </tr>
	                <tr>
	                    <td><label for="productQuantity">Product Quantity</label></td>
	                    <td><input type="number" id="productQuantity" name="productQuantity" required></td>
	                </tr>
	                <tr>
	                    <td><label for="productPrice">Product Price</label></td>
	                    <td><input type="number" step="0.01" id="productPrice" name="productPrice" required></td>
	                </tr>
	                <tr>
	                    <td colspan="2" style="text-align: center;">
	                        <button type="submit">Submit</button>
	                    </td>
	                </tr>
	            </table>
	        </form>
	    </div>
    </main>
</body>
</html>