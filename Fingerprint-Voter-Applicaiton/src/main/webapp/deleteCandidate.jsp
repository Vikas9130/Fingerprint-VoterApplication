<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.Model.Candidate" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>

	<h1>Candidates</h1>
	<form action="DeleteCandidate" method="get">
		<input type="text" name="searchName" placeholder="Search by name">
		<button type="submit">Search</button>
	</form>
	<br>
	<table>
		<thead>
			<tr>
				<th>Candidate ID</th>
				<th>Name</th>
				<th>Address</th>
				<th>Delete</th>
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
				<td><%=candidate.getCandidateAddress()%></td>
				<td>
					<form action="DeleteCandidate" method="post">
						<input type="hidden" name="candidateId"
							value="<%=candidate.getCandidateId()%>">
						<button type="submit">Delete</button>
					</form>
				</td>
			</tr>
			<%
		        }
			}
			%>
		</tbody>
	</table>

</body>
</html>