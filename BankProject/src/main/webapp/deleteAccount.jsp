<%@page import="com.Bank.DAO.CustomerDAOImpl"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@page import="com.Bank.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // Retrieve the account number from the request parameter
    String accno = request.getParameter("accno");
    CustomerDAO cdao = new CustomerDAOImpl();
    Customer customer = null;

    // Fetch the customer details based on account number
    if (accno != null && !accno.isEmpty()) {
        long accnum = Long.parseLong(accno);
        customer = cdao.getCustomer(accnum);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <style type="text/css">
 .tabl{
	margin-left:260px;
}
.tabl h3{
	text-align:center;
	margin:10px;
}
.tab{
	margin-top:70px;
	margin-left:350px;
	
}
.tab th{
	padding:10px 30px;
	background-color:wheat;
	padding-bottom:20px;
	
}
.tab td{
	padding:10px 30px;
	padding-bottom:20px;
	background-color:silver;
}
.delete{
	
	margin-top:30px;
	margin-left:450px;
}

.btnn{
	position:relative;
	top:-65px;
	margin-left:600px;
}
.success{
        	margin-top:20px;
        	text-align:center;
        	color:green;
        }
        .delete{
        	margin-top:20px;
        	text-align:center;
        	color:green;
        }
        .failed{
        	text-align:center;
        	margin-top:20px;
        	color:red;
        }
 
 </style>
</head>
<body>

<%@ include file="admin.jsp" %>

<div class="tabl">

<%String delete=(String)request.getAttribute("delete"); 
	if(delete!=null) {%>
	<h4 class="success"><%=delete %></h4>
	<%}%>
	
	<%String failed=(String)request.getAttribute("failed");
	if(failed!=null) {%>
	<h4 class="failed"><%=failed %></h4>
	<%}%>

<%if(customer!=null){ %>
<table class="tab">
  <thead>
    <tr>
      <th scope="col">Account Number:</th>
      <td><%=customer.getAccno() %></td>
    </tr>
    <tr>
      <th scope="col">Account Holder Name:</th>
      <td><%=customer.getName() %></td>
    </tr>
    <tr>
      <th scope="col">Phone Number:</th>
      <td><%=customer.getPhone() %></td>
    </tr>
    <tr>
      <th scope="col">Mail Id:</th>
      <td><%=customer.getMail() %></td>
    </tr>
    <tr>
      <th scope="col">Account Type:</th>
      <td>Savings Account</td>
    </tr>
    <tr>
      <th scope="col">Your Balance:</th>
      <td><%=customer.getBal() %></td>
    </tr>
  </thead>
</table>
<form action="delete" method="post" class="delete">
            <input type="hidden" name="accno" value="<%= customer.getAccno() %>">
            <input type="submit" name="delete" value="Delete" class="btn btn-danger btn-lg">
        </form>
        <a href="viewAccounts.jsp" class="btnn btn btn-secondary btn-lg mt-3">Cancel</a>
        <%} %>

</div>

</body>
</html>