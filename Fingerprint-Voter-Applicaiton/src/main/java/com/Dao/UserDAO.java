package com.Dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.Model.Contact;
import com.Model.User;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UserDAO {

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

	//connect to db, validate user login and return ResultSet
	public static ResultSet validUserLogin(String sql) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement ps=conn.prepareStatement(sql);
        ResultSet rs  = ps.executeQuery();
        return rs;
	}

	//connect to db, insert user record to the voter table
	public void insertUser(User user, String imageFileName) throws SQLException {
		final String insertUser = "insert into voter(name, gender, dob, email, address, password, userCreatedDate, image) values(?,?,?,?,?,?,?,?);";
		System.out.println(insertUser);
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(insertUser)) {
			ps.setString(1, user.getName());
			ps.setString(2, user.getGender());
			ps.setString(3, user.getDob());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getPassword());
		

			LocalDateTime localDateTime = LocalDateTime.now();
			DateTimeFormatter formatterLocalDateTime = DateTimeFormatter.ofPattern("YYYY-MM-dd hh:mm:ss");
			String result = formatterLocalDateTime.format(localDateTime);
			System.out.println(result);
			ps.setString(7, result);
			ps.setString(8,imageFileName);

			System.out.println(ps);

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//connect to db, insert contact us info into contact table
	public static int contactUs(Contact c) throws SQLException {
		Connection conn = getConnection();
		int result =0;
       final String sql="insert into contact(name,email,message) values(?,?,?)";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1, c.getFullName());
        ps.setString(2, c.getEmail());
        ps.setString(3, c.getMessage());

        result =ps.executeUpdate();
        System.out.println("Contact Us info inserted.");
        return result;
	}

}
