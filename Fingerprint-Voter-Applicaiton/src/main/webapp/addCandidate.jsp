<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Candidate</title>
<link rel="stylesheet" href="css/style.css" type='text/css'>
</head>



<body>
	<div class="container">
		<h1>Add Candidate</h1>
		<form action="AddCandidateServlet" method="post"
			enctype="multipart/form-data">
			
			<label for="name">Candidate Name:</label>
			<input type="text" id="name" name="name" required><br> <br> 
			
			<label for="gender">Gender:</label>
			<select id="gender" name="gender"
				required>
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="female">Other</option>
			</select><br> <br> 
			
			<label for="birthdate">Birth Date:</label> <input
				type="date" id="birthdate" name="birthdate"> 
				
			<label
				for="address">Address:</label>
			<textarea id="address" name="address" rows="4" cols="50" required></textarea>
			<br> <br> 
			
			<label for="aadhaar">Aadhaar Number:</label>
			<input type="text" id="aadhaar" name="aadhaar" pattern="[0-9]{4} [0-9]{4} [0-9]{4}">
			
			
			<label for="photo">Photo:</label> <input
				type="file" id="photo" name="photo" accept="image/*" required><br>
			<br> 
				
			 <label for="photo">Select Party:</label>
			 <select name="partyName">
			 
			 
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
        <br/><br/>
        
        <input class="submit-button" type="submit"
				value="Add Candidate">
		</form>
		
	</div>

</body>
</html>