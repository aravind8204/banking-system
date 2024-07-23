<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.CustomerDAO" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer</title>
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f4f6f9; /* Light gray background */
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #343a40; /* Dark gray text */
}

form {
    background-color: #ffffff; /* White background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 600px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

td {
    padding: 10px;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="date"],
select {
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ced4da; /* Light gray border */
    border-radius: 5px;
    font-size: 14px;
    width: calc(100% - 22px); /* Adjusted for padding */
}

input[type="submit"],
input[type="button"] {
    background-color: #007bff; /* Blue */
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-right: 10px; /* Space between buttons */
}

input[type="submit"]:hover,
input[type="button"]:hover {
    background-color: #0056b3; /* Darker blue */
}

.go-back-button {
    background-color: #6c757d; /* Gray for "Go Back" */
}

.go-back-button:hover {
    background-color: #5a6268; /* Darker gray */
}

</style>
</head>
<body>
    <form action="UpdateUser" method="post">
        <table>
            <%
                long accno = Long.parseLong(request.getParameter("accno"));
                CustomerDAO dao = new CustomerDAO();
                List<Customer> customers = dao.searchCustomer(accno);
                if (customers == null) {
                    customers = dao.searchCustomer(accno);
                }
                Customer customer = customers.get(0);
            %>
            <tr>
                <td>Account Number</td>
                <td><input value="<%= customer.getAccountNo() %>" name="accno" id="accno" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" value="<%= customer.getName() %>" name="name" id="name"/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input value="<%= customer.getEmail() %>" type="email" name="email" id="email"/></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td><input type="tel" value="<%= customer.getMobile() %>" pattern="[0-9]{10}" name="mobile" id="mobile"/></td>
            </tr>
            <tr>
                <td>DOB</td>
                <td><input type="date" value="<%= customer.getDOB() %>" name="dob" id="dob"/></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" value="<%= customer.getAddress() %>" name="addr" id="addr"/></td>
            </tr>
            <tr>
                <td>Account Type</td>
                <% String acctype=customer.getAccountType(); %>
                <td><select name="acctype" required="required">
                    <option value="">select</option>
                    <option value="savings">Savings</option>
                    <option value="current">Current</option>
                </select></td>
            </tr>
            <tr>
                <td>Proof Number</td>
                <td><input type="text" value="<%= customer.getProof() %>" name="proof" id="proof"/></td>
            </tr>
        </table>

        <input type="submit" value="Update" />
        <input type="button" value="Go Back" class="go-back-button" onclick="window.history.back()" />
    </form>
</body>
</html>
