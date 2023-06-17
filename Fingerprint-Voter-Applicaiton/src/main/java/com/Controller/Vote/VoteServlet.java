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
		String voterCardNumber = request.getParameter("voterCardNumber");
		String selectedCandidate = request.getParameter("selectedCandidate");

		// Check if the voter has already voted
		try {
			if (!hasVoted(voterCardNumber)) {
				try {
					// Increment the vote count of the selected candidate
					incrementVoteCount(selectedCandidate);

					// Mark the voter as voted
					markVoterAsVoted(voterCardNumber);
					  // Set success message and forward to success page
			        String successMessage = voterCardNumber + " has voted successfully.";
			        session.setAttribute("successMessage", successMessage);
			        
					// Redirect to a success page or display a success message
					response.sendRedirect("voteSuccess.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
					// Handle the database error and show an error message
					
				}
			} else {
				// Redirect to a page or display a message indicating that the voter has already
				// voted
				 String errorMessage = voterCardNumber + " has already voted. You cannot vote again.";
			     session.setAttribute("errorMessage", errorMessage);
			     
				response.sendRedirect("voteError.jsp");
			}
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private boolean hasVoted(String voterCardNumber) throws SQLException {
		boolean voted = false;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			String sql = "SELECT COUNT(*) FROM voted_voters WHERE voter_card_number = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, voterCardNumber);
			rs = stmt.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);
				voted = (count > 0);
			}
		} finally {
			// Close the database resources
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		return voted;
	}

	private void incrementVoteCount(String candidateName) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = getConnection();
			String sql = "UPDATE candidate SET vote_count = vote_count + 1 WHERE candidate_name = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, candidateName);
			stmt.executeUpdate();
		} finally {
			// Close the database resources
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}



	private void markVoterAsVoted(String voterCardNumber) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = getConnection();
			String sql = "INSERT INTO voted_voters (voter_card_number) VALUES (?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, voterCardNumber);
			stmt.executeUpdate();
		} finally {
			// Close the database resources
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}

	// Establish a database connection using your database credentials
	// Example implementation:
	private Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/evoting";
		String username = "root";
		String password = "system";
		return DriverManager.getConnection(url, username, password);
	}

}


