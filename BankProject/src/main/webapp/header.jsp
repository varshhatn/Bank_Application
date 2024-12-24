<%@page import="com.Bank.DTO.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
.head{
            width: 100%;
            margin-top: 3px;
            display: flex;
            background-color: rgb(102, 205, 245);
            height: 40px;
        }
        #here{
            font-size: x-large;
            text-decoration: underline;
            
         }
        .end{
            padding-left: 800px;
            
        }
        #here:hover{
            font-size: x-large;
            text-decoration: underline;
            color: purple;
            font-weight: bolder;

        }
        
</style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("Customer"); %>
<div class="head">
        <ul id="here">Welcome,  <%=c.getName()%> </ul> 
        <ul id="here" class="end">Account Number:<%=c.getAccno() %></ul>
        

</div>

</body>
</html>