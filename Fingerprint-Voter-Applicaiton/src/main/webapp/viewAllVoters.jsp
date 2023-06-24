<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.Controller.Voter.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Voters List</title>
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
<jsp:include page="adminHeader.jsp"></jsp:include>
    <table>
        <thead>
            <tr>
                <th>Voter Card Number</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Aadhar Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Created Date</th>
                <th>Image</th>
            </tr>
        </thead>
        <tbody>
            <%-- Retrieve data from the database and iterate over the result set --%>
            <% 
            // Assuming you have a method that fetches data from the database and returns a ResultSet.
            ResultSet resultSet = VoterDataRetriever.fetchVotersData();

            while (resultSet.next()) {
                String voterCardNumber = resultSet.getString("voter_card_number");
                String firstName = resultSet.getString("firstname");
                String middleName = resultSet.getString("middlename");
                String lastName = resultSet.getString("lastname");
                String gender = resultSet.getString("gender");
                String dob = resultSet.getString("dob");
                String aadhar = resultSet.getString("aadhar");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String createdDate = resultSet.getString("userCreatedDate");
                String image = resultSet.getString("image");
            %>
            <tr>
                <td><%= voterCardNumber %></td>
                <td><%= firstName %></td>
                <td><%= middleName %></td>
                <td><%= lastName %></td>
                <td><%= gender %></td>
                <td><%= dob %></td>
                <td><%= aadhar %></td>
                <td><%= email %></td>
                <td><%= address %></td>
                <td><%= createdDate %></td>
                <td><img src="voterImages/<%= image %>" alt="User Image" width="100" height="100"></td>
            </tr>
            <% 
            }
            // Close the ResultSet and database connection after you finish working with it.
            resultSet.close();
            %>
        </tbody>
    </table>
    <button class="submit-button" onclick="printPage()">Print</button>
</body>
</html>
