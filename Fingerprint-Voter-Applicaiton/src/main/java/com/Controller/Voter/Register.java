package com.Controller.Voter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Dao.UserDAO;
import com.Model.User;

/**
 * Servlet implementation class Register
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // Limit the maximum file size to 5MB
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final InputStream InputStream = null;

	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
		    super.init(config);
		    // Your initialization code here
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String aadhar = request.getParameter("aadhar");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
        session.setAttribute("firstName", firstName);
        session.setAttribute("middleName", middleName);
        
        User user = new User();
		user.setFirstName(firstName);
		user.setMiddleName(middleName);
		user.setLastName(lastName);
		user.setGender(gender);
		user.setAadhar(aadhar);
		user.setDob(dob);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(password);

		UserDAO userDao = new UserDAO();
		
	
		try {
			
			InputStream inputStream = null;
			Part photoPart = request.getPart("image");
			  // Get the filename and file data from the photoPart
		      String photoFileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
		      InputStream photoInputStream = photoPart.getInputStream();

		      String photoSavePath = "C:/Users/91913/git/Fingerprint-VoterApplication/Fingerprint-Voter-Applicaiton/src/main/webapp/voterImages/" + photoFileName;
		         Files.copy(photoInputStream, Paths.get(photoSavePath));
		
			
			userDao.insertUser(user, photoFileName);
			request.setAttribute("image1", photoFileName);
			RequestDispatcher rd = request.getRequestDispatcher("votersuccess.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

}