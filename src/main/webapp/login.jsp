<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
<img src="resource/logo_white.png" alt="logo pict">
<form action=LoginServlet method=post>
	<table>
		<tr><td>Username: <input type=text name=txtUsername> </td></tr>
		<tr><td>Password: <input type=password name=txtPassword> </td></tr>
		<tr><td><input type=submit value=Login></td></tr>
	</table>	
<p>If you don't have an account, click <a href="register.jsp">here</a> to register.</p>
</form>
</body>
</html>


