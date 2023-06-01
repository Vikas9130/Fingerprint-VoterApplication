package com.Controller.Voter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

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
		InputStream inputStream=null;
        Part filePart=request.getPart("image");
        if(filePart!=null){
            inputStream=filePart.getInputStream();
        }

		User user = new User();
		user.setName(name);
		user.setGender(gender);
		user.setDob(dob);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(password);

		try {
			userDao.insertUser(user, inputStream);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("voterSuccess.jsp");

	}

}
