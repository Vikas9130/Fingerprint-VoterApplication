package com.Controller.Voter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class VoterDataServlet
 */
public class VoterDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoterDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// Retrieve form data from request parameters
        String voterCardNumber = request.getParameter("voter-card-number");
        String voterFirstName = request.getParameter("voter-first-name");
        String voterMiddleName = request.getParameter("voter-middle-name");
        String voterLastName = request.getParameter("voter-last-name");
        String dateOfBirth = request.getParameter("date-of-birth");
        String address = request.getParameter("address");
        String aadhar = request.getParameter("aadhar");
        String photo = request.getParameter("photo-input");


        // Invoke the method to insert voter details into the database
        VoterDataInsertion.insertVoterDetails(voterCardNumber, voterFirstName, voterMiddleName, voterLastName, dateOfBirth, address, aadhar, photo);
        String successMessage = "The voter card number " + voterCardNumber + " details has been sent to admin. After admin approval data will reflect to your system.";
        session.setAttribute("successMessage", successMessage);
        response.sendRedirect("voteSuccess.jsp");
        // Redirect or forward to a success page
        // response.sendRedirect("success.jsp");
        // OR
        // request.getRequestDispatcher("success.jsp").forward(request, response);
    
	}

}
