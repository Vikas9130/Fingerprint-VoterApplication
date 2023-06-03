package com.Controller.Admin;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.Dao.AdminDAO;
import com.Model.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		HttpSession sessionAdmin =  request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("logout")) {
                sessionAdmin.removeAttribute("adminId");
                sessionAdmin.removeAttribute("adminNname");
                response.sendRedirect("adminPanel.jsp");
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessionAdmin= request.getSession();
        String action=request.getParameter("action");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin m=new Admin();
        m.setName(username);
        m.setPassword(password);

        String sql="select adminId,name,password from admin where name='"+username+"' and password='"+password+"'";

        try {
            ResultSet rs=AdminDAO.loginValidation(sql);
           
            if(rs.next()){
                String uname= "Welcome "+rs.getString(2);
                String adminId=String.valueOf(rs.getInt(1));
                sessionAdmin.setAttribute("adminId",adminId);
                sessionAdmin.setAttribute("adminName",uname);
                request.getRequestDispatcher("adminSuccess.jsp").forward(request,response);
        
            }else{
                request.setAttribute("error", "Invalid Account");
                response.sendRedirect("adminPanel.jsp?msg=invalid");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
	}

}
