<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset PIN</title>
<style>
        .form{
            border: 5px solid black;
            margin-top: 50px;
            margin-right: 450px;
            margin-left: 450px;
            padding-top: 20px;
            padding-left: 120px;
            padding-bottom: 30px;
            align-items: center;
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
        color:green;
        }
        .failed{
        color:red;
        }
</style>
</head>
<body>
<header>
        <h1><center>RR Bank</center></h1>
</header>
<% Customer c3 = (Customer) session.getAttribute("Customer"); %>
<div class="bar">
<ul id="here">Welcome,  <%=c3.getName()%> </ul> 
        <ul id="here" class="end">Account Number:<%=c3.getAccno() %></ul>
</div>
<hr>
<div class="b1">
    <div class="headingd">
        <h1 id="in"><center>RESET PIN </center></h1>
</div>

    <form action="reset" method="post" class="form">
        <div class="form1">
            <label>Enter Your MAIL ID: </label>
            <input type="text" name="mail" value="<%=c3.getMail()%>" >
            <br><br>
            <label>Enter PHONE NUMBER: </label>
            <input type="text" name="phone" placeholder="Enter Phno" required>
            <br><br>
            <label>Enter New PIN: </label>
            <input type="text" name="pin" placeholder="Your new PIN" required>
            <br><br>
            <label>Confirm PIN: </label>
            <input type="text" name="confirm" placeholder="Re-Enter your PIN" required>
            <br><br><br>
            <input type="submit" name="submit" value="RESET PIN" id="dsub"> 
            <a href="dashboard.jsp"><input type="button" name="back" value="Back" id="bbut"></a>
            
        </div>
        
        <%String success=(String)request.getAttribute("success");%>
        <% if(success!=null){%>
        <h3 class="success"><%=success%></h3>
       	<%} %>
       	<%String failed=(String)request.getAttribute("failed");%>
        <% if(failed!=null){%>
        <h3 class="failed"><%=failed%></h3>
       	<%} %>
       	
    </form>

</body>
<%@ include file="footer.jsp"%>

</html>