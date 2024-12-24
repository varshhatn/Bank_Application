<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Balance</title>

<style>
        .formb{
            margin-top:50px;
            margin-right: 500px;
            margin-left: 500px;
            border: 3px solid black;
            border-radius: 15px; 
        }
        #txt{
            font-size: x-large;

        }
        h3{
            text-align: center;
        }
        .formb:hover{
            border:6px solid blue;
        }
        .backbtn{
            width: 140px;
            font-size: larger;
            margin-left: 170px;
            margin-bottom: 30px;
        }
        .backbtn:hover{
            background-color: red;
        }
        
		h1{
            background-color: rgb(205, 227, 239); 
        }
        .div1{
        text-align:center;
        font-size:xx-larger;
        margin-top:60px;
        }
        h5{
        font-size:large;}
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
        
    </style>

</head>

<body>


<% Customer c = (Customer) session.getAttribute("Customer"); %>
<header>
        <h1><center>RR Bank</center></h1>
       
</header>

<hr>
<div class="bar">
<ul id="here">Welcome,  <%=c.getName()%> </ul> 
        <ul id="here" class="end">Account Number:<%=c.getAccno() %></ul>
</div>
<hr>
<div class="div1">
<h3>-----Account Holder Details-----<h3>

<h5>Account User Name: <%=c.getName() %> </h5>
<h5>Account Number: <%=c.getAccno() %> </h5>

</div> 
<form action="balance" method="post" class="formb">
		
        <h4 id="txt"><center>Your Balance is:</center></h4> 
        <h3> <%=c.getBal()%></h3>
        <a href="dashboard.jsp"><input type="button" name="back" class="backbtn" value="Back" ></a>

    </form>

</form>
</body>
</html>