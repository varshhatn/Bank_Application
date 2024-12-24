package com.Bank.Servlet;

import java.io.IOException;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import com.Bank.DTO.TransactionId;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deposit")
public class deposit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		
		String raccno=req.getParameter("accno");
		long accno=Long.parseLong(raccno);
		String mpin=req.getParameter("pin");
		int pin=Integer.parseInt(mpin);
		String amountt=req.getParameter("amount");
		double amount=Double.parseDouble(amountt);
		
	
		 CustomerDAO cdao=new CustomerDAOImpl();
		  Customer c=(Customer)session.getAttribute("Customer");
		  TransactionDAO tdao= new TransactionDAOImpl();
		 

		  if(c.getAccno()==accno && c.getPin()==pin && amount>0)
		  {
			  c.setBal(c.getBal()+amount);
			  boolean result=cdao.updateCustomer(c);
			  if(result==true)
			  {
				  req.setAttribute("deposit", "your deposited amount is: "+amount);
				  req.setAttribute("success", "your current balance is: "+c.getBal());
				  
				  RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
				  rd.forward(req, resp);
				  
				 
				  
				  Transaction t=new Transaction();
				  t.setTransactionId(TransactionId.generateTransactionId());
				  t.setUser(c.getAccno());
				  t.setRec_acc(c.getAccno());
				  t.setTransaction("Credited");
				  t.setAmount(amount);
				  t.setBalance(c.getBal());
				 
				  boolean result1=tdao.insertTransaction(t);
				  if(result1==true)
				  {
					  session.setAttribute("transaction", t);
					  req.setAttribute("transaction", "Transaction success");
					  RequestDispatcher rd2=req.getRequestDispatcher("deposit.jsp");
					  rd2.forward(req, resp);
					  
				  }
				  else {
					  req.setAttribute("failed", "Transaction failed");
					  RequestDispatcher rd1=req.getRequestDispatcher("deposit.jsp");
					  rd1.forward(req, resp);
				  }
				  
			  }
			  else {
				  req.setAttribute("failed", "Deposit failed");
				  RequestDispatcher rd1=req.getRequestDispatcher("deposit.jsp");
				  rd1.forward(req, resp);
				  
			  }
		  }
		  else {
			  req.setAttribute("failed", "Invalid credential");
			  RequestDispatcher rd2=req.getRequestDispatcher("deposit.jsp");
			  rd2.forward(req, resp);
			  
		  }
		
	}
}
