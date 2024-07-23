package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.AdminDAO;
import com.dao.CustomerDAO;

@WebServlet("/login")

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		try {
			AdminDAO adao=new AdminDAO();
			CustomerDAO cdao=new CustomerDAO();
			
			String type=request.getParameter("type");
			
			if(type.equals("admin")) {
				if(adao.validate(request.getParameter("userid"), request.getParameter("pass"))) {
					HttpSession session=request.getSession();
					session.setAttribute("userid", request.getParameter("userid"));
					response.sendRedirect("AdminDashboard.jsp");
				}
				else {
					response.sendRedirect("Login.jsp?msg=error1");
				}
			}
			else {
				if(cdao.validate(Long.parseLong(request.getParameter("userid")), Integer.parseInt(request.getParameter("pass")))) {
					HttpSession session=request.getSession();
					session.setAttribute("userid", request.getParameter("userid"));
					response.sendRedirect("CustomerDashboard.jsp");
				}
				else {
					response.sendRedirect("Login.jsp?msg=error2");
				}
			}
			
		}
		catch(Exception e){
			
			e.printStackTrace();
			
		}
	}

}
