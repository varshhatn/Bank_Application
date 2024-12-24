<%@page import="java.util.Iterator"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Transactions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
    .body1{
    margin-top:80px;
    margin-left:350px;
    margin-right:50px;
    }
    
    .table{
    border:5px solid black;}
     th, td{
     border:5px solid black;
     }
     td{
     font-family: 'Times New Roman', Times, serif;
     }
     th{
     font-weight: 700;
     }
     #heading{
     color:white;
      text-decoration:underline;}
    
    </style>
</head>
<body>
<%@ include file="admin.jsp" %>
    <div class="body1">
        <h3 id="heading">All transactions occurred in the Bank: </h3>
        <br>
    
        
        <table class="table table-success table-striped">
            <tr>
                <th>ID<%int count=1; %></th>
                <th>Account Number</th>
                <th>Recipient Account Number</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Balance</th>
                <th>Transaction type</th>
               
            </tr>
            <%TransactionDAO tdao=new TransactionDAOImpl();
        ArrayList <Transaction> list=(ArrayList <Transaction>)tdao.getTransaction();
        Iterator<Transaction> it=(list.iterator());%>
        <%while(it.hasNext()) {
        Transaction t=it.next();%>
            <tr>
                <td><%=count++ %></td>
                <td><%=t.getUser()%></td>
                <td><%=t.getRec_acc()%></td>
                <td><%=t.getDate() %></td>
                <td><%=t.getAmount()%></td>
                <td><%=t.getBalance()%></td>
                <td><%=t.getTransaction() %></td>
                
            </tr>
            <%} %>
        </table>
    </div>
</body>
</html>

        
          
       
        
          