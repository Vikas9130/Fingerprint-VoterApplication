<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Dao.UserDAO"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css" type='text/css' />
<script type="text/javascript" src="js/formValidation.js"></script>
<style>
  .button-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .button-container button {
    flex-grow: 1;
    padding: 10px;
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    border: none;
    outline: none;
    border-radius: 20px; /* Added border-radius for rounded shape */
  }

  .button-container button:first-child {
    background-color: #428bca;
    margin-right: 10px;
  }

  .button-container button:last-child {
    background-color: #5cb85c;
    margin-left: 10px;
  }
</style>
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>

  <%
  Connection conn = UserDAO.getConnection();
  Statement statement = conn.createStatement();
  String voterId = (String) session.getAttribute("voterId");
  ResultSet resultset = statement.executeQuery(
    "SELECT voter_card_number, firstname, middlename, lastname, dob, address, image FROM voter WHERE voter_card_number = '"
    + voterId + "'");
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
      <label for="voter-name">First Name:<%=resultset.getString(2)%></label>
    </div>
    <div class="form-group">
      <label for="voter-name">Middle Name:<%=resultset.getString(3)%></label>
    </div>
    <div class="form-group">
      <label for="voter-name">Last Name:<%=resultset.getString(4)%></label>
    </div>
    <div class="form-group">
      <label for="date-of-birth">Date of Birth:<%=resultset.getString(5)%></label>
    </div>
    <div class="form-group">
      <label for="address">Address:<%=resultset.getString(6)%></label>
    </div>
    <div class="form-group">
      <label>Voter Photo: </label>
      <img id="photo-preview" class="image-preview" src="voterImages/<%=resultset.getString(7)%>"
        alt="Photo Preview" width="125" height="150">
    </div>

    <div class="button-container">
      <button onclick="redirectToVotePage()">Vote</button>
      <button onclick="redirectToResultPage()">Result</button>
    </div>

    <script>
      function redirectToVotePage() {
        window.location.href = "candidateList.jsp";
      }

      function redirectToResultPage() {
        window.location.href = "result.jsp";
      }
    </script>

  </div>
  <%
  }
  %>

</body>
</html>
