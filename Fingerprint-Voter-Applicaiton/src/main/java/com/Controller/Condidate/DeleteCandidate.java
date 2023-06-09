package com.Controller.Condidate;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.Model.Candidate;

/**
 * Servlet implementation class DeleteCandidate
 */
public class DeleteCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/evoting";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSWORD = "system";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCandidate() {
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
		String searchName = request.getParameter("searchName");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			List<Candidate> candidates = searchCandidates(conn, searchName);
			conn.close();

			request.setAttribute("candidates", candidates);
			request.getRequestDispatcher("deleteCandidate.jsp").forward(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			response.getWriter().println("An error occurred while searching candidates.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int candidateId = Integer.parseInt(request.getParameter("candidateId"));

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			deleteCandidate(conn, candidateId);
			PrintWriter pw = response.getWriter();
			pw.println("<h3>Candidate deleted.</h3>");
			conn.close();

			response.sendRedirect("DeleteCandidate");
			
			
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			response.getWriter().println("An error occurred while deleting the candidate.");
		}
	}

	private List<Candidate> searchCandidates(Connection conn, String searchName) throws SQLException {
		List<Candidate> candidates = new ArrayList<>();

		String query = "SELECT candidate_id, candidate_name, candidate_address FROM candidate WHERE candidate_name LIKE ?";
		try (PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, "%" + searchName + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				int candidateId = rs.getInt("candidate_id");
				String candidateName = rs.getString("candidate_name");
				String candidateAddress = rs.getString("candidate_address");

				Candidate candidate = new Candidate(candidateId, candidateName, candidateAddress);
				candidates.add(candidate);
			}
		}

		return candidates;
	}

	private void deleteCandidate(Connection conn, int candidateId) throws SQLException {
		String query = "DELETE FROM candidate WHERE candidate_id = ?";
		try (PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setInt(1, candidateId);
			stmt.executeUpdate();
		}
	}

}
