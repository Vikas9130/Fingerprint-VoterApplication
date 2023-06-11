<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Candidate</title>
<link rel="stylesheet" href="css/style.css" type='text/css' />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<% String mes1 = (String) session.getAttribute("successMessage"); %>
<h1><%= mes1 %></h1>

	<div class="container">
<button class="button-center" onclick="redirectToAdminPanelPage()">Home</button>
			<script>
				function redirectToAdminPanelPage() {
					window.location.href = "adminSuccess.jsp";
				}
			</script>
</div>

</body>
</html>