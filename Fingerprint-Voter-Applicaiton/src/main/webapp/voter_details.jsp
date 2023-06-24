<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Voter Details</title>
</head>
<body>
    <h1>Voter Details</h1>

    <table border="1">
        <tr>
            <th>Voter Card Number</th>
            <th>Voter First Name</th>
            <th>Voter Middle Name</th>
            <th>Voter Last Name</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>Aadhar</th>
            <th>Photo</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>

        <% 
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "system");

            String query = "SELECT * FROM voter_details";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String voterCardNumber = rs.getString("voter_card_number");
                String voterFirstName = rs.getString("voter_first_name");
                String voterMiddleName = rs.getString("voter_middle_name");
                String voterLastName = rs.getString("voter_last_name");                
                String dateOfBirth = rs.getString("date_of_birth");
                String address = rs.getString("address");
                String aadhar = rs.getString("aadhar");
                String photo = rs.getString("photo");

                out.println("<tr>");
                out.println("<td>" + voterCardNumber + "</td>");
                out.println("<td>" + voterFirstName + "</td>");
                out.println("<td>" + voterMiddleName + "</td>");
                out.println("<td>" + voterLastName + "</td>");
                out.println("<td>" + dateOfBirth + "</td>");
                out.println("<td>" + address + "</td>");
                out.println("<td>" + aadhar + "</td>");
                out.println("<td>" + photo + "</td>");

                // Update button
                out.println("<td><a href=\"update.jsp?voterCardNumber=" + voterCardNumber + "\">Update</a></td>");

                // Delete button
                out.println("<td><a href=\"delete.jsp?voterCardNumber=" + voterCardNumber + "\">Delete</a></td>");

                out.println("</tr>");
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
    </table>
</body>
</html>
