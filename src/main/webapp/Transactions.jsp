<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.CustomerDAO" %>
<%@page import="java.util.List" %>
<%@page import="com.model.Transaction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statement</title>
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

button {
    padding: 10px 20px;
    background-color: #28a745;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-bottom: 20px;
}

button:hover {
    background-color: #218838;
}

a {
    padding: 10px 20px;
    background-color: #007bff; /* Blue background */
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    display: inline-block;
    margin-bottom: 20px;
}

a:hover {
    background-color: #0056b3; /* Darker blue background */
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: white;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
}

thead {
    background-color: #6c757d;
    color: white;
}

th, td {
    padding: 12px;
    text-align: left;
}

tbody tr:nth-child(even) {
    background-color: #f8f9fa;
}

tbody tr:hover {
    background-color: #dee2e6;
}
</style>
</head>
<body>
<% long accno=Long.parseLong(request.getParameter("accno")); %>
    <div>
    <button onclick="window.print()">Print</button>
    <a href="CustomerDashboard.jsp?accno=<%= accno %>">Go Back</a>
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Credit</th>
                    <th>Debit</th>
                    <th>Balance</th>
                </tr>
            </thead>
            <tbody>
                <%
                    
                    CustomerDAO dao = new CustomerDAO();
                    List<Transaction> customers = null;
                    if(customers == null){
                        customers = dao.getTransactions(accno);
                    }
                    int i = 1;
                    for(Transaction customer : customers){
                        
                %>
                    <tr>
                        <td><%= i++ %></td>
                        <td><%= customer.getDate() %></td>
                        <td><%= customer.getDescription() %></td>
                        <td><%= customer.getCredit() %></td>
                        <td><%= customer.getDebit() %></td>
                        <td><%= customer.getBalance() %></td>
                    </tr>
                
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
