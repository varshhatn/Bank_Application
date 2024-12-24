<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
<style>
        .form{
            border: 5px solid black;
            margin-top: 50px;
            margin-right: 450px;
            margin-left: 450px;
            padding-top: 20px;
            padding-left: 120px;
            padding-bottom: 30px;
        }
        .headingd{
            margin-top: 50px;
            text-decoration: underline;
        }
        .form:hover{
            border-radius: 10px;
        }
        #dsub{
            font-size: large;
            width: 150px;
            border: 3px solid black;


        }
        #bbut{
            font-size: large;
            width: 100px;
            margin-left: 100px;
            border: 3px solid black;
        }
        #dsub:hover{
            background-color: red;
        }
        #bbut:hover{
            background-color: red;
        }
        h1{
            background-color: rgb(205, 227, 239);
        }
        #in{
        background-color:white;
        }
        .bar{
            width: 100%;
            margin-top: 3px;
            display: flex;
            background-color: rgb(102, 205, 245);
            height: 40px;
        }
        
        #here{
            font-size: x-large;
            text-decoration: underline;
            margin-top:5px;
            
         }
         #here:hover{
            font-size: x-large;
            text-decoration: underline;
            color: purple;
            font-weight: bolder;
        }
        .end{
        padding-left:750px;
        }
        
        .success{
		color: green;
		text-align:center;
	}
	.failed{
		color:red;
		text-align:center;
	}

    </style>
</head>
<body>
<% Customer c3 = (Customer) session.getAttribute("Customer"); %>
<header>
        <h1><center>RR Bank</center></h1>
</header>
<div class="bar">
<ul id="here">Welcome,  <%=c3.getName()%> </ul> 
        <ul id="here" class="end">Account Number:<%=c3.getAccno() %></ul>
</div>
<hr>
<div class="headingd">
        <h1 id="in"><center>DEPOSIT </center></h1>
</div>
<% String deposit=(String)request.getAttribute("deposit");%>
        		<% if(deposit!=null){ %>
            <h5 class="success"><%=deposit %></h5>
            
            <%} %>
<% String success=(String)request.getAttribute("success");%>
        		<% if(success!=null){ %>
            <h5 class="success"><%=success %></h5>
            
            <%} %>
            
            <% String failed=(String)request.getAttribute("failed");%>
            <%if(failed!=null){ %>
             <h5 class="failed"><%=failed %></h5>
            <%} %>
    <form action="deposit" method="post" class="form">
        <div class="form1">
            <label>Enter Your Account Number: </label>
            <input type="text" name="accno" value="<%=c3.getAccno()%>">
            <br><br>
            <label>Enter the amount to be deposited: </label>
            <input type="text" name="amount" placeholder="$$$$">
            <br><br>
            <label>Enter PIN: </label>
            <input type="password" name="pin" placeholder="****">
            <br><br><br>
            <input type="submit" name="deposit" value="Deposit" id="dsub"> 
            <a href="dashboard.jsp"><input type="button" name="back" value="Back" id="bbut"></a>
            
        </div>
        
    </form>
    
<%@ include file="footer.jsp"%>
</body>
</html>