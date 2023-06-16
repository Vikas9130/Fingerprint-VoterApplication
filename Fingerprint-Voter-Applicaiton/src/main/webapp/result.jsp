<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Model.Candidate"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Result</title>
<link rel="stylesheet" href="css/style.css" type='text/css' />
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
	<jsp:include page="header.jsp"></jsp:include>

	<%
	// Establish a connection to the database
	String url = "jdbc:mysql://localhost:3306/evoting";
	String username = "root";
	String password = "system";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, username, password);

	// Create a statement to execute the query
	Statement stmt = conn.createStatement();

	// Execute the query to retrieve data in decreasing order of vote_count
	String query = "SELECT candidate_name, candidate_gender, candidate_photo, vote_count " + "FROM candidate "
			+ "ORDER BY vote_count DESC";
	ResultSet rs = stmt.executeQuery(query);
	%>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>Candidate Name</th>
					<th>Gender</th>
					<th>Photo</th>
					<th>Vote Count</th>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("candidate_name")%></td>
					<td><%=rs.getString("candidate_gender")%></td>
					<td><img src="candidateImages/<%=rs.getString("candidate_photo")%>"
						alt="Candidate Photo"></td>
					<td><%=rs.getInt("vote_count")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<button class="button-center" onclick="redirectToVoterHomePage()">Home</button>
		<script>
			function redirectToVoterHomePage() {
				window.location.href = "voterHome.jsp";
			}
		</script>

	</div>
	<%
	rs.close();
	stmt.close();
	conn.close();
	%>
</body>
</html>