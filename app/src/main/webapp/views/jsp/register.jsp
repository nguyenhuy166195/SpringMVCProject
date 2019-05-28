<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
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
<body >
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<c:url var="home" value="/" scope="request" />
	<c:url value="/register" var="register" />
	
	<div class="container" style="width: 60%; text-align: center;">
		<div align="center">
			<h2><b>Register account</b></h2>
			<c:if test="${message != null}"><div class="alert alert-info">${message }</div></c:if>			
		</div>  	
 		<form name="registerForm" action="${register}" method="post" modelAttribute="registerUser" onsubmit="return check()">
   	        <div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-user'></i></span>
  				</div>
  				<input type="text" name="username" id="username" class="form-control" placeholder="Username" required 
  				 required title="Username can't be empty" oninput="testExist()" onmouseleave="leave()">
  				<b id="userExist"></b>
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-lock'></i></span>
  				</div>
  				<input type="password" id="password" name="password" class="form-control" placeholder="Password" pattern=".{6,}" required
  				required title="Lenght of password at least 6 characters">
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-lock'></i></span>
  				</div>
  				<input name="confirm" id="confirm" type="password" class="form-control" placeholder="Confirm password"
  				 pattern=".{6,}" required oninput="testConfirm()">
  				<b id="confirmPassword"></b>
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-laugh'></i></span>
  				</div>
  				<input type="text" name="name" class="form-control" placeholder="Full name" required 
  				 required title="Name can't be empty">
			</div>
   		    <div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-envelope'></i></span>
  				</div>
  				<input type="text" name="email" class="form-control" placeholder="Email" required 
  				 required title="Email can't be empty and must be right syntax">
			</div>
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-clock'></i></span>
  				</div>
  				<input type="date" data-format="yyyy-MM-dd" name="birthDay" class="form-control" required>
			</div>  		      		      		           
  		    <button type="submit" class="btn btn-primary" style="width: 550px">Register</button>  		   
 		</form>
 	
 		<script type="text/javascript">
 			var result = "";
 			function testExist(){ 			
 				var username = $("#username").val();
 				console.log("AJAX USERNAME: "+username);
 				if(username == ""){
 					return;
 				}
 				$.ajax({
					type : "GET",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					url : "${home}register/userExist",
					data : { // to send to server in request
						name: username				
					},
					dataType: 'text', // type date back from server
					timeout : 100000,
					success: function(obj, textStatus, jQxhr){
						console.log("LOG: status: "+obj+". User: "+username);				
						if(obj == "exist"){
							result = "This username existed!" ;
							$("#userExist").css("color", "red");
						}	
						else{						
							result = "This username is fine";	
							$("#userExist").css("color", "green");
						}							
						$("#userExist").text(result);
					}
				});
 			}
 		
 			function leave(){
 				var username = $("#username").val();
 				if(username == "")
 					$("#userExist").text("");
 				else
 					$("#userExist").text(result);
 			}
 		
 			function check(){
 				var password = $("#password").val();
 				var confirm = $("#confirm").val();
 				if (password != confirm) {
 					 $("#confirmPassword").css("color", "red");
 				 	 $("#confirmPassword").text("Check the confirm again!");
 			   	     return false;
 				}	
 			}
 		
 			function testConfirm(){
 				var password = $("#password").val();
 				var confirm = $("#confirm").val();
 				if(password == "" || confirm == ""){
 					$("#confirmPassword").text("");
 					return;
 				}
 				if (password != confirm) {
 				 	$("#confirmPassword").css("color", "red");
 				 	$("#confirmPassword").text("Confirm password failed!");
 				}else{
 				 	$("#confirmPassword").css("color", "green");
  				 	$("#confirmPassword").text("Confirm password worked!");
 			   	}
 			}
 		</script>
	</div>
</div>
<jsp:include page="footer.jsp" />
</div>
</body></html>