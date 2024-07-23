package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.CustomerDAO;
import com.generators.Generator;
import com.model.Customer;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Newcustomer")
/**
 * Servlet implementation class Newcustomer
 */
public class Newcustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Newcustomer() {
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
			
			HttpSession session = request.getSession();
			Generator g=new Generator();
			long accountno=g.Acc_generator();
			int pin=g.Pass_generator();
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			long mobile=Long.parseLong(request.getParameter("mobile"));
			String address=request.getParameter("addr");
			String accounttype=request.getParameter("acctype");
			String proof=request.getParameter("proof");
			String dob=request.getParameter("dob");
			long amt=Long.parseLong(request.getParameter("amt"));
			String accountstatus=request.getParameter("accstatus");
			
			Customer cus=new Customer(name,email,mobile,dob,address,accountstatus,accountno,pin,amt,accounttype,proof);
			CustomerDAO cusdao=new CustomerDAO();
			if(cusdao.registerCustomer(cus)) {
				session.setAttribute("method", "insert");
				session.setAttribute("name",name );
				session.setAttribute("email",email );
				response.sendRedirect("Success.jsp?msg=inserted&accno="+accountno+"&pin="+pin);
			}
			else {
				response.sendRedirect("Error.jsp?msg=Not inserted");
			}
			
		}
		catch(Exception e) {
			
		}
	}

}
