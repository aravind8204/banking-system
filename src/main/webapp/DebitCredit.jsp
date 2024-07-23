<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transactions</title>
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

h2 {
    color: #343a40;
    text-align: center;
    margin-bottom: 20px;
}

.container {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 600px;
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
    padding: 10px;
    vertical-align: middle;
    text-align: left;
}

input, select {
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    font-size: 14px;
    width: 100%;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 100%;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

a {
    display: block;
    margin-bottom: 20px;
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
    <% long accno = Long.parseLong(request.getParameter("accno")); %>
    <div class="container">
        <a href="CustomerDashboard.jsp?accno=<%= accno %>">Go Back</a>
        <h2>Transaction</h2>
        <form action="Transactions" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>Account Number</td>
                        <td><input value="<%= accno %>" name="accno" id="accno" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="desc" id="desc" /></td>
                    </tr>
                    <tr>
                        <td>Transaction Type</td>
                        <td>
                            <select name="ttype" id="ttype">
                                <option value="">Select</option>
                                <option value="credit">Credit</option>
                                <option value="debit">Debit</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td><input type="number" min="0" max="25000" name="amt" id="amt" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Proceed" name="submit" />
        </form>
    </div>
    
    <% String msg=request.getParameter("msg");
    	if(msg!=null && msg.equals("high")){
    %>
    
    <% } %>
</body>
</html>
