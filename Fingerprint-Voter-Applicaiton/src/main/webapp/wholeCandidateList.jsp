<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.Model.Candidate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>View Candidates</title>
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
 
  <style>
        /* Optional CSS styles for the print button */
        .print-button {
            margin-bottom: 20px;
        }
    </style>
    <script>
        function printPage() {
            window.print();
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>Candidates List</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Birth</th>
                <th>Address</th>
                <th>Aadhar</th>
                <th>Photo</th>
                <th>Party ID</th>
                <th>Vote Count</th>
            </tr>
        </thead>
        <tbody>
            <%-- Retrieve candidate data from the server-side --%>
            <%
            String jdbcUrl = "jdbc:mysql://localhost:3306/evoting";
    	    String username = "root";
    	    String password = "system";
    	    Connection connection = null;
    	    Statement statement = null;
    	    ResultSet resultSet = null;
                // Code to retrieve candidate data from the database and store it in a List or ResultSet

                // Example code to demonstrate the data retrieval process
                List<Candidate> candidates = new ArrayList<>();

                try {
                	
                    // Make a database connection and execute a SELECT query to fetch candidate data
                      Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        statement = connection.createStatement();
                   resultSet = statement.executeQuery("SELECT * FROM candidate");

                    // Iterate over the result set and populate the candidate list
                    while (resultSet.next()) {
                      Candidate candidate = new Candidate();
                        candidate.setId(resultSet.getInt("candidate_id"));
                        candidate.setName(resultSet.getString("candidate_name"));
                        candidate.setGender(resultSet.getString("candidate_gender"));
                        candidate.setBirth(resultSet.getString("candidate_birth"));
                        candidate.setAddress(resultSet.getString("candidate_address"));
                        candidate.setAadhar(resultSet.getString("candidate_aadhar"));
                        candidate.setPhoto(resultSet.getString("candidate_photo"));
                        candidate.setPartyId(resultSet.getInt("party_id"));
                        candidate.setVoteCount(resultSet.getInt("vote_count"));
                        candidates.add(candidate);
                    }

                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                // Iterate over the candidates list and display the data in HTML table rows
                for (Candidate candidate : candidates) {
                    %>
                    <tr>
                        <td><%= candidate.getId() %></td>
                        <td><%= candidate.getName() %></td>
                        <td><%= candidate.getGender() %></td>
                        <td><%= candidate.getBirth() %></td>
                        <td><%= candidate.getAddress() %></td>
                        <td><%= candidate.getAadhar() %></td>
                        <td><%= candidate.getPhoto() %></td>
                        <td><%= candidate.getPartyId() %></td>
                        <td><%= candidate.getVoteCount() %></td>
                    </tr>
                    <%
                }
            %>
        </tbody>
    </table>
<button class="submit-button" onclick="printPage()">Print</button>

</body>
</html>