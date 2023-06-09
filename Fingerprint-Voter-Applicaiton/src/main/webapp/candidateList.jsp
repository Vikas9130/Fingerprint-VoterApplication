<%@ page import="java.util.List" %>
<%@ page import="com.Model.Candidate" %>
<!DOCTYPE html>
<html>
<head>
  <title>Candidate List</title>
  <style>
    /* CSS styles */
    body {
      font-family: Arial, sans-serif;
    }
    h2 {
      color: #333;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
    }
    img {
      max-width: 100px;
      max-height: 100px;
    }
    button[type="submit"] {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      cursor: pointer;
      font-size: 16px;
    }
    button[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <h2>Candidate List</h2>

  <form action="VoteServlet" method="post">
    <table>
      <thead>
        <tr>
          <th>Candidate ID</th>
          <th>Name</th>
          <th>Address</th>
          <th>Photo</th>
          <th>Vote</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<Candidate> candidates = (List<Candidate>) request.getAttribute("candidates");
          for (Candidate candidate : candidates) {
            int candidateId = candidate.getCandidateId();
            String candidateName = candidate.getCandidateName();
            String candidateAddress = candidate.getCandidateAddress();
            String candidatePhoto = candidate.getCandidatePhoto();
        %>
          <tr>
            <td><%= candidateId %></td>
            <td><%= candidateName %></td>
            <td><%= candidateAddress %></td>
            <td><img src="<%= candidatePhoto %>" alt="Candidate Photo" width="100" height="100"></td>
            <td><input type="checkbox" name="selectedCandidates" value="<%= candidateId %>" /></td>
          </tr>
        <% } %>
      </tbody>
    </table>

    <button type="submit">Vote</button>
  </form>
</body>
</html>
