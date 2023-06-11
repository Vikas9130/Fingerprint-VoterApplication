<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String mes1 = (String) session.getAttribute("successMessage"); %>
<h1><%= mes1 %></h1>

</body>
</html>