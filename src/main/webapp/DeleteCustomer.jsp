<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String acno=request.getParameter("accno"); %>
<jsp:include page="/deletecustomer">
	<jsp:param name="accno" value="<%= acno %>"></jsp:param>
</jsp:include>
</body>
</html>