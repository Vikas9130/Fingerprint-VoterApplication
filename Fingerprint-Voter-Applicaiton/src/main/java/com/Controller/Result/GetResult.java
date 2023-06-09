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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			List<Candidate> candidates = retrieveCandidates();
			request.setAttribute("candidates", candidates);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
		dispatcher.forward(request, response);
	}

	private List<Candidate> retrieveCandidates() throws ClassNotFoundException, SQLException {
		List<Candidate> candidates = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root",
					"system");

			String sql = "SELECT candidate_id, candidate_name, candidate_photo, vote_count FROM candidate";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int candidateId = resultSet.getInt("candidate_id");
				String candidateName = resultSet.getString("candidate_name");
				String candidatePhoto = resultSet.getString("candidate_photo");
				int voteCount = resultSet.getInt("vote_count");
				Candidate candidate = new Candidate(candidateId, candidateName, candidatePhoto, voteCount);
				candidates.add(candidate);
			}
		} catch (SQLException e) {
			throw e;
		}

		return candidates;
	}

}