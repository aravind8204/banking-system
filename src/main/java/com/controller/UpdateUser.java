package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.CustomerDAO;
import com.model.Customer;

@WebServlet("/UpdateUser")
/**
 * Servlet implementation class UpdateUser
 */
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
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
		
		Long accno=Long.parseLong(request.getParameter("accno"));
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		Long mobile=Long.parseLong(request.getParameter("mobile"));
		String addr=request.getParameter("addr");
		String acctype=request.getParameter("acctype");
		String proof=request.getParameter("proof");
		String dob=request.getParameter("dob");
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAO();
		c.setAccountNo(accno);
		c.setName(name);
		c.setMobile(mobile);
		c.setEmail(email);
		c.setAccountType(acctype);
		c.setProof(proof);
		c.setAddress(addr);
		c.setDOB(dob);
		if(cdao.update(c)) {
			HttpSession session=request.getSession();
			session.setAttribute("method", null);
			response.sendRedirect("Success.jsp?msg=updated");
		}
		else {
			response.sendRedirect("Error.jsp?msg=Not updated");
		}
		
		
	}

}
