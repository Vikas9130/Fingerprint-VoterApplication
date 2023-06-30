<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Candidate</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		.form-group img {
			margin-left: 60px;
			margin-bottom: 10px;
		}

		.mandatory {
			color: red;
			margin-left: 5px;
		}

		.small-form {
			max-width: 400px;
			margin: 0 auto;
		}

		.title {
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1 class="mt-5 title">Add Candidate</h1>
		<form action="AddCandidateServlet" method="post" enctype="multipart/form-data" class="small-form">
			<div class="form-group">
				<label for="name">Candidate Name:</label>
				<input type="text" id="name" name="name" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="gender">Gender:</label>
				<select id="gender" name="gender" class="form-control" required>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="other">Other</option>
				</select>
			</div>
			<div class="form-group">
				<label for="birthdate">Birth Date:</label>
				<input type="date" id="birthdate" name="birthdate" class="form-control">
			</div>
			<div class="form-group">
				<label for="address">Address:</label>
				<textarea id="address" name="address" rows="4" cols="50" class="form-control" required></textarea>
			</div>
			<p>
				<span class="mandatory">*Please add space after four digits.</span>
			</p>
			<div class="form-group">
				<label for="aadhaar">Aadhaar Number:</label>
				<input type="text" id="aadhaar" name="aadhaar" pattern="[0-9]{4} [0-9]{4} [0-9]{4}" class="form-control">
			</div>
			<div class="form-group">
				<label for="photo">Photo:</label>
				<input type="file" id="photo" name="photo" accept="image/*" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="partyName">Select Party:</label>
				<select name="partyName" class="form-control">
					<%
    // Establish database connection
    String url = "jdbc:mysql://localhost:3306/evoting";
    String username = "root";
    String password = "system";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String query = "SELECT party_name FROM party";
        resultSet = statement.executeQuery(query);
        // Create ArrayList to store party names
        ArrayList<String> partyNames = new ArrayList<>();
        while (resultSet.next()) {
            String partyName = resultSet.getString("party_name");
            partyNames.add(partyName);
        }
        
        for (String partyName : partyNames) { %>
        <option value="<%= partyName %>"><%= partyName %></option>
      <% } %>
        <%
        // Set partyNames as a request attribute
        request.setAttribute("partyNames", partyNames);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        // Close the database resources
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
%>



				</select>
			</div>
			<div class="button-container">
	
	<input type="submit" class="btn btn-primary" value="Add Candidate">
	<button class="btn btn-primary mr-2" onclick="redirectToAdminPanel()">Home</button>
</div>

		</form>
	</div>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		function redirectToAdminPanel() {
			window.location.href = "adminSuccess.jsp";
		}
	</script>
</body>
</html>
