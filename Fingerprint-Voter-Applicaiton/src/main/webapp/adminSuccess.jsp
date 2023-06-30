<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		.button-container {
			margin: 10px;
		}

		.submit-button {
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

<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="container mt-5">
	<div class="row">
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToAddCandidate()">Add Candidate</button>
		</div>
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToDeleteCandidate()">Delete Candidate</button>
		</div>
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToResultPage()">Declare Result</button>
		</div>
	</div>

	<div class="row mt-3">
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToAddParty()">Add Party</button>
		</div>
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToViewParty()">View Party</button>
		</div>
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToCandidateList()">View Candidate List</button>
		</div>
	</div>

	<div class="row mt-3">
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToContactUs()">Manage Contact Us</button>
		</div>
		<div class="col-md-4">
			<button class="submit-button btn btn-primary" onclick="redirectToViewVoterList()">View Voter List</button>
		</div>
	</div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	function redirectToAddCandidate() {
		window.location.href = "addCandidate.jsp";
	}

	function redirectToDeleteCandidate() {
		window.location.href = "deleteCandidate.jsp";
	}

	function redirectToResultPage() {
		window.location.href = "ResultDeclarationServlet";
	}

	function redirectToAddParty() {
		window.location.href = "addParty.jsp";
	}

	function redirectToViewParty() {
		window.location.href = "viewParty.jsp";
	}

	function redirectToCandidateList() {
		window.location.href = "wholeCandidateList.jsp";
	}

	function redirectToContactUs() {
		window.location.href = "adminContactUs.jsp";
	}

	function redirectToViewVoterList() {
		window.location.href = "viewAllVoters.jsp";
	}
</script>

</body>
</html>
