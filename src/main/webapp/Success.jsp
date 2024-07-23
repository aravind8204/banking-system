<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
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
    height: 100vh;
    color: #343a40;
}

h4 {
    background-color: white;
    padding: 15px 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 600px;
    text-align: center;
    margin: 10px 0;
}

button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    margin-top: 20px;
}

button:hover {
    background-color: #0056b3;
    transform: scale(1.05);
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
<% 
    String msg = request.getParameter("msg"); 
    String email = (String) session.getAttribute("email");
    String name = (String) session.getAttribute("name");
    String accno = request.getParameter("accno");
    String pin = request.getParameter("pin");
    String method=(String) session.getAttribute("method");
    String maskedPin = pin != null ? "*".repeat(pin.length()) : null; // Masking the pin
%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
<script type="text/javascript">
    (function() {
        emailjs.init("GzWI8GFdBI5n0kjHB");
    })();

    function sendMail() {
        let params = {
            to_name: "<%= name %>",
            email: "<%= email %>",
            message: `Hi, <%= name %>!\n\nYour account details are as follows:\n\nACCOUNT NO: <%= accno %>\nTEMPORARY PASSWORD: <%= pin %>\n\nPlease change your password upon first login.`
        };
        emailjs.send("service_0w2m39a", "template_ysmp14i", params)
            .then((response) => {
                alert("Email sent successfully!");
            })
            .catch((error) => {
                console.error("Error sending email:", error);
                alert("Failed to send email. Please try again.");
            });
    }
</script>
</head>
<body>
    <h4> <%= msg %> </h4>
    <% if(accno != null) { %>
        <h4> <%= accno %> </h4>
    <% } %>
    <% if(pin != null) { %>
        <h4> <%= maskedPin %> </h4> <!-- Displaying masked pin -->
    <% } %>
    <% if(method!=null && method.equals("insert"))
    	{%>
    <button onClick="sendMail()">Send Email</button>
    <%} %>
    <a onClick="window.history.back()">Go Back</a>
</body>
</html>
