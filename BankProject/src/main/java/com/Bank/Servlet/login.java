package com.Bank.Servlet;

import java.io.IOException;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acno=req.getParameter("accno");
		String mpin=req.getParameter("mpin");
		
		long accno=Long.parseLong(acno);
		int pin=Integer.parseInt(mpin);
		
		HttpSession session =req.getSession();//1
		
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c= cdao.getCustomer(accno, pin);
		
		if(c!=null )
		{
			if(c.getAccno()==1100110011) {
				session.setAttribute("Customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
				rd.forward(req, resp);
			}
			//req.setAttribute("customer",c);
			session.setAttribute("Customer", c);//2 it goes with data to dashboard so, u can give ("anything", c) where 
												// c is fully filled object of customer c
			
			//req.setAttribute("succes"," Login successfull");

			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}
		else
		{
			
			req.setAttribute("failed", "Login failed");
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		
		
		
	}

}
