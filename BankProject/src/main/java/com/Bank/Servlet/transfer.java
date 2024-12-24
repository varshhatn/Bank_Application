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
@WebServlet("/transfer")
public class transfer extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		
		String useraccno=req.getParameter("accno");
		String repaccno=req.getParameter("raccno");
		String amountt= req.getParameter("amount");
		String mpin=req.getParameter("pin");
		
		long saccno=Long.parseLong(useraccno);
		long raccno=Long.parseLong(repaccno);
		double amount=Double.parseDouble(amountt);
		int pin=Integer.parseInt(mpin);
		
		
		 CustomerDAO cdao=new CustomerDAOImpl();
		 Customer c=(Customer)session.getAttribute("Customer");
		 Customer receiver= cdao.getCustomer(raccno);
		 
		 TransactionDAO tdao=new TransactionDAOImpl();
		 Transaction t=new Transaction();
		 Transaction t1=new Transaction();
		
		 if(c.getAccno()!=receiver.getAccno() && c.getBal()>0 && c.getBal()>=amount && amount>0 && c.getBal()>0)
		  {
			 if(c.getPin()==pin)
			 {
				 c.setBal(c.getBal()-amount);
				 boolean s_res=cdao.updateCustomer(c);
				 if(s_res==true)
				 {
					 t.setTransactionId(TransactionId.generateTransactionId());
					 t.setUser(c.getAccno());
					 t.setTransaction("DEBITED");
					 t.setRec_acc(receiver.getAccno());
					 t.setAmount(amount);
					 t.setBalance(c.getBal());
					 boolean result= tdao.insertTransaction(t);
				 }
				 
				 receiver.setBal(receiver.getBal()+amount);
				 boolean r_res=cdao.updateCustomer(receiver);
				 if(r_res==true)
				 {
					 t1.setTransactionId(TransactionId.generateTransactionId());
					 t1.setUser(receiver.getAccno());
					 t1.setTransaction("CREDITED");
					 t1.setRec_acc(c.getAccno());
					 t1.setAmount(amount);
					 t1.setBalance(c.getBal());
					 boolean result= tdao.insertTransaction(t1);
				 }
				 
				 if(s_res && r_res)
				 {
					 session.setAttribute("receiver", t1);
					 req.setAttribute("success","Transaction successfull");
					 req.setAttribute("transfer", "Your current balance is: "+c.getBal() );
					 RequestDispatcher rd = req.getRequestDispatcher("transfer.jsp");
					 rd.forward(req, resp);
				 }
				 else {
					 req.setAttribute("failed", "Transaction failed");
					 RequestDispatcher rd = req.getRequestDispatcher("transfer.jsp");
					 rd.forward(req, resp);

				 }
			 }
			 else {
				 req.setAttribute("failed", "Invalid Pin");
				 RequestDispatcher rd = req.getRequestDispatcher("transfer.jsp");
				 rd.forward(req, resp);

			 }
			  
		  }	
		  else {
			  req.setAttribute("failed", "Invalid Credentials please try again...");
			  RequestDispatcher rd = req.getRequestDispatcher("transfer.jsp");
			  rd.forward(req, resp);
		  }
	}

}

