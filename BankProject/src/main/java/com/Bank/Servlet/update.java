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
@WebServlet("/update")
public class update extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String ph=req.getParameter("phone");
		String mailID=req.getParameter("email");
		long phone= Long.parseLong(ph);
		
		CustomerDAO cdao=new CustomerDAOImpl();
		HttpSession session=req.getSession(false);

		Customer c=(Customer)session.getAttribute("Customer");
		c.setName(name);
		c.setPhone(phone);
		c.setMail(mailID);
		boolean res=cdao.updateCustomer(c);
		if(res==true)
		{
			req.setAttribute("success", "Data updated successfully");
			RequestDispatcher rd= req.getRequestDispatcher("update.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("failed", "Data failed to update!!!");
			RequestDispatcher rd= req.getRequestDispatcher("update.jsp");
			rd.forward(req, resp);
		}
	}
}
