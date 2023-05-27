package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Date;
import com.Model.User;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UserDAO {

	private static String url = "jdbc:mysql://localhost:3306/evoting";
	private static String uname = "root";
	private static String pass = "system";
	private static String driver = "com.mysql.cj.jdbc.Driver";

	private static final String insertUser = "insert into voter(name, gender, dob, email, address, password, userCreatedDate) values(?,?,?,?,?,?,?);";

	/*
	 * create table CREATE TABLE voter(voter_card_number VARCHAR(10) NOT NULL
	 * PRIMARY KEY DEFAULT '0', name VARCHAR(30) NOT NULL, gender VARCHAR(6) NOT
	 * NULL, dob VARCHAR(10) NOT NULL,email VARCHAR(30) NOT NULL, address
	 * VARCHAR(50) NOT NULL, password VARCHAR(8) NOT NULL, userCreatedDate
	 * DATETIME);
	 */
	/*
	 * trigger DELIMITER $$ CREATE TRIGGER voter_insert BEFORE INSERT ON voter FOR
	 * EACH ROW BEGIN INSERT INTO voter_seq VALUES (NULL); SET NEW.voter_card_number
	 * = CONCAT('FVA', LPAD(LAST_INSERT_ID(), 3, '0')); END$$ DELIMITER ;
	 */
	protected static Connection getConnection() {
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

	public static ResultSet validUserLogin(String sql) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement ps=conn.prepareStatement(sql);
        ResultSet rs  = ps.executeQuery();
        return rs;
	}

	public void insertUser(User user) throws SQLException {
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
//			Date date1 = new Date(System.currentTimeMillis());
			ps.setString(7, result);

			System.out.println(ps);

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
