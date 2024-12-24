<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transfer</title>
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
        #here{
            font-size: x-large;
            text-decoration: underline;
            margin-top:5px;
            
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
        .bar{
       
            width: 100%;
            margin-top: 3px;
            display: flex;
            background-color: rgb(102, 205, 245);
            height: 40px;
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
        padding-right:50px;}
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
<% Customer c2 = (Customer) session.getAttribute("Customer"); %>
<header>
        <h1><center>RR Bank</center></h1>
    </header>
    <div class="bar">
<ul id="here">Welcome,  <%=c2.getName()%> </ul> 
        <ul id="here" class="end">Account Number:<%=c2.getAccno() %></ul>
</div>
<hr>
<div class="headingd">
        <h1 id="in"><center>DEPOSIT </center></h1>
</div>
<% String success=(String)request.getAttribute("success");%>
        		<% if(success!=null){ %>
            <h5 class="success"><%=success %></h5>
            
            <%} %>
            
            <% String failed=(String)request.getAttribute("failed");%>
            <%if(failed!=null){ %>
             <h5 class="failed"><%=failed %></h5>
            <%} %>
    <form action="transfer" method="post" class="form">
        <div class="form1">
            <label>Enter Your Account Number: </label>
            <input type="text" name="accno" placeholder="Your Acc No" value="<%=c2.getAccno()%>" >
            <br><br>
            <label>Enter Recipient Account Number: </label>
            <input type="text" name="raccno" placeholder="Recipient Acc No">
            <br><br>
            <label>Enter the amount to be transferred: </label>
            <input type="text" name="amount" placeholder="$$$$">
            <br><br>
            <label>Enter MPIN: </label>
            <input type="password" name="pin" placeholder="Enter PIN">
            <br><br><br>
            <input type="submit" name="transfer" value="Transfer" id="dsub"> 
            <a href="dashboard.jsp"><input type="button" name="back" value="Back" id="bbut"></a>
            
        </div>
    </form>
</body>
<%@ include file="footer.jsp"%>
</html>