<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Update Voter Details - Action</title>
</head>
<body>
    <h1>Update Voter Details - Action</h1>

    <%
    Connection conn = null;
    PreparedStatement stmt = null;

    String voterCardNumber = request.getParameter("voterCardNumber");
    String voterFirstName = request.getParameter("voterFirstName");
    String voterMiddleName = request.getParameter("voterMiddleName");
    String voterLastName = request.getParameter("voterLastName");
    String dateOfBirth = request.getParameter("dateOfBirth");
    String address = request.getParameter("address");
    String aadhar = request.getParameter("aadhar");
    String photo = request.getParameter("photo");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "system");

        String query = "UPDATE voter SET firstname=?, middlename=?, lastname=?, dob=?, address=?, aadhar=?, image=? WHERE voter_card_number=?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, voterFirstName);
        stmt.setString(2, voterMiddleName);
        stmt.setString(3, voterLastName);
        stmt.setString(4, dateOfBirth);
        stmt.setString(5, address);
        stmt.setString(6, aadhar);
        stmt.setString(7, photo);
        stmt.setString(8, voterCardNumber);
        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Voter details updated successfully.");
        } else {
            out.println("Failed to update voter details.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close connections
        try {
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
