<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About US</title>
<style>
h1{
            background-color: rgb(205, 227, 239); 
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
            position:absolute;
            margin-top:-23px;
            display: flex;
            background-color: rgb(102, 205, 245);
            height: 40px;
        }
        
        .parent{
            display: flex;
        }
        #point{
            text-align: center;
            color: black;
        }
        .child{
            border: 3px solid black;
            margin-left: 30px;
            margin-right: 30px;
            margin-top: 40px;
            background-color: rgb(110, 206, 235);
            padding: 3px 5px 3px 5px;
            text-align: center;
            
        }
        .child:hover{
            background-color:rgb(178, 234, 248);
            color: black;
            border-radius: 10px;
            font-size:large;
            font-weight:500;
            
        }
        #point:hover{
            color: black;
            text-decoration:underline;
        }
        #about1{
            text-align: center;
            color: black;
            margin-top: 40px;
        }
        #abtus{
        height:40px;
        padding-top:8px;}
        p{
        text-align:center;
        }
        
      </style>
</head>
<body>
<header>
        <h1><center>RR Bank</center></h1>
       
</header>
<% Customer c = (Customer) session.getAttribute("Customer"); %>

<div class="bar">
<ul id="here">Welcome,  <%=c.getName()%> </ul> 
        <ul id="here" class="end">Account Number:<%=c.getAccno() %></ul>
</div>
<hr>
<section id="about">
    <div id="about1">
        <h1 id="abtus">ABOUT US</h1>
        <p></p>
    </div>
    <div class="parent">
        <div class="child">
            <h3 id="point">MISSION</h3>
            <br>
            <img src="mission.jpg" width="175px" height="175px" alt="mission">
            <p>Our mission is to deliver innovative and reliable financial solutions tailored to meet the needs of our customers. By fostering trust, transparency, and technological advancement, we aim to empower individuals, businesses, and communities to achieve their financial goals while ensuring sustainability and long-term growth.</p>
            </div>
        <div class="child">
            <h3 id="point">VISION</h3><br>
            <img src="vision.jpeg" width="175px" height="175px" alt="vision">
            <p>To be a leading financial institution recognized for excellence, innovation, and customer-centricity, driving economic growth and financial inclusion while building lasting relationships and creating a positive impact on society.</p>
            </div>
        <div class="child">
            <h3 id="point">ACHIEVEMENTS</h3><br>
            <img src="acheievements.jpeg" width="175px" height="175px" alt="achievments">
            <p>Our bank has consistently delivered exceptional value through milestones such as achieving industry-leading customer satisfaction rates, launching innovative digital banking solutions, expanding our network to underserved communities, and receiving prestigious awards for excellence in service, sustainability, and financial innovation.</p>
            </div>

    </div>
</section>
<br>
</body>
</html>