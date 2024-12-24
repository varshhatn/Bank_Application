<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RRBank Dashboard-Normal user</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
<style>
h1{
            background-color: rgb(205, 227, 239);
        }
        .nav-item1{
            padding-left: 30px;
        }
        .nav-item2{
            position: relative;
            padding-left:700px ; 
        }
        .div{
            display: flex;
        }
        .card {
            margin-left: 100px;
            margin-top: 60px;
            justify-content: space-between;
        }
        .sec{
            
            margin-left: 150px;
        }
        .three{
            
            margin-left: 200px;
        }
        .card-title{
            text-align: center;
        }
        .card-header{
            text-align: center;
        }
        .btn{
            margin-left: 80px;

        }
        #tran{
          padding-left: 20px;
        }
        .card-text{
        text-align:center;
        }
        .card-title{
        text-decoration:underline;
        }
        .img{
        width:50px;
        height:50px;
        }
        #rrb{
        font-size:large;
        padding-left:5px;
        padding-top:12px;
        }
        #tran1{
        margin-left:80%;
        width:200px;
        border:3px solid black;
        font-size:larger;
        }
        
        #tran1:hover{
        border:3px solid red;
        background-color:black;
        color:white;}
        
        .dropdown{
        height:50px;
        border-bottom:none;
        border-top-left-radius:5px;
        border-top-right-radius:5px;
        border:2px solid lightblue;
        }
        
       
</style>
</head>
<body>
       <header>
        <h1><center>RR Bank</center></h1>
    </header>
    <% Customer c1 = (Customer) session.getAttribute("Customer"); %>
    
    <!-- navbar -->
    <%@ include file="navbar.jsp"%>
   
        
      <%@ include file="header.jsp"%>
		

      <!-- 3cards -->
       <div class="div">
      <div class="card text-bg-primary mb-3" style="max-width: 18rem;">
        <div class="card-header">BALANCE</div>
        <div class="card-body">
          <h5 class="card-title">View Balance</h5>
          <p class="card-text">Click here to view the current balance of your account</p>
          <a href="balance.jsp"><button type="button" class="btn btn-light">Balance</button></a>
        </div>
      </div>
      
      <div class="card text-bg-light mb-3 sec" style="max-width: 18rem;">
        <div class="card-header">DEPOSIT</div>
        <div class="card-body">
          <h5 class="card-title">Credit/Deposit</h5>
          <p class="card-text">Click here to deposit the amount </p>
          <a href="deposit.jsp"><button type="button" class="btn btn-primary">Deposit</button></a>
          
        </div>
      </div>

      <div class="card text-bg-primary mb-3 three" style="max-width: 18rem;">
        <div class="card-header">TRANSFER AMOUNT</div>
        <div class="card-body">
          <h5 class="card-title">Debit/Transfer Amount</h5>
          <p class="card-text">Click here to transfer the amount to others</p>
          <a href="transfer.jsp"><button type="button" class="btn btn-light">Transfer</button></a>
        </div>
      </div>
      </div>
      <!-- table for recent transaction -->
      <br>
      <br><br><br>
      <h4 id="tran">RECENT TRANSACTIONS : </h4> 
      <a href="transaction.jsp"><input type="button" name="view alltransaction" value="View All Transactions" id="tran1"></a>
      <br><br>
    
    	
      <div class="recent">
        <table class="table table-dark table-hover">
          <tr>
            <th>Transaction ID</th>
            <th>User Account No</th>
            <th>Recipent Account No</th>
            <th>Transaction date & Time</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Balance</th>
          </tr>
          <%TransactionDAO tdao= new TransactionDAOImpl();
          ArrayList<Transaction> list=(ArrayList<Transaction>) tdao.getTransaction(c.getAccno());
          Iterator<Transaction> it=list.iterator();
          int i=1;%>
          <% while(it.hasNext()&& i<=5) {
          Transaction t=it.next();%>
          
          <tr>
          
           <td><%=t.getTransactionId() %></td>
           <td><%=t.getUser() %> </td>
           <td><%=t.getRec_acc() %></td>
           <td><%=t.getDate()%></td>
           <td><%=t.getTransaction() %></td>
           <td><%=t.getAmount() %> </td>
           <td> <%=t.getBalance() %></td>
           
          </tr>
          <%i++; %>
          <%} %>
        </table>
      </div>
	
</body>
</html>