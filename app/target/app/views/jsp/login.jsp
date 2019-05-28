<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
</head>
<body>
<div id="home">
	<jsp:include page="header.jsp" />
<div id="body">
	
	<div class="container" style="width: 50%;">
  	<h2>Login here</h2>
  	<c:url value="/login" var="login" />
 	<form action="${login}" method="post">
   	        <div class="form-group">
     	       <label for="username">Username:</label>
      	       <input type="text" class="form-control" id="username" name="username" required>
   	        </div>
  	        <div class="form-group">
     	       <label for="password">Password:</label>
     		   <input type="text" class="form-control" id="password" name="password" required>
   		    </div> 
  		    <button type="submit" class="btn btn-primary">Login</button>
 	</form>
	</div>
	
</div>
	<jsp:include page="footer.jsp" />
</div>

</body>
</html>