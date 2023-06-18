<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Party</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

<h1><center>Add Party</center></h1>
<div class="container">
    <form id="addPartyForm" action="AddParty" method="post" enctype="multipart/form-data">
      <label for="partyName">Party Name:</label>
      <input type="text" id="partyName" name="partyName" required /><br /><br />

      <label for="partySymbol">Party Symbol:</label>
      <input
        type="file"
        id="partySymbol"
        name="partySymbol"
        accept="image/*"
        required
      /><br />
      <br />

      <button type="submit" class="submit-button">Add Party</button>
    </form>
    <button class="submit-button" onclick="redirectToAdminPanel()">Home</button>

	<script>
		function redirectToAdminPanel() {
			window.location.href = "adminSuccess.jsp";
		}
	</script>
</div>
</body>
</html>