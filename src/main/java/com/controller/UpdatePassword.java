package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.CustomerDAO;


@WebServlet("/UpdatePassword")
/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
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
		CustomerDAO cdao=new CustomerDAO();
		long accno=Long.parseLong(request.getParameter("accno"));
		int oldpass=Integer.parseInt(request.getParameter("curpass"));
		int newpass=Integer.parseInt(request.getParameter("newpass"));
		int conpass=Integer.parseInt(request.getParameter("conpass"));
		switch(cdao.updatePassword(accno, oldpass, newpass, conpass)) {
		case "success":
			response.sendRedirect("CustomerDashboard.jsp?msg=success&accno="+accno);
			break;
		case "old":
			response.sendRedirect("UpdatePassword.jsp?msg=old&accno="+accno);
			break;
		case "con":
			response.sendRedirect("UpdatePassword.jsp?msg=con&accno="+accno);
			break;
		case "failed":
			response.sendRedirect("Error.jsp?msg=error");
		}
	}

}
