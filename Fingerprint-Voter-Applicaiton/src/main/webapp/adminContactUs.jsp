<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage ContactUs</title>
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
    </style>
</head>
<body>
    <jsp:include page="adminHeader.jsp"></jsp:include>

    <div class="container">
        <h1>Data Retrieval</h1>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                </tr>
            </thead>
            <tbody>
                <% try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/evoting";
                    String username = "root";
                    String password = "system";
                    Connection conn = DriverManager.getConnection(url, username, password);
                    Statement stmt = conn.createStatement();
                    String query = "SELECT * FROM contact ORDER BY id DESC";
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String message = rs.getString("message");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= message %></td>
                </tr>
                <% }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
        <button class="submit-button" onclick="redirectToAdminPanel()">Home</button>

	<script>
		function redirectToAdminPanel() {
			window.location.href = "adminSuccess.jsp";
		}
	</script>
    </div>
</body>
</html>
