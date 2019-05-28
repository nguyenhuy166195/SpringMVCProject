<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Your information</title>
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
	<c:url value="/userInfo" var="updateUser" />
	<div class="container-fluid">
	<div align="center">
		<c:if test="${message != null}"><div class="alert alert-success"><b>${message}</b></div>
		</c:if>   
	</div>
	<div class="clearfix">
    		<span class="float-left">
    			<h3><b>User profile</b></h3>
    		</span>
    		<span class="float-right">
    			<a href="<c:url value="/userRegister"/>"><button type="button" class="btn btn-success"><i class="far fa-edit"></i>
    			 Your register</button></a>
    		</span>
  	</div>
	<hr>
	<form action="${updateUser}" method="post" modelAttribute="updateUser">		
		<div class="row" >
     	       <div class="col-sm-1">
     	            <label for="username">Username</label>
     	       </div>
      	       <div class="col-sm-5">
      	       		<div class="input-group mb-3">
  				      <div class="input-group-prepend">
   					    <span class="input-group-text" id="basic-addon1"><i class='fas fa-user'></i></span>
  				      </div>	    
  				      <input type="text" class="form-control" id="username" value="${sessionScope.user.username}"
      	              name="username" readonly="readonly"> 
				   </div>	       	 
      	       </div>
      		    		
     	       <div class="col-sm-1">
  				      <label for="password">Password</label>
			   </div>
      	       <div class="col-sm-5">
      	       		<div class="input-group mb-3">
  				      <div class="input-group-prepend">
   					    <span class="input-group-text" id="basic-addon1"><i class='fas fa-lock'></i></span>
  				      </div>
  				      <input type="text" class="form-control" id="password" value="${sessionScope.user.password}"
      	       		  name="password" pattern=".{6,}" required title="Lenght of password at least 6 characters" required>
  					</div>
      	      	</div>     		
   	    </div><hr>
   	    <div class="row">		
     	       <div class="col-sm-1">
     	       		<label for="name">Name</label>
     	       </div>
      	       <div class="col-sm-5">
      	       <div class="input-group mb-3">
  				      <div class="input-group-prepend">
   					    <span class="input-group-text" id="basic-addon1"><i class='fas fa-grin'></i></span>
  				      </div>		
  				       <input type="text" class="form-control" id="name" value="${sessionScope.user.name}"
      	       			name="name" required title="Name can't be empty" required>	      
				   </div>
      	      </div>
      		      		
     	       <div class="col-sm-1">
     	       		<label for="birthDay"> BirthDay</label>
     	       </div>
      	       <div class="col-sm-5">
      	       <div class="input-group mb-3">
  				      <div class="input-group-prepend">
   					    <span class="input-group-text" id="basic-addon1"><i class='fas fa-clock'></i></span>
  			   		  </div>   
  			   		  <input type="date" data-format="yyyy-MM-dd" class="form-control" id="birthDay"
      	        		value="${sessionScope.user.birthDay}" name="birthDay" required>
			   </div>
      	       </div>   	       
      		
   	    </div><hr>
   	    <div class="row">		
     	       <div class="col-sm-1">
     	       		<label for="email"> Email</label>
     	       </div>
      	       <div class="col-sm-5">
      	       		<div class="input-group mb-3">
  				      <div class="input-group-prepend">
   					    <span class="input-group-text" id="basic-addon1"><i class='fas fa-envelope'></i></span>
  				      </div>
  				       <input type="email" class="form-control" id="email" value="${sessionScope.user.email}"
      	       				name="email" required title="Email can't be empty and must be right syntax" required>
				   </div>
      	       	</div>  	           		
   	    </div><hr>
   	   <div align="center"><button type="submit" class="btn btn-primary" style="width: 150px;">Save</button></div>
    </form>
    </div>
</div>
<jsp:include page="footer.jsp" />
</div> 
</body></html>