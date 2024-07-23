package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.CustomerDAO;
import com.model.Transaction;

@WebServlet("/Transactions")

/**
 * Servlet implementation class Transactions
 */
public class Transactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transactions() {
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
		
		String desc=request.getParameter("desc");
		long accno=Long.parseLong(request.getParameter("accno"));
		int amt=Integer.parseInt(request.getParameter("amt"));
		
		CustomerDAO cdao=new CustomerDAO();
		String type=request.getParameter("ttype");
		if(type.equals("credit")) {
			Transaction ts1=new Transaction(desc,0,amt,cdao.getBalance(accno));
			if(cdao.credit(accno, ts1)) {
				response.sendRedirect("CustomerDashboard.jsp?msg=success&accno="+accno);
			}
			else {
				response.sendRedirect("Error.jsp?msg=error");
			}
			
			
		}
		if(type.equals("debit")) {
			Transaction ts2=new Transaction(desc,amt,0,cdao.getBalance(accno));
			switch(cdao.withdraw(accno, ts2)) {
			case "success":
				response.sendRedirect("CustomerDashboard.jsp?msg=success&accno="+accno);
				break;
			case "high":
				response.sendRedirect("DebitCredit.jsp?msg=high");
				break;
			case "zero":
				response.sendRedirect("CustomerDashboard.jsp?msg=zero");
				break;
			case "failed":
				response.sendRedirect("Error.jsp?msg=error");
				break;
			}
			
		}
	}

}
