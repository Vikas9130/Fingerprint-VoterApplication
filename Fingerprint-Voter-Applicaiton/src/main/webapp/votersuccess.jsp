
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Dao.UserDAO"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/body.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="js/formValidation.js"></script>
</head>
<body>
	<script type="text/javascript">
		
	<%String message = request.getParameter("msg");
if (message != null) {
	if (message.equals("date")) {%>
		alert("Please enter valid date! You should be 18 to give vote");
		window.location.href = "register.jsp";
	<%}
						}%>
		
	</script>

	<jsp:include page="header.jsp"></jsp:include>
	<%
	Connection conn = UserDAO.getConnection();
	Statement statement = conn.createStatement();
	ResultSet resultset = statement.executeQuery("select voter_card_number, name, gender, dob, address, userCreatedDate, image from voter where voter_card_number='FVAV000020'");
	%>

	<%
	while (resultset.next()) {
	%>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="<%=request.getContextPath()%>/Register"
					name="register" method="post" onsubmit="return regValid()"
					style="max-width: 350px; margin: auto">
					<center>
						<div class="container">

							<table>
								<tr>
									<th>Voter Card Number:</th>
									<td><%=resultset.getString(1)%></td>
								</tr>
								<tr>
									<th>Voter Name:</th>
									<td><%=resultset.getString(2)%></td>
								</tr>
								<tr>
									<th>Gender:</th>
									<td><%=resultset.getString(3)%></td>
								</tr>
								<tr>
									<th>Date of Birth:</th>
									<td><%=resultset.getString(4)%></td>
								</tr>
								<tr>
									<th>Address:</th>
									<td><%=resultset.getString(5)%></td>
								</tr>
								<tr>
									<th>Date:</th>
									<td><%=resultset.getString(6)%></td>
								</tr>
								<tr>
									<th>Image:</th>
									<td> <img src="+'"${<%=resultset.getString(7)%>}'"+" width="240" height="300"/></td>
								</tr>
								<%
								}
								%>
							</table>



						</div>
						<div class="container signin">
							<%
							if (message != null) {
								if (message.equals("failed")) {
							%>
							<img src="images/alert-16.png" alt="Computer Man"
								style="width: 23px; height: 23px;" autofocus> <font
								color="#ff0000">Failed to Register</font>
							<%
							}
							}
							%>
							<small><p>
									Already have an account? <a href="home.jsp">Sign in</a>.
								</p></small>
						</div>
					</center>
				</form>
				<div class="login100-more"
					style="background-image: url('images/ele.jpeg');"></div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>




