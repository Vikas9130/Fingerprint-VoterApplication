package com.Controller.Voter;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Dao.UserDAO;
import com.Model.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDAO userDao = new UserDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		String voterId = request.getParameter("voter_card_number");
        String password = request.getParameter("password");
        
        User user = new User();
        user.setPassword(password);
        user.setVoter_card_number(voterId);
        String sql="select voter_card_number,password,name from voter where voter_card_number='"+voterId+"' and password='"+password+"'";

        
        try {
        	ResultSet rs = UserDAO.validUserLogin(sql);
        	if(rs.next()){
                String username= "Welcome "+rs.getString(3);
                System.out.println(username);
                request.getRequestDispatcher("votersuccess.jsp").forward(request,response);
            }else{
                response.sendRedirect("home.jsp?msg=invalid");
            }
        }catch(SQLException e) {
        	e.printStackTrace();
        	response.sendRedirect("home.jsp?msg=error");
        }
	}

}
