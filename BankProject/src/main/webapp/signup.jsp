<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      
    }

    body {
      font-family: 'Arial', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-image:url("signuppic.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      color: black;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.1);
      border-radius: 10px;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      padding: 20px 30px;
      width: 350px;
      text-align: center;
      margin-left:-650px;
    }

    .login-container h1 {
      margin-bottom: 20px;
      font-size: 24px;
    }

    .form-group {
      margin-bottom: 20px;
      
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-size: 14px;
      color: black;
    }
    h4{
    color:black;
    background-color:white;
    padding:2px 4px 2px 2px;}
    
	h1{
	color:white;
	text-decoration:underline;}

	
    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border: none;
      border-radius: 5px;
      outline: none;
      background: rgba(255, 255, 255, 0.9);
      color: #333;
      
    }
    

    .form-group input:focus {
      border: 2px solid #6a11cb;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      color: #fff;
      background: #6a11cb;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
    }
	
    .btn:hover {
      background: #2575fc;
    }

    .footer {
      margin-top: 15px;
      font-size: 12px;
    }

    .footer a {
      color: #fff;
      text-decoration: underline;
    }
    #input{
    color:white;}
    
    }
	.success{
		color: green;
	}
	.failed{
		color:red;
	}
    
    
</style>
</head>
<body>
<div class="login-container">
    <h1>Signup</h1>
    <form action="signup" method="post"> 
       
      <div class="form-group">
        <label id="input" for="account-number">Full Name: </label>
        <input type="text" id="account-number" name="name" placeholder="Enter your full name" required>
      </div>
      <div class="form-group">
        <label id="input"for="account-number">Phone Number: </label>
        <input type="tel" id="account-number" name="phone" placeholder="Enter your Phone Number" required>
      </div>
      <div class="form-group">
        <label id="input" for="account-number">Email ID: </label>
        <input type="mail" id="account-number" name="mail" placeholder="Enter your Email ID" required>
      </div>
      <div class="form-group">
        <label id="input" for="mpin">MPIN</label>
        <input type="password" id="mpin" name="mpin" placeholder="Enter your MPIN" required>
      </div>
      <div class="form-group">
        <label id="input" for="account-number">Confirm Mpin: </label>
        <input type="password" id="account-number" name="cpin" placeholder="Confirm MPIN" required>
      </div>
      
      <button type="submit" class="btn">Signup</button>
      <%String success=(String)request.getAttribute("success");
		if(success!=null){%>
		<h3 class="success"><%=success%></h3>
		<%} %>
		<%String failed=(String)request.getAttribute("failed");
		if(failed!=null){%>
		<h3 class="failed"><%=failed%></h3>
		<%} %> 
      
            
    </form>
    <br>
  
</body>
</html>