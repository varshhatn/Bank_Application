package com.Bank.Servlet;

import java.io.IOException;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/reset")
public class resetpin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email= req.getParameter("mail");
		String ph=req.getParameter("phone");
		String pin=req.getParameter("pin");
		String cpin=req.getParameter("confirm");
		
		long phone=Long.parseLong(ph);
		int mpin=Integer.parseInt(pin);
		int confirmpin=Integer.parseInt(cpin);
		
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c= cdao.getCustomer(phone, email);
		
		if(c!=null && phone==c.getPhone() && cpin.equals(pin) && email.equals(c.getMail()))
		{
			c.setPin(mpin);
			boolean res=cdao.updateCustomer(c);
			
			if(res==true)
			{
				req.setAttribute("success", "Pin Changed Successfully");
				RequestDispatcher rd= req.getRequestDispatcher("resetpin.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failed", "PIN not changed");
				RequestDispatcher rd= req.getRequestDispatcher("resetpin.jsp");
				rd.forward(req, resp);
				
			}
		}
		else 
		{
			req.setAttribute("failed", "Please enter the data correctly!!!");
			RequestDispatcher rd= req.getRequestDispatcher("resetpin.jsp");
			rd.forward(req, resp);
			
		}
	}
}
