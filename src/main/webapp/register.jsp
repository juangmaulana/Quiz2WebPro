<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="form-container">
        <form action="RegisterServlet" method="post">
            <label for="txtUsername">Enter Username:</label>
            <input type="text" id="txtUsername" name="txtUsername">

            <label for="txtFullName">Enter Full Name:</label>
            <input type="text" id="txtFullName" name="txtFullName">

            <label for="txtEmail">Enter Email:</label>
            <input type="text" id="txtEmail" name="txtEmail">

            <label for="txtAddress">Enter Address:</label>
            <input type="text" id="txtAddress" name="txtAddress">

            <label>Enter Date of Birth:</label>
            <div class="dob-container">
                <select id="dobDay" name="dobDay">
                    <option value="" disabled selected>Day</option>
                    <% for (int i = 1; i <= 31; i++) { %>
                        <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
                <select id="dobMonth" name="dobMonth">
                    <option value="" disabled selected>Month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select id="dobYear" name="dobYear">
                    <option value="" disabled selected>Year</option>
                    <% for (int i = 1900; i <= 2024; i++) { %>
                        <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
            </div>

            <label for="txtPassword">Enter Password:</label>
            <input type="password" id="txtPassword" name="txtPassword">
			
            <input type="submit" value="Register">

            <p>If you already have an account, click <a href="login.jsp">here</a> to login.</p>
        </form>
    </div>
</body>
</html>