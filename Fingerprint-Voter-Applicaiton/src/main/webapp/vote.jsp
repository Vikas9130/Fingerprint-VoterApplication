<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>vote</title>
<link rel="stylesheet" href="css/vote.css"type='text/css' />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<h1 class="heading">VOTE</h1>

  <div class="container">
    <div class="form-section">
      <label for="voterName">Voter Name:</label>
      <input type="text" id="voterName" required>
      
      <label for="candidateName">Candidate Name:</label>
      <input type="text" id="candidateName" required>
      
      <label for="partyName">Party Name:</label>
      <input type="text" id="partyName" required>
      
      <div class="candidate-photo">
        <p class="photo-tag">Candidate Photo</p>
        <div class="photo-preview" id="candidatePhotoPreview"></div>
      </div>
      
      <button id="fingerprintButton">Capture Fingerprint</button>
      
      <button id="voteButton">Click here to vote</button>
    </div>
  </div>

</body>
</html>