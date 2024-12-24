<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        h1{
            background-color: rgb(205, 227, 239);
            height:60px;

        }
        
        
        
        .side{
            position: absolute;
            border: 2px solid black;
            width: 250px;
            height: 100%;
            background-color: #353131;
            margin-top:-8px;
        }
        .nav-link{
            color: aliceblue;
            font-size: larger;
            font-family:'Times New Roman', Times, serif;
        }
        #logout{
        background-color:#353131;
        color:white;
        margin-left:12px;
        font-family:'Times New Roman', Times, serif;
        font-size:large;
        border:none;
        }
        #logout:hover{
        color:blue;}
        body{
        background-image: url("bg.jpg");
            background-repeat: no-repeat;
            background-size:cover;}
    </style>
</head>
<body>
    
        <h1><center>RR Bank</center></h1>
 
 	
  
    
    <div class="side">
        <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="viewallcustomers.jsp">View All Customers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="updatecustomers.jsp">Update Customers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="viewalltransactions.jsp">View all Transactions</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="dashboard.jsp">Login as Normal User</a>
            </li>
            <li class="nav-item">
              <form action="logout" method="post">
               <input id="logout" type="submit" name="logout" value="Logout">
              </form>
            </li>
          </ul>
    </div>
</body>
</html>