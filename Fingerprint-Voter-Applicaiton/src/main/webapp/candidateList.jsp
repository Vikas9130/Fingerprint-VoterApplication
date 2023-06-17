<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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

.option-buttons {
    display: flex;
    justify-content: flex-start;
    gap: 10px;
}

.option-buttons label {
    display: inline-block;
    padding: 5px 10px;
    background-color: #f1f1f1;
    border: 1px solid #ddd;
    cursor: pointer;
}

.option-buttons input[type="radio"] {
    display: none;
}

.option-buttons label:hover {
    background-color: #e9e9e9;
}
</style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <h1>Candidate List</h1>

    <div class="container">
        <form action="VoteServlet" method="post">
            <label for="voterCardNumber">Enter Your Voter Card Number:</label> <input
                type="text" id="voterCardNumber" name="voterCardNumber" required><br>
            <br>


            <table>
                <thead>
                    <tr>
                        <th>Click here to vote</th>
                        <th>Party Name</th>
                        <th>Party Photo</th>
                        <th>Candidate Name</th>
                        <th>Candidate Photo</th>
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
                       
                        
                        String sql = "SELECT c.candidate_name, c.candidate_photo, p.party_name, p.party_symbol " +
                                "FROM candidate c " +
                                "INNER JOIN party p ON c.party_id = p.party_id ";

                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String candidateName = rs.getString("candidate_name");
                   
                            String candidatePhoto = rs.getString("candidate_photo");
                            String partyName = rs.getString("party_name");
                            String partySymbol = rs.getString("party_symbol");
                            
                           
                    %>
                    <tr>
                        <td>                                                  
                                <input type="radio" id="option1" name="selectedCandidate" value="<%=candidateName%>" required />                                                                      
                        </td>
                        <td><%=partyName%></td>
                        <td><img src="partyImages/<%=partySymbol%>" alt="Party Photo"
                            width="100" height="100" /></td>
                        <td><%=candidateName%></td>
                       
                        <td><img src="candidateImages/<%=candidatePhoto%>" alt="Candidate Photo"
                            width="100" height="100" /></td>
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

            <input class="submit-button" type="submit" value="Vote" required />
        </form>
    </div>
</body>
</html>
