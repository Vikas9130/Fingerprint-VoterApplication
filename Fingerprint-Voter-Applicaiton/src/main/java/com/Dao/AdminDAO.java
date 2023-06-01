package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	
	private static String url = "jdbc:mysql://localhost:3306/evoting";
	private static String uname = "root";
	private static String pass = "system";
	private static String driver = "com.mysql.cj.jdbc.Driver";

	
	//connect to database
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uname, pass);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (conn != null) {
			System.out.println("connected to db.");
		} else {
			System.out.println("not connected to db.");
		}
		return conn;
	}
	public static ResultSet loginValidation(String sql) throws SQLException{
		Connection conn = AdminDAO.getConnection();
        PreparedStatement ps=conn.prepareStatement(sql);
        ResultSet rs  = ps.executeQuery();
        System.out.println(sql);
        return rs;
    }

}
