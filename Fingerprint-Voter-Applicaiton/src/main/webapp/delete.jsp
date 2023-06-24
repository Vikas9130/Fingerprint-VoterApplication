<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Voter Details</title>
</head>
<body>
    <h1>Delete Voter Details</h1>

    <%
    Connection conn = null;
    PreparedStatement stmt = null;

    String voterCardNumber = request.getParameter("voterCardNumber");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "system");

        String query = "DELETE FROM voter_details WHERE voter_card_number = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, voterCardNumber);
        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Voter details deleted successfully.");
        } else {
            out.println("Failed to delete voter details.");
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
