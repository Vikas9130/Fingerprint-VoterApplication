<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Dao.UserDAO"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/style.css" type='text/css' />
<script type="text/javascript" src="js/formValidation.js"></script>



</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>


	<%
	Connection conn = UserDAO.getConnection();
	Statement statement = conn.createStatement();
	String voterId = (String) session.getAttribute("voterId");
	ResultSet resultset = statement.executeQuery(
			"SELECT voter_card_number, name, dob, address, image FROM voter WHERE voter_card_number = '" + voterId + "'");
	
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
				class="image-preview" src="voterImages/<%=resultset.getString(5)%>"
				alt="Photo Preview" width="125" height="150">
		</div>
		<div class="container">

			<button class="button-left" onclick="redirectToNextPage()">Vote</button>

			<script>
				function redirectToNextPage() {
					window.location.href = "candidateList.jsp";
				}
			</script>
		
			<button class="button-right" onclick="redirectToUpdatePage()">Update
				Details</button>
			<script>
				function redirectToUpdatePage() {
					window.location.href = "voterUpdation.jsp";
				}
			</script>

			<button class="button-center" onclick="redirectToResultPage()">Result</button>
			<script>
				function redirectToResultPage() {
					window.location.href = "result.jsp";
				}
			</script>
		</div>
</div>
		<%
		}
		%>
	
</body>
</html>