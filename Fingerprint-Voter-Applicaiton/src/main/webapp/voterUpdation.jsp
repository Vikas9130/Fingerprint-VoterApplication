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
    <form id="voter-details-form" action="#" method="post">
      <div class="form-group">
        <label for="voter-card-number">Voter Card Number:</label>
        <input type="text" id="voter-card-number" name="voter-card-number" value="<%= voterId %>" readonly>
      </div>
      <div class="form-group">
        <label for="voter-name">Voter Name:</label>
        <input type="text" id="voter-name" name="voter-name">
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
        <label>Update Photo:</label>
        <input type="file" class="file-input" id="photo-input" name="photo-input" accept="image/*">
        <label for="photo-input" class="file-label">Choose File</label>
        <img id="photo-preview" class="image-preview" src="" alt="Photo Preview">
      </div>
      <div class="form-group">
        <label>Update Fingerprint:</label>
        <input type="file" class="file-input" id="fingerprint-input" name="fingerprint-input" accept="image/*">
        <label for="fingerprint-input" class="file-label">Choose File</label>
        <img id="fingerprint-preview" class="image-preview" src="" alt="Fingerprint Preview">
      </div>
      <button type="submit" class="submit-button">Update Details</button>
    </form>

  </div>

</body>
</html>