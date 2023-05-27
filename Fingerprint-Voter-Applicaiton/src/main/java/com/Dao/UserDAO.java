package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Model.User;

public class UserDAO {
	
	private String url = "jdbc:mysql://localhost:3306/evoting";
	private String uname = "root";
	private String pass = "system";
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	private static final String insertUser = "insert into user(name, gender, dob, email, address) values(?,?,?,?,?);";
	
	protected Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uname, pass);
			System.out.println("connected to db.");
		}catch(SQLException e) {
			e.printStackTrace();	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;	
	}
	
	public void insertUser(User user) throws SQLException {
		System.out.println(insertUser);
		try(Connection conn=getConnection(); 
				PreparedStatement ps = conn.prepareStatement(insertUser)){
			ps.setString(1,user.getName());
			ps.setString(2,user.getGender());
			ps.setString(3,user.getDob());
			ps.setString(4,user.getEmail());
			ps.setString(5,user.getAddress());
			System.out.println(ps);
			ps.executeQuery();		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	

}
