<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
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
    color: #343a40;
}

h3 {
    background-color: white;
    padding: 15px 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 600px;
    text-align: center;
    margin: 0;
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
<body>
	<% String msg=request.getParameter("msg"); %>
	<h3><%= msg %></h3>
	<a onClick="window.history.back()">Go Back</a>
</body>
</html>
