package com.Controller.Result;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import com.Model.Candidate;

/**
 * Servlet implementation class GetResult
 */
public class GetResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Candidate> candidates1;
		try {
			candidates1 = retrieveCandidates();
			request.setAttribute("candidates1", candidates1);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private List<Candidate> retrieveCandidates() throws ClassNotFoundException {
		List<Candidate> candidates1 = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;

	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	      // Get a database connection
	      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "system");
System.out.println("connection successful");
	      // Prepare the SQL statement
String sql = "SELECT candidate_name, candidate_photo, vote_count FROM candidate";
 statement = connection.prepareStatement(sql);
	      System.out.println(sql);
	      // Execute the SQL statement
	      resultSet = statement.executeQuery();

	      // Iterate over the result set and create Candidate objects
	      while (resultSet.next()) {
	          String candidateName = resultSet.getString("candidate_name");
	          String candidatePhoto = resultSet.getString("candidate_photo");
	          int voterCount = resultSet.getInt("vote_count");
	          Candidate candidate = new Candidate(candidateName, candidatePhoto, voterCount);
	          candidates1.add(candidate);
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    } finally {
	      // Close the result set, statement, and connection
	      try {
	        if (resultSet != null) {
	          resultSet.close();
	        }
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

	    return candidates1;
	  }

	

}
