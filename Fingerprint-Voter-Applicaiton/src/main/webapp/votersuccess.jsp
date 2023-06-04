
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Dao.UserDAO"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/body.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/style.css" type='text/css'>
<script type="text/javascript" src="js/formValidation.js"></script>
</head>
<body>


	<%
	Connection conn = UserDAO.getConnection();
	Statement statement = conn.createStatement();
	String userName = (String) session.getAttribute("userName");
	ResultSet resultset = statement.executeQuery(
			"SELECT voter_card_number, name, dob, address, userCreatedDate FROM voter WHERE name = '" + userName + "'");
	String imageFileName = (String) request.getAttribute("image1");
	System.out.println(imageFileName);
	%>

	<%
	while (resultset.next()) {
	%>

	<div class="container">
		<h1>Voter Details</h1>

		<div class="form-group">
			<label for="voter-card-number">Voter Card Number:<%=resultset.getString(1)%></label>
		</div>
		<div class="form-group">
			<label for="voter-name">Voter Name:<%=resultset.getString(2)%></label>
		</div>
		<div class="form-group">
			<label for="date-of-birth">Date of Birth:<%=resultset.getString(3)%></label>
		</div>
		<div class="form-group">
			<label for="address">Address:<%=resultset.getString(4)%></label>
		</div>
		<div class="form-group">
			<label>Voter Photo: </label> <img id="photo-preview"
				class="image-preview" src="voterImages/<%=imageFileName%>"
				alt="Photo Preview" width="125" height="150">
		</div>
		<div class="button-container">
			<a href="home.jsp" class="button-click">Login</a>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>




