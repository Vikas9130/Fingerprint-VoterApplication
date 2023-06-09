<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Model.Candidate"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Result</title>
<style>
/* CSS styles */
body {
	font-family: Arial, sans-serif;
}

h1 {
	color: #333;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

img {
	max-width: 100px;
	max-height: 100px;
}
</style>
</head>
<body>
	<h1>Candidate Results</h1>
	<table>
		<thead>
			<tr>
				<th>Candidate ID</th>
				<th>Name</th>
				<th>Photo</th>
				<th>Vote Count</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Candidate> candidates = (List<Candidate>) request.getAttribute("candidates");
			if (candidates != null) {
				for (Candidate candidate : candidates) {
			%>
			<tr>
				<td><%=candidate.getCandidateId()%></td>
				<td><%=candidate.getCandidateName()%></td>
				<td><img src="<%=candidate.getCandidatePhoto()%>"
					alt="Candidate Photo" height="100" width="100"></td>
				<td><%=candidate.getVoteCount()%></td>
			</tr>
			<%
			}
			}
			%>
		</tbody>
	</table>
</body>
</html>