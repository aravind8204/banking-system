<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style type="text/css">
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7; /* Light gray background */
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Header Styles */
        .header {
            width: 100%;
            background-color: #2196f3; /* Blue background */
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        /* Container Styles */
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 320px;
            text-align: center;
        }

        /* Form Styles */
        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #2196f3; /* Blue */
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"],
        input[type="password"],
        select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: #2196f3; /* Blue border on focus */
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #2196f3; /* Blue button */
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #1769b7; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="header">
        Gen Bank
    </div>
    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <input type="text" placeholder="Username" name="userid" id="userid" required="required" />
            <input type="password" placeholder="Password" name="pass" id="pass" required="required"/>
            <select name="type" required="required">
                <option value="">Select</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>
            <input type="submit" name="submit" id="submit" />
        </form>
    </div>
    <%
        String msg = request.getParameter("msg");
        if (msg != null && msg.equals("error1")) {
    %>
    <script type="text/javascript">
        (function(){
            window.alert("Invalid username or password");
        })();
    </script>

    <% } %>
    <%
        if (msg != null && msg.equals("error2")) {
    %>
    <script type="text/javascript">
        (function(){
            window.alert("Invalid account number or pin");
        })();
    </script>

    <% } %>
</body>
</html>