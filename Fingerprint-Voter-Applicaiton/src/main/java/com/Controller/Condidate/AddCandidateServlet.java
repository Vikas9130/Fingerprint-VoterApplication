package com.Controller.Condidate;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class AddCandidateServlet
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // Limit the maximum file size to 5MB
public class AddCandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 // JDBC database URL, username, and password
	   private static final String DB_URL = "jdbc:mysql://localhost:3306/evoting";
	   private static final String DB_USER = "root";
	   private static final String DB_PASSWORD = "system";
	   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCandidateServlet() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		HttpSession session = request.getSession();
		// Extract form data
	      String name = request.getParameter("name");
	      String gender = request.getParameter("gender");
	      String address = request.getParameter("address");
	      Part photoPart = request.getPart("photo");
	      
	      // Get the filename and file data from the photoPart
	      String photoFileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
	      InputStream photoInputStream = photoPart.getInputStream();

	      // Store data into the database
	      try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
	         String query = "INSERT INTO candidate (candidate_name, candidate_gender, candidate_address, candidate_photo) VALUES (?, ?, ?, ?)";
	         PreparedStatement statement = conn.prepareStatement(query);
	         statement.setString(1, name);
	         statement.setString(2, gender);
	         statement.setString(3, address);
	         statement.setString(4, photoFileName);
	         statement.executeUpdate();
	         
	         // Save the photo file to a location or process it as per your requirement
	         // Example: save the file to a directory
	         String photoSavePath = "C:/Users/91913/git/Fingerprint-VoterApplication/Fingerprint-Voter-Applicaiton/src/main/webapp/candidateImages/" + photoFileName;
	         Files.copy(photoInputStream, Paths.get(photoSavePath));
	         String successMessage =  " Candidate added successfully.";
	            session.setAttribute("successMessage", successMessage);
	            
	         // Redirect to a success page or display a success message
	         response.sendRedirect("addCandidateSuccess.jsp");
	      } catch (SQLException e) {
	         e.printStackTrace();
	         // Redirect to an error page or display an error message
	         response.sendRedirect("error.jsp");
	      }}

}
