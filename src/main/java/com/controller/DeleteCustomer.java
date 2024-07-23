package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.AdminDAO;
import com.model.Customer;


@WebServlet("/DeleteCustomer")
/**
 * Servlet implementation class ViewCustomer
 */
public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		long accno=Long.parseLong(request.getParameter("accno"));
		//response.getWriter().append(Long.toString(accno)).append(request.getContextPath());
		HttpSession session=request.getSession();
		AdminDAO adao=new AdminDAO();
		Customer c=new Customer();
		c.setAccountNo(accno);
		if(adao.deleteCustomer(c)) {
			session.setAttribute("method", null);
			response.sendRedirect("Success.jsp?msg=deleted");
		}
		else {
			response.sendRedirect("Error.jsp?msg=error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		//long accno=Long.parseLong(request.getParameter("accno"));
		//System.out.println(accno);
		
	}

}
