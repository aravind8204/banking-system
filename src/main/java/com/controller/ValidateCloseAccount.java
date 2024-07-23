package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.CustomerDAO;

@WebServlet("/ValidateCloseAccount")
/**
 * Servlet implementation class ValidateCloseAccount
 */
public class ValidateCloseAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateCloseAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
		long accno=Long.parseLong(request.getParameter("accno"));
		CustomerDAO cdao=new CustomerDAO();
		if(cdao.getBalance(accno)>0L) {
			response.sendRedirect("CloseAccount.jsp?accno="+accno+"&msg=false&balance="+cdao.getBalance(accno));
		}
		if(cdao.getBalance(accno)==0L) {
			response.sendRedirect("CloseAccount.jsp?accno="+accno+"&msg=true&balance=0");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
	}

}
