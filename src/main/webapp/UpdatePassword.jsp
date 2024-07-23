<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Password</title>
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #eef2f7;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #2c3e50;
}

.container {
    background-color: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 450px;
}

form {
    width: 100%;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

td {
    padding: 12px 0;
    vertical-align: middle;
}

input[type="text"],
input[type="password"] {
    padding: 12px;
    margin-top: 5px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    font-size: 14px;
    width: calc(100% - 24px); /* Adjusted for padding */
}

input[type="submit"] {
    background-color: #17a2b8;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 100%;
}

input[type="submit"]:hover {
    background-color: #138496;
}

a {
    display: inline-block;
    margin-bottom: 20px;
    padding: 10px 20px;
    background-color: #007bff; /* Blue background */
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

a:hover {
    background-color: #0056b3; /* Darker blue background */
}

</style>
</head>
<body>
    <% String accno = request.getParameter("accno"); %>
    <div class="container">
        <a href="CustomerDashboard.jsp?accno=<%= accno %>">Go Back</a>
        <form action="UpdatePassword" method="post">
            <table>
                <tr>
                    <td>Account Number</td>
                    <td><input type="text" value="<%= accno %>" name="accno" id="accno" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>Current Password</td>
                    <td><input type="password" name="curpass" id="curpass" /></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="newpass" id="newpass" /></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="conpass" id="conpass" /></td>
                </tr>
            </table>
            <input type="submit" value="Update" />
        </form>
    </div>
</body>
</html>
