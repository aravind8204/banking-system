<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.CustomerDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f0f0f0; /* Light gray background */
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
    color: #2c3e50; /* Dark text */
}

h3 {
    margin-top: 10px;
    color: #2c3e50; /* Dark text */
}

.container {
    background-color: #ecf0f1; /* Light background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 1200px;
    margin-top: 20px;
}

.header .button-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header .button-container button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.header .button-container .register-button {
    background-color: #27ae60; /* Green background */
}

.header .button-container .register-button:hover {
    background-color: #229954; /* Darker green background */
}

.header .button-container .logout-button {
    background-color: #c0392b; /* Red background */
}

.header .button-container .logout-button:hover {
    background-color: #a93226; /* Darker red background */
}

input[type="search"] {
    padding: 10px;
    margin-right: 10px;
    border: 1px solid #ced4da; /* Light gray border */
    border-radius: 5px;
    font-size: 14px;
    flex: 1;
}





.table-wrapper {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #ced4da; /* Light gray border */
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ced4da; /* Light gray border */
    vertical-align: middle;
}

th {
    background-color: #3498db; /* Blue background */
    color: #ecf0f1; /* Light text */
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #f7f7f7; /* Light gray */
}

tr:hover {
    background-color: #e0e0e0; /* Slightly darker gray */
}

.button-link {
    padding: 5px 10px;
    margin-right: 5px;
    border: none;
    border-radius: 5px;
    color: white;
    text-align: center;
    cursor: pointer;
    text-decoration: none;
    font-size: 14px;
    transition: background-color 0.3s;
    display: inline-block;
    white-space: nowrap;
}

.update-button {
    background-color: #27ae60; /* Green background */
}

.update-button:hover {
    background-color: #229954; /* Darker green background */
}

.delete-button {
    background-color: #c0392b; /* Red background */
}

.delete-button:hover {
    background-color: #a93226; /* Darker red background */
}

@media (max-width: 768px) {
    .header .button-container {
        flex-direction: column;
        align-items: flex-start;
    }

    .header .button-container button {
        margin-bottom: 10px;
    }

    .search-container {
        flex-direction: column;
        align-items: flex-start;
    }

    .search-container input[type="search"] {
        margin-bottom: 10px;
    }
}
</style>
</head>
<body>
    <div class="header">
        Gen Bank
    </div>
    
    <div class="container">
        <div class="header">
            <h3 style="color:white">Admin Dashboard</h3>
            <div class="button-container">
                <button class="register-button" onclick="window.location.href='CustomerRegister.jsp'">Register Customer</button>
                <button class="logout-button" onclick="window.location.href='LogoutServlet'">Logout</button>
            </div>
        </div>
        
        
        
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Full Name</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>DOB</th>
                        <th>Account Type</th>
                        <th>Account Number</th>
                        <th>Account Status</th>
                        <th>ID Proof Type</th>
                        <th>ID Proof No</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    String userid=(String) session.getAttribute("userid");
                    
                    if(userid==null){
                        response.sendRedirect("Login.jsp");
                        return;
                    }
                    CustomerDAO dao = new CustomerDAO();
                    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                    if (customers == null) {
                        customers = dao.getAllCustomers();
                    }
                    String type = "Aadhaar card";
                    int i = 1;
                    for (Customer customer : customers) {
                    %>
                    <tr>
                        <td><%= i++ %></td>
                        <td><%= customer.getName() %></td>
                        <td><%= customer.getAddress() %></td>
                        <td><%= customer.getMobile() %></td>
                        <td><%= customer.getEmail() %></td>
                        <td><%= customer.getDOB() %></td>
                        <td><%= customer.getAccountType() %></td>
                        <td><%= customer.getAccountNo() %></td>
                        <td><%= customer.getAccountStatus() %></td>
                        <td><%= type %></td>
                        <td><%= customer.getProof() %></td>
                        <td class="action-links">
                            <a href="UpdateCustomer.jsp?accno=<%= customer.getAccountNo() %>" class="button-link update-button">Update</a>
                            <a href="DeleteCustomer?accno=<%= customer.getAccountNo() %>" class="button-link delete-button">Delete</a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
