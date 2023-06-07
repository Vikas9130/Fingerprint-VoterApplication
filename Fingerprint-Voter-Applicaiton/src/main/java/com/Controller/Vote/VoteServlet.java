package com.Controller.Vote;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		 // Retrieve selected candidate IDs
	    String[] selectedCandidates = request.getParameterValues("selectedCandidates");

	    // Process the vote
	    boolean success = processVote(selectedCandidates);

	    if (success) {
	      // Vote processed successfully
	      response.getWriter().println("Vote processed successfully.");
	    } else {
	      // Failed to process vote
	      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to process vote.");
	    }
	}
	 private boolean processVote(String[] selectedCandidates) {
		    Connection connection = null;
		    PreparedStatement statement = null;

		    try {
		      // Get a database connection
		      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "system");

		      // Prepare the SQL statement
		      String sql = "UPDATE candidate SET vote_count = vote_count + 1 WHERE candidate_id = ?";
		      statement = connection.prepareStatement(sql);

		      // Execute the SQL statement for each selected candidate
		      for (String candidateId : selectedCandidates) {
		        statement.setInt(1, Integer.parseInt(candidateId));
		        statement.executeUpdate();
		      }

		      // Return true if the votes were processed successfully
		      return true;
		    } catch (SQLException e) {
		      e.printStackTrace();
		      return false;
		    } finally {
		      // Close the statement and connection
		      try {
		        if (statement != null) {
		          statement.close();
		        }
		        if (connection != null) {
		          connection.close();
		        }
		      } catch (SQLException e) {
		        e.printStackTrace();
		      }
		    }
		  }

}
