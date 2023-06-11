package com.Controller.Vote;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class VoteServlet
 */
public class VoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("CandidateList");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        String voterId = (String) session.getAttribute("voterId");
	        String[] selectedCandidates = request.getParameterValues("selectedCandidates");

	        String voterCardNumber = request.getParameter("voterCardNumber");

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            String url = "jdbc:mysql://localhost:3306/evoting";
	            String username = "root";
	            String password = "system";
	            Connection conn = DriverManager.getConnection(url, username, password);

	            if (selectedCandidates != null) {
	                for (String candidate : selectedCandidates) {
	                    // Check if the candidate has already voted
	                    String sql = "SELECT voter_card_number FROM candidate WHERE candidate_name=?";
	                    PreparedStatement checkStmt = conn.prepareStatement(sql);
	                    checkStmt.setString(1, candidate);
	                    ResultSet resultSet = checkStmt.executeQuery();

	                    if (resultSet.next()) {
	                        String existingVoterCardNumber = resultSet.getString("voter_card_number");
	                        if (existingVoterCardNumber != null && existingVoterCardNumber.equals(voterCardNumber)) {
	                            // The candidate has already voted with the same voter card number
	                            String errorMessage = voterCardNumber + " has already voted. You cannot vote again.";
	                            session.setAttribute("errorMessage", errorMessage);
	                            RequestDispatcher dispatcher = request.getRequestDispatcher("voteError.jsp");
	                            dispatcher.forward(request, response);
	                            return;
	                        }
	                    }

	                    // Update vote count and voter card number for the candidate
	                    String updateSql = "UPDATE candidate SET vote_count = vote_count + 1, voter_card_number = ? WHERE candidate_name=?";
	                    PreparedStatement updateStmt = conn.prepareStatement(updateSql);
	                    updateStmt.setString(1, voterCardNumber);
	                    updateStmt.setString(2, candidate);
	                    updateStmt.executeUpdate();
	                    updateStmt.close();
	                }
	            }

	            // Set success message and forward to success page
	            String successMessage = voterCardNumber + " has voted successfully.";
	            session.setAttribute("successMessage", successMessage);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("voteSuccess.jsp");
	            dispatcher.forward(request, response);

	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	}

}
