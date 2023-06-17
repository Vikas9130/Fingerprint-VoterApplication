<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
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


<button class="submit-button" onclick="redirectToResultPage()">Declare Result</button>

	<script>
	function redirectToResultPage() {
		window.location.href = "ResultDeclarationServlet";
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
	
	<button class="submit-button" onclick="redirectToCandidateList()">View Candidate List</button>

	<script>
		function redirectToCandidateList() {
			window.location.href = "wholeCandidateList.jsp";
		}
	</script>

	


</div>






</body>
</html>