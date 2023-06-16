<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Party List</title>
 <link rel="stylesheet" href="css/style.css" type='text/css' />
 <style>
/* CSS styles */
body {
	font-family: Arial, sans-serif;
}

h1 {
	color: #333;
	text-align: center;
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
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%@ page import="java.sql.*" %>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/evoting";
    String username = "root";
    String password = "system";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        statement = connection.createStatement();
        String sql = "SELECT * FROM party";
        resultSet = statement.executeQuery(sql);
%>
<h1>Party List</h1>
    <table>
        <tr>
            <th>Party ID</th>
            <th>Party Name</th>
            <th>Party Symbol</th>
        </tr>
        <% while (resultSet.next()) { %>
        <tr>
            <td><%= resultSet.getInt("party_id") %></td>
            <td><%= resultSet.getString("party_name") %></td>
            <td><%= resultSet.getString("party_symbol") %></td>
        </tr>
        <% } %>
    </table>
    <%
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
    
</body>
</html>