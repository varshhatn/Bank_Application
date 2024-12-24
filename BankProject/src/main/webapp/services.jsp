<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Services</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
        .end{
        padding-left:750px;
        }
        #he{
            background-color: rgb(205, 227, 239);
        }

        .div{
            display: flex;
        }
        .card {
            margin-left: 100px;
            margin-top: 60px;
            justify-content: space-between;
        }
        .sec{
            
            margin-left: 150px;
        }
        .three{
            
            margin-left: 200px;
        }
        .card-title{
            text-align: center;
        }
        .card-header{
            text-align: center;
        }
        .btn{
            margin-left: 80px;

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
<div class="div">
    <div class="card text-bg-primary mb-3" style="max-width: 18rem;">
      <div class="card-header">UPDATE </div>
      <div class="card-body">
        <h5 class="card-title">Update Account</h5>
        <p class="card-text">Click here to update you account</p>
        <a href="update.jsp"><button type="button" class="btn btn-light">Update</button></a>
      </div>
    </div>
    
    <div class="card text-bg-light mb-3 sec" style="max-width: 18rem;">
      <div class="card-header">RESET PIN</div>
      <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">Click here to reset MPIN</p>
        <a href="resetpin.jsp"><button type="button" class="btn btn-primary">Reset PIN</button></a>
        
      </div>
    </div>

    <div class="card text-bg-primary mb-3 three" style="max-width: 18rem;">
      <div class="card-header">VIEW PROFILE</div>
      <div class="card-body">
        <h5 class="card-title">User Profile</h5>
        <p class="card-text">Click here to view your profile</p>
        <a href="viewprofile.jsp"><button type="button" class="btn btn-light">View</button></a>
      </div>
    </div>
    </div>

</body>
</html>