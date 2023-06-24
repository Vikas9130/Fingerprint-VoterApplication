package com.Controller.Voter;

import java.sql.*;

public class VoterDataRetriever {
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/evoting";
    private static final String USER = "root";
    private static final String PASS = "system";

    public static ResultSet fetchVotersData() {
        ResultSet resultSet = null;
        Connection connection = null;
        Statement statement = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            connection = DriverManager.getConnection(DB_URL, USER, PASS);

            // Execute SQL query
            String sql = "SELECT * FROM voter";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }
}
