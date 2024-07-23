package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.dao.CustomerDAO;
import com.model.Customer;

@WebServlet("/CloseAccount")
/**
 * Servlet implementation class CloseAccount
 */
public class CloseAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CloseAccount() {
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
		long accno=Long.parseLong(request.getParameter("accno"));
		CustomerDAO cdao=new CustomerDAO();
		Customer c=new Customer();
		
			c.setAccountStatus("closed");
			c.setAccountNo(accno);
		
		if(cdao.Updatestatus(c)) {
			response.sendRedirect("Login.jsp");
		}
		else {
			response.sendRedirect("Error.jsp?msg=error");
		}
		
	}

}
