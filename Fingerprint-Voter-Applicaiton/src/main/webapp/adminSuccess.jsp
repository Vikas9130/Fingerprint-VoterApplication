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
	<button class="submit-button" onclick="redirectToNextPage()">Add Candidate</button>

    <script>
        function redirectToNextPage() {
            window.location.href = "addCandidate.jsp";
        }
    </script>
    
    <button class="submit-button" onclick="redirectToNextPage()">Delete Candidate</button>

    <script>
        function redirectToNextPage() {
            window.location.href = "deleteCandidate.jsp";
        }
    </script>









</body>
</html>