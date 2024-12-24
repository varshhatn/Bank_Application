package com.Bank.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/signup")
public class signup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String ph=req.getParameter("phone");
		String mail=req.getParameter("mail");
		String mpin=req.getParameter("mpin");
		String cpin=req.getParameter("cpin");
		
		
		long phone=Long.parseLong(ph);
		int pin=Integer.parseInt(mpin);
		int confirm=Integer.parseInt(cpin);
		
		
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=new Customer();
		
		if(confirm==pin)
		{
			c.setName(name);
			c.setPhone(phone);
			c.setMail(mail);
			c.setPin(pin);
			boolean result=cdao.insertCustomer(c);
			if(result==true)
			{
				req.setAttribute("success", "Signup successfull");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
		
			else
			{
				req.setAttribute("failed", "Signup Failed");
				RequestDispatcher rd= req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			}
		
		
		}
		else
		{
			req.setAttribute("failed", "Password mismatch");
			RequestDispatcher rd= req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
		}
	}
}
