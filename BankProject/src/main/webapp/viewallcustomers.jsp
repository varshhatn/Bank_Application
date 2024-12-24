<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DAO.CustomerDAOImpl"%>
<%@page import="com.Bank.DAO.CustomerDAO"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view all customers</title>
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
     text-decoration:underline;
     }
    </style>
</head>
<body>
  <%@ include file="admin.jsp" %>
 
    <div class="body1">
        <h3 id="heading">View All Customers : </h3>
        <br>
        <table class="table">
            <tr>
                <th>ID<%int count=1; %></th>
                <th>Account Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Mail</th>
                <th>Balance</th>
            </tr>
           
            <%CustomerDAO cdao=new CustomerDAOImpl();
            ArrayList<Customer> list= (ArrayList<Customer>) cdao.getCustomer();
            Iterator<Customer> it=list.iterator();%>
            <% while(it.hasNext()){
            	Customer c1=it.next();%>
            
             <tr>
                <td><%=count++ %></td>
                <td><%=c1.getAccno() %></td>
                <td><%=c1.getName()%></td>
                <td><%=c1.getPhone() %></td>
                <td><%=c1.getMail() %></td>
                <td><%=c1.getBal() %></td>
            </tr>
            <%} %>
        </table>
    </div>
    
</body>
</html>