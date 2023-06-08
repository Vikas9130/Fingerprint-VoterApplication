<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
	<button onclick="redirectToNextPage()">Add Candidate</button>

    <script>
        function redirectToNextPage() {
            window.location.href = "addCandidate.jsp";
        }
    </script>









</body>
</html>