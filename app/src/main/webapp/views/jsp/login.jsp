<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	input{
		font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	}
</style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<div align="center">
		<c:if test="${error != null}"><div class="alert alert-danger">${error}</div></c:if>
		<h2><b>Account Login</b></h2>			
	</div>
	<div class="container" style="width: 50%; text-align: center;">
		
		<form name="loginform" action="<c:url value="/login" />" method="post">
   	        <div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-user'></i></span>
  				</div>
  				<input type="text" name="username" class="form-control" placeholder="Username" required>
			</div>
   	        
  	        <div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-lock'></i></span>
  				</div>
  				<input type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			 
  		    <button type="submit" class="btn btn-primary"  style="width: 550px">Login</button>
 		</form><br>
		<b>Don't have account? Register here <a href="<c:url value="/register" />">Register</a></b>
	</div>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
