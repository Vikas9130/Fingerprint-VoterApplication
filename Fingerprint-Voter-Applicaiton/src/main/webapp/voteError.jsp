<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vote Error</title>
<link rel="stylesheet" href="css/style.css" type='text/css' />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<% String mes = (String) session.getAttribute("errorMessage"); %>
<h1><%= mes %></h1>


	<div class="container">
<button class="button-center" onclick="redirectToVoterHomePage()">Home</button>
			<script>
				function redirectToVoterHomePage() {
					window.location.href = "voterHome.jsp";
				}
			</script>
</div>
</body>
</html>