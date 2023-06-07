<%@ page import="java.util.List" %>
<%@ page import="com.Model.Candidate" %>
<!DOCTYPE html>
<html>
<head>
  <title>Candidate List</title>
</head>
<body>
  <h2>Candidate List</h2>

  <form action="voteServlet" method="post">
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
