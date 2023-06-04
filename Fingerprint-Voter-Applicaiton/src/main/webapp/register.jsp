<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/body.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/style.css" type='text/css' />
<script type="text/javascript" src="js/formValidation.js"></script>

<style>
.form-group img {
	margin-left: 60px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<script type="text/javascript">
		
	<%
		String message = request.getParameter("msg");
		if (message != null && message.equals("date")) {
	%>
			alert("Please enter a valid date! You should be 18 to vote.");
			window.location.href = "register.jsp";
	<%
		}
	%>
		
	</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="${pageContext.request.contextPath}/Register"
					name="register" method="post" enctype="multipart/form-data"
					onsubmit="return regValid()" style="max-width: 350px; margin: auto">

					<div class="container">
						<h1>Register</h1>
						<p>Please fill in this form to create an account.</p>
						<hr>
						<div class="form-group">
							<label for="name">Full Name:</label> <input type="text" id="name"
								placeholder="Enter Full Name" name="name" required>
						</div>
						<div class="form-group">
							<label for="gender">Gender:</label> <select id="gender"
								name="gender" style="width: 270px; height: 33px;" required>
								<option disabled selected>Select Gender</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
						<div class="form-group">
							<label for="dob">Date of Birth:</label> <input type="date"
								id="dob" name="dob" required>
						</div>
						<div class="form-group">
							<label for="email">Email:</label> <input type="email" id="email"
								placeholder="Enter Email" name="email" required>
						</div>
						<div class="form-group">
							<label for="address">Address:</label>
							<textarea id="address" name="address" rows="4"></textarea>
						</div>
						<div class="form-group">
							<label for="password">Password:</label> <input type="password"
								id="password" placeholder="Enter Password" name="password"
								required>
						</div>
						<hr>


						<div class="form-group">

							<label for="image">Upload Photo:</label> <input type="file"
								class="file-input" id="photo-input" name="image"
								accept="image/*"> <label for="photo-input"
								class="file-label">Choose File</label> <img id="photo-preview"
								class="image-preview" src="" alt="Photo Preview" width="130px"
								height="170px">

							<script type="text/javascript">
								// Get the input element
								const photoInput = document.getElementById('photo-input');
								// Get the image element
								const photoPreview = document.getElementById('photo-preview');

								// Add an event listener to handle file selection
								photoInput.addEventListener('change', function(event) {
									const selectedFile = event.target.files[0];

									// Check if a file was selected
									if (selectedFile) {
										const reader = new FileReader();

										reader.addEventListener('load', function() {
											// Set the src attribute of the image element to the data URL
											photoPreview.src = reader.result;
										});

										// Read the selected file as a data URL
										reader.readAsDataURL(selectedFile);
									} else {
										// No file was selected, clear the image source
										photoPreview.src = '';
									}
								});
							</script>
						</div>
						<small>By creating an account you agree to our <a
							href="termsNConditions.jsp">Terms & Privacy</a>.
						</small>
						<hr>
						<div class="button-container">
							<button type="submit" class="button-center">Register</button>
						</div>

					</div>
					<div class="container signin">
						<%
						if (message != null && message.equals("failed")) {
						%>
						<img src="images/alert-16.png" alt="Computer Man"
							style="width: 23px; height: 23px;" autofocus> <font
							color="#ff0000">Failed to Register</font>
						<%
						}
						%>
						<div class="button-container">
							<small><p>Already have an account?</p></small><a
								href="https://www.example.com" class="button-click">Login</a>
						</div>

					</div>

				</form>

			</div>

		</div>
	</div>
</body>
</html>
