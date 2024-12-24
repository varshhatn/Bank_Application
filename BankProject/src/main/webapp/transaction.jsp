<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
<style>
        .table{
            margin-top: 50px;

        }
        .barr{
            width: 100%;
            margin-top: 3px;
            display: flex;
            background-color: rgb(102, 205, 245);
            height: 40px;
        }
        
        #hh{
            font-size: x-large;
            text-decoration: underline;
            margin-top:5px;
            
         }
         #hh:hover{
            font-size: x-large;
            text-decoration: underline;
            color: purple;
            font-weight: bolder;
        }
        .endd{
            padding-left: 550px;
            }
            #cent{
                background-color: rgb(205, 227, 239);
            }
            .backbtn{
        margin-top:2px;
   		margin-left:700px;
        width:100px;
        font-size: larger;
       
        }
        .backbtn:hover{
            background-color: red;
        }
        .line{
        display:flex;}
        
    </style>
</head>
<body>
<header>
        <h1 id="cent"><center>RR Bank</center></h1>
</header>
<%Customer c1=(Customer) session.getAttribute("Customer"); %>
<%TransactionDAO tdao=new TransactionDAOImpl(); %>
<%ArrayList<Transaction> list= (ArrayList<Transaction>)tdao.getTransaction((c1.getAccno())); %>
<% Iterator<Transaction> it=(list.iterator());%>

<div class="barr">
 <ul id="hh">Welcome, <%=c1.getName()%></ul>
<ul id="hh" class="endd">Account Number: <%=c1.getAccno()%></ul> 
</div>
<hr>
<div class="line">
<h3>All Transaction of the Account No: <%=c1.getAccno() %></h3>
<a href="dashboard.jsp"><input type="button" name="back" class="backbtn" value="Back"></a>
</div>
    <table class="table table-success table-striped">
        <tr>
            <th>Transaction ID</th>
            <th>User Account No</th>
            <th>Recipent Account No</th>
            <th>Transaction date & Time</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Balance</th>
          </tr>
          <%while(it.hasNext()){
        	  Transaction t1=it.next();%>
          <tr>
           <td><%=t1.getTransactionId() %></td>
           <td><%=t1.getUser() %></td>
           <td><%=t1.getRec_acc() %></td>
           <td><%=t1.getDate() %></td>
           <td><%=t1.getTransaction() %></td>
           <td><%=t1.getAmount() %></td>
           <td><%=t1.getBalance() %></td>
          </tr>
          <%} %>
    </table>

</body>
</html>