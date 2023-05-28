package com.Controller.Contact;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Dao.UserDAO;
import com.Model.Contact;

/**
 * Servlet implementation class ContactUs
 */
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUs() {
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
		String fullName=request.getParameter("name");
        String email=request.getParameter("email");
        String message=request.getParameter("message");

        Contact c = new Contact();
        c.setEmail(email);
        c.setFullName(fullName);
        c.setMessage(message);


        try {
            int i= UserDAO.contactUs(c);

            if(i == 1){
                response.sendRedirect("contact.jsp?msg=success");
            }
            else{
                response.sendRedirect("contact.jsp?msg=failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
	}

}
