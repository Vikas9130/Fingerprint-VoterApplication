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

import jakarta.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("logout")) {
                session.removeAttribute("voterId");
                session.removeAttribute("uname");
                response.sendRedirect("home.jsp");
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session = request.getSession();
	      String action=request.getParameter("action");
		
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
                session.setAttribute("voterId",voterId);
                session.setAttribute("uname",username);
                System.out.println(username);
                request.getRequestDispatcher("voterHome.jsp").forward(request,response);
            }else{
            	request.setAttribute("error", "Invalid Account");
                response.sendRedirect("home.jsp?msg=invalid");
            }
        }catch(SQLException e) {
        	e.printStackTrace();
        	response.sendRedirect("home.jsp?msg=error");
        }
	}

}
