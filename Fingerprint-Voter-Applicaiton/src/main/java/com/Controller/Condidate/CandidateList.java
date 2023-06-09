package com.Controller.Condidate;

import jakarta.servlet.ServletConfig;
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
import java.util.List;
import java.util.ArrayList;

import com.Model.Candidate;

/**
 * Servlet implementation class CandidateList
 */
public class CandidateList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CandidateList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Candidate> candidates = retrieveCandidates();

		request.setAttribute("candidates", candidates);
		request.getRequestDispatcher("candidateList.jsp").forward(request, response);
	}

	private List<Candidate> retrieveCandidates() {
		List<Candidate> candidates = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Get a database connection
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root",
					"system");
			System.out.println("Connection successful");

			// Prepare the SQL statement
			String sql = "SELECT candidate_id, candidate_name, candidate_address, candidate_photo FROM candidate LIMIT 4";
			PreparedStatement statement = connection.prepareStatement(sql);
			System.out.println(sql);

			// Execute the SQL statement
			ResultSet resultSet = statement.executeQuery();

			// Iterate over the result set and create Candidate objects
			while (resultSet.next()) {
				int candidateId = resultSet.getInt("candidate_id");
				String candidateName = resultSet.getString("candidate_name");
				String candidateAddress = resultSet.getString("candidate_address");
				String candidatePhoto = resultSet.getString("candidate_photo");

				Candidate candidate = new Candidate(candidateId, candidateName, candidateAddress, candidatePhoto);
				candidates.add(candidate);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return candidates;
	}

}
