package com.Controller.Voter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VoterDataInsertion {
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/evoting";
    private static final String USER = "root";
    private static final String PASS = "system";

    public static void insertVoterDetails(String voterCardNumber, String voterFirstName, String voterMiddleName, String voterLastName, String dateOfBirth, String address, String aadhar, String photo) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            connection = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare SQL statement
            StringBuilder sql = new StringBuilder("INSERT INTO voter_details (voter_card_number");
            StringBuilder placeholders = new StringBuilder(" VALUES (?");
            int parameterIndex = 2; // Starting index for dynamic parameters

            if (voterFirstName != null && !voterFirstName.isEmpty()) {
                sql.append(", voter_first_name");
                placeholders.append(", ?");
            }
            if (voterMiddleName != null && !voterMiddleName.isEmpty()) {
                sql.append(", voter_middle_name");
                placeholders.append(", ?");
            }
            if (voterLastName != null && !voterLastName.isEmpty()) {
                sql.append(", voter_last_name");
                placeholders.append(", ?");
            }
            if (dateOfBirth != null && !dateOfBirth.isEmpty()) {
                sql.append(", date_of_birth");
                placeholders.append(", ?");
            }
            if (address != null && !address.isEmpty()) {
                sql.append(", address");
                placeholders.append(", ?");
            }
            if (aadhar != null && !aadhar.isEmpty()) {
                sql.append(", aadhar");
                placeholders.append(", ?");
            }
            if (photo != null && !photo.isEmpty()) {
                sql.append(", photo");
                placeholders.append(", ?");
            }
placeholders.append(")");
            sql.append(")").append(placeholders);

            statement = connection.prepareStatement(sql.toString());
            statement.setString(1, voterCardNumber);

            if (voterFirstName != null && !voterFirstName.isEmpty()) {
                statement.setString(parameterIndex++, voterFirstName);
            }
            if (voterMiddleName != null && !voterMiddleName.isEmpty()) {
                statement.setString(parameterIndex++, voterMiddleName);
            }
            if (voterLastName != null && !voterLastName.isEmpty()) {
                statement.setString(parameterIndex++, voterLastName);
            }
            if (dateOfBirth != null && !dateOfBirth.isEmpty()) {
                statement.setString(parameterIndex++, dateOfBirth);
            }
            if (address != null && !address.isEmpty()) {
                statement.setString(parameterIndex++, address);
            }
            if (aadhar != null && !aadhar.isEmpty()) {
                statement.setString(parameterIndex, aadhar);
            }
            if (photo != null && !photo.isEmpty()) {
                statement.setString(parameterIndex, photo);
            }

            // Execute the statement
            statement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the statement and connection
            try {
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
