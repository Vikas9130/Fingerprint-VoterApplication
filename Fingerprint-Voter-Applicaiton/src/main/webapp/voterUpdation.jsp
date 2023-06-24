<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Voter Details Updation</title>
  <link rel="stylesheet" href="css/style.css">
 
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<% 	String voterId = (String) session.getAttribute("voterId"); %>


<div class="container">
    <h1>Voter Details Updation Form</h1>
    <form id="voter-details-form" action="VoterDataServlet" method="post" enctype="multipart/form-data">

      <div class="form-group">
        <label for="voter-card-number">Voter Card Number:</label>
        <input type="text" id="voter-card-number" name="voter-card-number" value="<%= voterId %>" readonly>
      </div>
      <div class="form-group">
        <label for="voter-name">Voter First Name:</label>
        <input type="text" id="voter-name" name="voter-first-name">
      </div>
       <div class="form-group">
        <label for="voter-name">Voter Middle Name:</label>
        <input type="text" id="voter-name" name="voter-middle-name">
      </div>
       <div class="form-group">
        <label for="voter-name">Voter Last Name:</label>
        <input type="text" id="voter-name" name="voter-last-name">
      </div>
      <div class="form-group">
        <label for="date-of-birth">Date of Birth:</label>
        <input type="date" id="date-of-birth" name="date-of-birth">
      </div>
      <div class="form-group">
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4"></textarea>
      </div>
      <div class="form-group">
        <label for="aadhar">Aadhar No:</label>
        <input type="text" id="aadhar" name="aadhar">
      </div>
      <div class="form-group">
        <label>Update Photo:</label>
        <input type="file" class="file-input" id="photo-input" name="photo-input" accept="image/*">

        <label for="photo-input" class="file-label">Choose File</label>
        <img id="photo-preview" class="image-preview" src="photo-preview" alt="Photo Preview" width="150px" height="200px">
      </div>
      <button type="submit" class="submit-button">Update Details</button>
    </form>

  </div>
 <script>
  // Function to handle the photo preview
  function previewPhoto(event) {
    var input = event.target;
    var reader = new FileReader();

    reader.onload = function() {
      var photoPreview = document.getElementById("photo-preview");
      photoPreview.src = reader.result;
    };

    if (input.files && input.files[0]) {
      reader.readAsDataURL(input.files[0]);
    }
  }

  // Attach the previewPhoto function to the change event of the file input
  var photoInput = document.getElementById("photo-input");
  photoInput.addEventListener("change", previewPhoto);
</script>
</body>
</html>