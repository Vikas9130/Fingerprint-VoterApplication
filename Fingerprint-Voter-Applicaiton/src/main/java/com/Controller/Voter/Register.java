package com.Controller.Voter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.awt.image.ImageFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import com.Dao.UserDAO;
import com.Model.User;

/**
 * Servlet implementation class Register
 */
@MultipartConfig(maxFileSize = 16177216)
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final InputStream InputStream = null;

	private UserDAO userDao = new UserDAO();

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
		// TODO Auto-generated method stub
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

		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");

		try {
			User user = new User();
			user.setName(name);
			user.setGender(gender);
			user.setDob(dob);
			user.setEmail(email);
			user.setAddress(address);
			user.setPassword(password);
			InputStream inputStream = null;
			Part filePart = request.getPart("image");
			String imageFileName = filePart.getSubmittedFileName();
			String uploadPath = "C:/Users/91913/git/Fingerprint-VoterApplication/Fingerprint-Voter-Applicaiton/src/main/webapp/voterImages/"
					+ imageFileName;
			FileOutputStream fos = new FileOutputStream(uploadPath);
			inputStream = filePart.getInputStream();
			byte[] data = new byte[inputStream.available()];
			inputStream.read(data);
			fos.write(data);
			fos.close();
			userDao.insertUser(user, imageFileName);
			request.setAttribute("image1", uploadPath);
			RequestDispatcher rd = request.getRequestDispatcher("votersuccess.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

}
