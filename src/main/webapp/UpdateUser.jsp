<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/inputproduct.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
<title>Update User</title>
</head>
<body>
	<ul>
        <li><a href="dashboard.jsp"><img src="resource/logo.png" height="20px"></a></li>
        <li><a href="Profile.jsp">Profile</a></li>
    </ul>
    <main>
    	<div class="form-container">
	        <h1>Update Profile</h1>
	        <form action="UpdateUserServlet" method="post">
	            <input type="hidden" name="userId" value="${user.UserId}">
	            <table>
	                <tr>
	                    <td><label for="userName">Username</label></td>
	                    <td><input type="text" id="userName" name="userName" value="${user.UserName}" required></td>
	                </tr>
	                <tr>
	                    <td><label for="userFullName">Full Name</label></td>
	                    <td><input type="text" id="userFullName" name="userFullName" value="${user.UserFullName}" required></td>
	                </tr>
	                <tr>
	                    <td><label for="userEmail">Email</label></td>
	                    <td><input type="email" id="userEmail" name="userEmail" value="${user.UserEmail}" required></td>
	                </tr>
	                <tr>
	                    <td><label for="userAddress">Address</label></td>
	                    <td><input type="text" id="userAddress" name="userAddress" value="${user.UserAddress}" required></td>
	                </tr>
	                <tr>
	                    <td colspan="2" style="text-align: center;">
	                        <button type="submit">Update</button>
	                    </td>
	                </tr>
	            </table>
	        </form>
	    </div>
    </main>
</body>
</html>
