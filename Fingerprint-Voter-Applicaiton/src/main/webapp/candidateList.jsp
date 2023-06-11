<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidate List</title>
    <link rel="stylesheet" href="css/style.css" type='text/css' />
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <h1>Candidate List</h1>
    
    <% String voterId = (String) session.getAttribute("voterId"); %>
     <label for="voterCardNumber">Voter Card Number:<%=voterId %></label>
     
    <form action="VoteServlet" method="post">
    <label for="voterCardNumber">Voter Card Number:</label>
        <input type="text" id="voterCardNumber" name="voterCardNumber" required><br><br>
     
    
        <table>
            <thead>
                <tr>
                    <th>Click here to vote</th>
                    <th>Candidate Name</th>
                    <th>Gender</th>
                    <th>Photo</th>
                </tr>
            </thead>
            <tbody>
                <% 
       
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/evoting";
                    String username = "root";
                    String password = "system";
                    Connection conn = DriverManager.getConnection(url, username, password);
                    Statement stmt = conn.createStatement();
                    String sql = "SELECT candidate_name, candidate_gender, candidate_photo, vote_count FROM candidate LIMIT 4";
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        String candidateName = rs.getString("candidate_name");
                        String candidateGender = rs.getString("candidate_gender");
                        String candidatePhoto = rs.getString("candidate_photo");
                        int voteCount = rs.getInt("vote_count");
                %>
                <tr>
                    <td>
                        <input type="checkbox" name="selectedCandidates" value="<%= candidateName %>"
                            onclick="disableOtherCheckboxes(this)" />
                    </td>
                    <td><%= candidateName %></td>
                    <td><%= candidateGender %></td>
                    <td><img src="<%= candidatePhoto %>" alt="Candidate Photo" width="100" height="100" /></td>
                </tr>
                <% 
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>

        <input class="submit-button" type="submit" value="Vote" />
    </form>

    <script>
        function disableOtherCheckboxes(clickedCheckbox) {
            var checkboxes = document.getElementsByName("selectedCandidates");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i] !== clickedCheckbox) {
                    checkboxes[i].disabled = clickedCheckbox.checked;
                }
            }
        }
    </script>
</body>
</html>
