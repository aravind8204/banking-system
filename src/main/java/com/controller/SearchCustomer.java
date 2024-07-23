package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.CustomerDAO;
import com.model.Customer;


@WebServlet("/SearchCustomer")
/**
 * Servlet implementation class SeachCustomer
 */
public class SearchCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
			String accno=request.getParameter("search");
			CustomerDAO cdao=new CustomerDAO();
			List<Customer> ls=new ArrayList<>();
			if(accno!=null && accno.trim().isEmpty()) {
				ls=cdao.searchCustomer(Long.parseLong(accno));
			}
			else {
				ls=cdao.getAllCustomers();
			}
			
			
			request.setAttribute("customers", ls);
			RequestDispatcher rd=request.getRequestDispatcher("AdminDashboard.jsp");
			rd.forward(request, response);
			
	}

}
