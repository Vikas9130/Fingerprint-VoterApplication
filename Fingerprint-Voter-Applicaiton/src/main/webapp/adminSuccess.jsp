<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type='text/css'>
<style>
.button-container {
	margin: 10px;
}

.button {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}
</style>
</head>



<body>

<%
    String message= request.getParameter("msg");
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="container">
	<button class="submit-button" onclick="redirectToAddCandidate()">Add
		Candidate</button>

	<script>
		function redirectToAddCandidate() {
			window.location.href = "addCandidate.jsp";
		}
	</script>

	<button class="submit-button" onclick="redirectToDeleteCandidate()">Delete
		Candidate</button>

	<script>
		function redirectToDeleteCandidate() {
			window.location.href = "deleteCandidate.jsp";
		}
	</script>


<button class="submit-button" onclick="redirectToResult()">Result</button>

	<script>
		function redirectToResult() {
			window.location.href = "result.jsp";
		}
	</script>
	
	<button class="submit-button" onclick="redirectToAddParty()">Add Party</button>

	<script>
		function redirectToAddParty() {
			window.location.href = "addParty.jsp";
		}
	</script>
	
	<button class="submit-button" onclick="redirectToViewParty()">View Party</button>

	<script>
		function redirectToViewParty() {
			window.location.href = "viewParty.jsp";
		}
	</script>


</div>






</body>
</html>