<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Close Account</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f4f6f9;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

h4, h5 {
    color: #343a40;
    text-align: center;
    margin-bottom: 20px;
}

form {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
    text-align: center;
}

label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: #343a40;
    text-align: left;
}

input {
    width: calc(100% - 20px); /* Adjusted for padding and border */
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    font-size: 14px;
}

input[type="submit"] {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 100%;
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #c82333;
}

a {
    display: block;
    margin-top: 20px;
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s;
}

a:hover {
    color: #0056b3;
}

</style>
</head>
<body style="display:flex;flex-direction:column;">
<%
	String accno = request.getParameter("accno");
	String msg = request.getParameter("msg");
	long bal = Long.parseLong(request.getParameter("balance"));
%>
<h4>Close Account</h4>
<form action="CloseAccount" method="post" id="closeAccountForm">
    <label for="accno">Account Number:</label>
    <input type="text" name="accno" id="accno" value="<%= accno %>" required readonly />

    <% if ("false".equals(msg)) { %>
        <h5>Your Balance: <%= bal %></h5>
        <h5>Your balance must be 0 (zero).</h5>
    <% } else { %>
        <input type="submit" value="Close Account" id="submit" />
    <% } %>
    
    <a href="CustomerDashboard.jsp?accno=<%= accno %>">Go Back</a>
</form>
</body>
</html>
