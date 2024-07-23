<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.CustomerDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #eef2f7;
    margin: 0;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.header {
    width: 100%;
    background-color: #2c3e50; /* Dark background */
    color: #ecf0f1; /* Light text */
    padding: 20px 0;
    text-align: center;
    font-size: 32px;
    font-weight: bold;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

h2 {
    margin-top: 20px;
    color: #2c3e50;
}

h3 {
    color: #34495e;
}

.container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 800px;
    margin-top: 20px;
}

.links {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.links a {
    text-decoration: none;
    color: #ffffff;
    background-color: #3498db;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.links a:hover {
    background-color: #2980b9;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

td {
    padding: 12px;
    border-bottom: 1px solid #ecf0f1;
}

textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #bdc3c7;
    border-radius: 5px;
    resize: none;
    background-color: #ecf0f1;
}

td:first-child {
    font-weight: bold;
    background-color: #f2f4f7;
}

td:last-child {
    text-align: left;
}

</style>
</head>
<body>
    <%
    	String userid=(String) session.getAttribute("userid");
    
    	if(userid==null){
    		response.sendRedirect("Login.jsp");
    		return;
    	}
    	
    	long accno=Long.parseLong(userid);
        //long accno = Long.parseLong(request.getParameter("accno"));
    	
        CustomerDAO dao = new CustomerDAO();
        List<Customer> customers = dao.searchCustomer(Long.parseLong(userid));
        if (customers == null) {
            customers = dao.searchCustomer(Long.parseLong(userid));
        }
        String type = "Aadhaar card";
        Customer customer = customers.get(0);
    %>
    <div class="header">
        Gen Bank
    </div>
    <div class="container">
        <h2><%= customer.getName() %>'s Dashboard</h2>
        
        <div class="links">
            <a href="DebitCredit.jsp?accno=<%= accno %>">Transactions</a>
            <a href="Transactions.jsp?accno=<%= accno %>">Statement</a>
            <a href="UpdatePassword.jsp?accno=<%= accno %>">Update Password</a>
            <a href="ValidateCloseAccount?accno=<%= accno%>">Close Account</a>
            <a href="LogoutServlet">Logout</a>
        </div>
        
        <div>
            <h3>Profile Information</h3>
            <table>
                <tr>
                    <td>Account No</td>
                    <td><%= customer.getAccountNo() %></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%= customer.getName() %></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= customer.getEmail() %></td>
                </tr>
                <tr>
                    <td>Mobile</td>
                    <td><%= customer.getMobile() %></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea readonly><%= customer.getAddress() %></textarea></td>
                </tr>
                <tr>
                    <td>Account Type</td>
                    <td><%= customer.getAccountType() %></td>
                </tr>
                <tr>
                    <td>Balance</td>
                    <td><%= customer.getBalance() %></td>
                </tr>
                <tr>
                    <td>ID Proof Type</td>
                    <td><%= type %></td>
                </tr>
                <tr>
                    <td>ID Number</td>
                    <td><%= customer.getProof() %></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
