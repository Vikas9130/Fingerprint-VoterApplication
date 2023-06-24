<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/body.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/style.css" type='text/css' />
<script type="text/javascript" src="js/formValidation.js"></script>
<title>Registration</title>
<style>
.form-group img {
	margin-left: 60px;
	margin-bottom: 10px;
}
.mandatory {
    color: red;
    margin-left: 5px;
  }
</style>
</head>
<body>
	<script type="text/javascript">
		// Function to validate the form fields
		function validateForm() {
			var firstNameInput = document.getElementById("firstName");
			var middleNameInput = document.getElementById("middleName");
			var lastNameInput = document.getElementById("lastName");
			var genderSelect = document.getElementById("gender");
			var dobInput = document.getElementById("dob");
			var emailInput = document.getElementById("email");
			var addressInput = document.getElementById("address");
			var passwordInput = document.getElementById("password");
			var photoInput = document.getElementById("photo-input");

			// Check if required fields are empty
			if (
				firstNameInput.value === "" ||
				lastNameInput.value === "" ||
				genderSelect.value === "" ||
				dobInput.value === "" ||
				emailInput.value === "" ||
				addressInput.value === "" ||
				passwordInput.value === "" ||
				photoInput.value === ""
			) {
				alert("Please fill in all the required fields.");
				return false;
			}

			// Additional validation logic for specific fields (e.g., email format, age check)

			// Validate email format using a regular expression
			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (!emailRegex.test(emailInput.value)) {
				alert("Please enter a valid email address.");
				return false;
			}

			// Check if the user is at least 18 years old based on the provided date of birth
			var currentDate = new Date();
			var dobDate = new Date(dobInput.value);
			var age = currentDate.getFullYear() - dobDate.getFullYear();
			if (age < 18) {
				alert("You must be at least 18 years old to register.");
				return false;
			}

			
			 // Validate the password field
			  var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			  if (!passwordRegex.test(passwordInput.value)) {
			    alert(
			      "Password should be at least 8 characters long and contain at least one capital letter, one symbol character, and numbers."
			    );
			    return false;
			  }
			// Other validation rules can be added as needed

			// If all validation passes, the form will be submitted
			return true;
		}
	</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="${pageContext.request.contextPath}/Register"
					name="register" method="post" enctype="multipart/form-data"
					onsubmit="return validateForm()" style="max-width: 350px; margin: auto">

				
					<div class="container">
						<h1>Register</h1>
						<p>Please fill in this form to create an account.</p>
						<hr>
						<div class="form-group">
							<label for="firstName">First Name<span class="mandatory">*</span>:</label> <input type="text" id="firstName"
								placeholder="Enter First Name" name="firstName" required>
						</div>
						<div class="form-group">
							<label for="middleName">Middle Name<span class="mandatory">*</span>:</label> <input type="text" id="middleName"
								placeholder="Enter Middle Name" name="middleName">
						</div>
						<div class="form-group">
							<label for="lastName">Last Name:<span class="mandatory">*</span></label> <input type="text" id="lastName"
								placeholder="Enter Last Name" name="lastName" required>
						</div>
						<div class="form-group">
							<label for="gender">Gender<span class="mandatory">*</span>:</label> <select id="gender"
								name="gender" style="width: 270px; height: 33px;" required>
								<option disabled selected>Select Gender</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
								<option value="female">Other</option>
							</select>
						</div>
						<div class="form-group">
							<label for="aadhar">Aadhar Card No<span class="mandatory">*</span>:</label> <input type="text"
								id="aadhar" name="aadhar" required>
						</div>
						<div class="form-group">
							<label for="dob">Date of Birth<span class="mandatory">*</span>:</label> <input type="date"
								id="dob" name="dob" required>
						</div>
						<div class="form-group">
							<label for="email">Email:</label> <input type="email" id="email"
								placeholder="Enter Email" name="email" required>
						</div>
						<div class="form-group">
							<label for="address">Address<span class="mandatory">*</span>:</label>
							<textarea id="address" name="address" rows="4"></textarea>
						</div>
						<div class="form-group">
							<label for="password">Password<span class="mandatory">*</span>:</label> <input type="password"
								id="password" placeholder="Enter Password" name="password"
								required>
								<small class="note">Password should be at least 8 characters long and contain at least one capital letter, one symbol character, and numbers.</small>

						</div>
						<hr>


						<div class="form-group">

							<label for="image">Upload Photo<span class="mandatory">*</span>:</label> <input type="file"
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
					
						<div class="button-container">
							<small><p>Already have an account?</p></small><a
								href="home.jsp" class="button-click">Login</a>
						</div>

					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>
