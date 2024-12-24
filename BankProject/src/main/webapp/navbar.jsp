<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>

<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px 20px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            display: inline-block;
            
        }

        .navbar a:hover {
            background-color: #575757;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            right: 0;
        }

        .dropdown-content a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #575757;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color:#575757
        }
        .home{
            margin-left: 830px;
            position: fixed;
        }
        .about{
            margin-left: 990px;
            
        }
        
        #logout{
        border:3px solid black;
        font-size:medium;
        background-color:black;
        color:white;
        }
        #logout:hover{
        background-color:red;
        color:white;
        }
        
    </style>
</head>
<body>
<% Customer c5 = (Customer) session.getAttribute("Customer"); %>
    
 <div class="navbar">
	
        <a class="home" href="#home">Home</a>
        <a href="aboutus.jsp" class="about">About Us</a>
        <div class="dropdown">
            <a href="#services" class="dropbtn">Services</a>
            <div class="dropdown-content">
                <a href="resetpin.jsp">Reset Pin</a>
                <a href="update.jsp">Update Profile</a>
                <a href="viewprofile.jsp">View Profile</a>
            </div>
        </div>
        <%if(c5.getAccno()==1100110011) {%>
	
<a class="admina" href="admin.jsp">Admin access</a>
	<%} %>
        
       <form action="logout" method="post">
       <input id="logout" type="submit" name="logout" value="Logout">
       </form>
    </div>


</body>
</html>