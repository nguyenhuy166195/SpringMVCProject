<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
</head>
<body>
<div id="home">
<jsp:include page="header.jsp" />
<div id="body">
	
<div class="container" style="">
  	<h2>Register here</h2>
  	<c:url value="/register" var="register" />
 	<form action="${register}" method="post" modelAttribute="user">
   	        <div class="form-group">
     	       <label for="username">Username:</label>
      	       <input type="text" class="form-control" id="username" placeholder="Enter username" 
      	       name="username" required>
   	        </div>
  	        <div class="form-group">
     	       <label for="pwd">Password:</label>
     		   <input type="text" class="form-control" id="pwd" placeholder="Enter password"
     		    name="password" pattern=".{6,}" required title="6 characters minimum" required>
   		    </div> 
   		    <div class="form-group">
     	       <label for="name">Full name:</label>
     		   <input type="text" class="form-control" id="name" placeholder="Enter your full name"
     		    name="name" required>
   		    </div> 
   		    <div class="form-group">
     	       <label for="email">Email:</label>
     		   <input type="email" class="form-control" id="email" placeholder="Enter email"
     		    name="email" required>
   		    </div> 
   		    <div class="form-group">
     	       <label for="phoneNumber">Phone Number:</label>
     		   <input type="text" class="form-control" id="phoneNumber" placeholder="Enter phone number"
     		    name="phoneNumber" pattern=".{10,}"   required title="10 to 11 characters" required>
   		    </div> 
   		    <div class="form-group">
     	       <label for="birthDay">Birth Day:</label>
     		   <input type="text" class="form-control" id="birthDay" placeholder="Enter birthDay"
     		    name="birthDay">
   		    </div> 
  		    <button type="submit" class="btn btn-primary">Register</button>
 	</form>
 	<h1>hwloaas</h1>
</div>
	
</div>
<jsp:include page="footer.jsp" />
</div>

</body>
</html>