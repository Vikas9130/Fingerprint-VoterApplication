<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Update Voter Details</title>
</head>
<body>
    <h1>Update Voter Details</h1>

    <%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String voterCardNumber = request.getParameter("voterCardNumber");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "system");

        String query = "SELECT * FROM voter_details WHERE voter_card_number = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, voterCardNumber);
        rs = stmt.executeQuery();

        if (rs.next()) {
            String voterFirstName = rs.getString("voter_first_name");
            String voterMiddleName = rs.getString("voter_middle_name");
            String voterLastName = rs.getString("voter_last_name");
            String dateOfBirth = rs.getString("date_of_birth");
            String address = rs.getString("address");
            String aadhar = rs.getString("aadhar");
            String photo = rs.getString("photo");

            // Display the form for updating voter details
    %>
    <form action="update_action.jsp" method="POST">
        <input type="hidden" name="voterCardNumber" value="<%=voterCardNumber%>">

        Voter First Name: <input type="text" name="voterName" value="<%=voterFirstName%>"><br>
        Voter Middle Name: <input type="text" name="voterName" value="<%=voterMiddleName%>"><br>
        Voter Last Name: <input type="text" name="voterName" value="<%=voterLastName%>"><br>
        Date of Birth: <input type="date" name="dateOfBirth" value="<%=dateOfBirth%>"><br>
        Address: <input type="text" name="address" value="<%=address%>"><br>
        Aadhar: <input type="text" name="aadhar" value="<%=aadhar%>"><br>
        Photo: <input type="text" name="photo" value="<%=photo%>"><br>

        <input type="submit" value="Update">
    </form>
    <%
        } else {
            out.println("Voter with Voter Card Number " + voterCardNumber + " not found.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close connections
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
