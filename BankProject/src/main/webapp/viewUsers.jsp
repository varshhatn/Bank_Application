<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@page import="com.Bank.DAO.CustomerDAOImpl"%>
<%@page import="com.Bank.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // Retrieve the account number from the request parameter
    String accno = request.getParameter("accno");
    CustomerDAO cdao = new CustomerDAOImpl();
    Customer customer = null;

    // Fetch the customer details based on account number
    if (accno != null && !accno.isEmpty()) {
        long accnum = Long.parseLong(accno);
        customer = cdao.getCustomer(accnum);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Users</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
 .tabl{
	margin-left:260px;
}
.tabl h3{
	text-align:center;
	margin:10px;
}
.tab{
	margin-top:30px;
	margin-left:350px;
	
}
.tab th{
	padding:10px 30px;
	background-color:wheat;
	padding-bottom:20px;
	
}
.tab td{
	padding:10px 30px;
	padding-bottom:20px;
	background-color:silver;
}

.trans{
		margin-right:20px;
		margin-left:260px;
		margin-top:30px;
		
	}
.table{
		margin-right:20px;
		margin-top:60px;
		position:relative;
		bottom:40px;
		
	}

</style>
</head>
<body>
<%@ include file="admin.jsp"%>

<div class="tabl">
<center><h3>Account Details</h3></center>
<%if(customer!=null) { %>
<table class="tab">
  <thead>
    <tr>
      <th scope="col">Account Number:</th>
      <td><%=customer.getAccno() %></td>
    </tr>
    <tr>
      <th scope="col">Account Holder Name:</th>
      <td><%=customer.getName() %></td>
    </tr>
    <tr>
      <th scope="col">Phone Number:</th>
      <td><%=customer.getPhone() %></td>
    </tr>
    <tr>
      <th scope="col">Mail Id:</th>
      <td><%=customer.getMail() %></td>
    </tr>
    <tr>
      <th scope="col">Account Type:</th>
      <td>Savings Account</td>
    </tr>
    <tr>
      <th scope="col">Your Balance:</th>
      <td><%=customer.getBal() %></td>
    </tr>
  </thead>
</table>
</div>
<div class="trans">
		<h3>Transaction Details</h3>
		<table class="tablee table">
			<thead>
				<th>ID<%int count=1; %></th>
				<th>Transaction Id</th>
				<th>User Account Number</th>
				<th>Reciever Account Number</th>
				<th>Transaction Date</th>
				<th>Transaction Type</th>
				<th>Amount</th>
				<th>Balance</th>
			</thead>
			<tbody>
			<%
			TransactionDAO tdao=new TransactionDAOImpl();
			ArrayList<Transaction> list=(ArrayList<Transaction>)tdao.getTransaction(customer.getAccno());
			Iterator<Transaction> it=list.iterator();%>
			<%while(it.hasNext()){ 
			Transaction t=it.next();%>
				<tr class="table-active">
					<td><%=count++ %></td>
					<td><%=t.getTransactionId()%></td>
					<td><%=t.getUser() %></td>
					<td><%=t.getRec_acc() %></td>
					<td><%=t.getDate() %></td>
					<td><%=t.getTransaction() %></td>
					<td><%=t.getAmount() %></td>
					<td><%=t.getBalance() %></td>
				</tr>
				<%}%>

			</tbody>
		</table>
		<%}%>
	</div>


</body>
</html>