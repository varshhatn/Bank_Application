<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ViewProfile</title>
</head>
<style>
        .table, td{
            border: 2px solid black;
            border-radius: 3px;
        }
        td{
            width: 250px;
            height: 40px;
        }
        .t1{
            padding-top: 55px;
            padding-left: 500px;
        }
        tr:nth-child(even) {background-color: #f2f2f2;}

        td{
            text-align: justify;
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
        padding-left:750px;
        }
        #he{
            background-color: rgb(205, 227, 239);
        }
        .backbtn{
        margin-left:725px;
        position:relative;
        margin-top:20px;
        width:100px;
        font-size: larger;
        }
        .backbtn:hover{
            background-color: red;
        }
        
</style>
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
        <h1 id="in"><center>VIEW PROFILE</center></h1>
</div>

<div class="t1">
<table class="table">
    <tr>
        <td><center>TYPES</center></td>
        <td><center>VALUES</center></td>
    </tr>
    <tr>
        <td>Account Number</td>
        <td><%=c1.getAccno() %></td>
    </tr>
    <tr>
        <td>Account Holder's Name</td>
        <td><%=c1.getName() %></td>
    </tr> 
    <tr>
        <td>Phone Number</td>
        <td><%=c1.getPhone() %></td>
    </tr>
    <tr>
        <td>EMAIL-ID</td>
        <td><%=c1.getMail() %> </td>
    </tr>
    <tr>
        <td>Account Balance</td>
        <td><%=c1.getBal() %></td>
    </tr>
  </table>
  <h4>Click here to Updata your data <a href="update.jsp"> UPDATE </a> or to change MPin <a href="resetpin.jsp">Change PIN</a></h4>
  
  </div>
  <a href="dashboard.jsp"><input type="button" name="back" class="backbtn" value="Back" ></a>
</body>
<%@ include file="footer.jsp"%>
</html>