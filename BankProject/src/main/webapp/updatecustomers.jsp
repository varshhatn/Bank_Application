<%@page import="com.Bank.DAO.CustomerDAOImpl"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer</title>
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
        <h3 id="heading">Delete & View Customer's Data</h3>
        <br>
        <table class="table">
         <tr>
                <th>ID<%int count=1; %></th>
                <th>Account Number</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Mail</th>
                <th>Balance</th>
                <th>Pin</th>
                <th>View</th>
                <th>Delete</th>
            </tr>
           
            <%CustomerDAO cdao=new CustomerDAOImpl();
            ArrayList<Customer> list= (ArrayList<Customer>) cdao.getCustomer();
            Iterator<Customer> it=list.iterator();%>
            <% while(it.hasNext()){
            	Customer c5=it.next();%>
             <tr>
                <td><%=count++ %></td>
                <td><%=c5.getAccno() %></td>
                <td><%=c5.getName()%></td>
                <td><%=c5.getPhone() %></td>
                <td><%=c5.getMail() %></td>
                <td><%=c5.getBal() %></td>
                <td><%=c5.getPin()%></td>
                <td><a href="viewUsers.jsp?accno=<%=c5.getAccno() %>" class="btnn btn btn-primary btn-sm"><i class="bi bi-eye"></i>View</a></td>
                <td><a href="deleteAccount.jsp?accno=<%=c5.getAccno() %>" class="btn btn-danger btn-sm ms-3"><i class="bi bi-trash"></i>Delete</a></td>
            </tr>
            <%} %>
        </table>
    </div>
</body>
</html>