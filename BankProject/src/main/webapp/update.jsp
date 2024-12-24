<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
<style>
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
        padding-left:750px;
        }
        #he{
            background-color: rgb(205, 227, 239);
        }
        .divv{
            border: 5px solid black;
            margin-top: 50px;
            margin-right: 450px;
            margin-left: 450px;
            padding-top: 20px;
            padding-left: 120px;
            padding-bottom: 30px;
            align-items: center;
        }
        
        .form:hover{
            border-radius: 10px;
        }
        .headingd{
            margin-top: 50px;
            text-decoration: underline;
        }
        #up{
            font-size: large;
            width: 100px;
            border: 3px solid black;
           margin-left: 70px;
        }
        #up:hover{
            background-color: red;
        }
         .backbtn{
        margin-left:35px;
        margin-top:20px;
        width:100px;
        font-size: larger;
        }
        .backbtn:hover{
            background-color: red;
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
<%Customer c1=(Customer) session.getAttribute("Customer");%>
<header>
        <h1 id="he"><center>RR Bank</center></h1>
</header>

<div class="barr">
<ul id="hh">Welcome, <%=c1.getName()%></ul>
<ul id="hh" class="endd">Account Number: <%=c1.getAccno()%></ul>
</div>
<hr>
    <div class="headingd">
        <h1 id="in"><center>UPDATE  <%=c1.getName() %>  DETAILS</center></h1>
</div>
  <form action="update" method="post" class="form">
    <div class="divv">
        <label>Enter Full Name: </label>
        <input id="submit1" type="text" name="name" placeholder="Enter Name" required>
        <br><br>
        <label>Enter Phone Number: </label>
        <input id="submit1" type="tel" name="phone" placeholder="Enter Phno" required>
        <br><br>
        <label>Enter Email-ID: </label>
        <input id="submit1" type="email" name="email" placeholder="Enter EmailID" required>
        <br><br>
        <input type="submit" name="submit" value="UPDATE" id="up">
        <a href="dashboard.jsp"><input type="button" name="back" class="backbtn" value="Back" ></a>
        <br><br>
        
        <%String success=(String)request.getAttribute("success");%>
        <% if(success!=null){%>
        <h3 class="success"><%=success%></h3>
       	<%} %>
       	<%String failed=(String)request.getAttribute("failed");%>
        <% if(failed!=null){%>
        <h3 class="failed"><%=failed%></h3>
       	<%} %>
       	
    </div>
  </form>

</body>
<%@ include file="footer.jsp"%>
</html>