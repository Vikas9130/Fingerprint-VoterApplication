package com.Controller.Admin;

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
 * Servlet implementation class ResultDeclarationServlet
 */
public class ResultDeclarationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultDeclarationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            declareResult();
            resp.getWriter().println("Result declared successfully.");
        } catch (SQLException e) {
            resp.getWriter().println("Failed to declare result: " + e.getMessage());
        }
	}


	 private void declareResult() throws SQLException {
	        // Update the database to mark the result as declared
	        String url = "jdbc:mysql://localhost:3306/evoting";
	        String username = "root";
	        String password = "system";
	        try (Connection conn = DriverManager.getConnection(url, username, password)) {
	            String query = "UPDATE result_status SET result_declared = true";
	            try (PreparedStatement stmt = conn.prepareStatement(query)) {
	                stmt.executeUpdate();
	            }
	        }
	    }

}
