<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f4f6f9;
    margin: 0;
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

h4 {
    color: #343a40;
    text-align: center;
}

form {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: #343a40;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="date"],
input[type="number"],
select {
    width: calc(100% - 22px); /* Adjusted for padding and border */
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    font-size: 14px;
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
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

button {
    background-color: #17a2b8;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-bottom: 20px;
}

button:hover {
    background-color: #138496;
}

</style>
</head>
<body>
<button onclick="window.history.back()">Go Back</button>
<h4>Register Customer</h4>
<form action="Newcustomer" method="post" id="sec">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" required="required" />

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required="required" />

    <label for="mobile">Mobile:</label>
    <input type="tel" pattern="[0-9]{10}" name="mobile" id="mobile" required="required" />

    <label for="addr">Address:</label>
    <input type="text" name="addr" id="addr" required="required" />

    <label for="dob">DOB:</label>
    <input type="date" name="dob" id="dob" />

    <label for="amt">Initial Amount:</label>
    <input type="number" min="1000" name="amt" id="amt" required="required" />

    <label for="acctype">Account Type:</label>
    <select name="acctype" required="required">
        <option value="">Select</option>
        <option value="savings">Savings</option>
        <option value="current">Current</option>
    </select>

    <label for="ptype">Id Proof Type:</label>
    <select name="ptype">
        <option value="">Select</option>
        <option value="ano">Aadhaar Number</option>
    </select>

    <label for="proof">ID Proof Number:</label>
    <input type="tel" pattern="[0-9]{12}" name="proof" id="proof" required="required" />

    <input type="hidden" value="open" name="accstatus" id="accstatus" />
    <input type="submit" value="Submit" id="submit" />
</form>
</body>
</html>
