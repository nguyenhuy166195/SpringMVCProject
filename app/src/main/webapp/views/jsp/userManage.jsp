<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User Manage</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	td{
		font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
		font-size: 16px;
	}
</style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<div align="center">
	    <c:if test="${message != null}"><div class="alert alert-success"><strong>${message}</strong></div></c:if>
	</div>
	<div class="container" style="width: 90%;">
	<div class="clearfix">
    		<span class="float-left">
    			<h3><b>User Manage</b></h3>
    		</span>
    		<span class="float-right">
    			<a href="<c:url value="/register"/>"><button type="button" class="btn btn-success"><i class="fa fa-plus"></i>
    			 Add new user</button></a>
    		</span>
  	</div>		
	<table class="table table-striped table-hover">
	<thead>
      <tr>
        <th><i class="fas fa-user-graduate"></i>Username</th>
        <th><i class='fas fa-laugh'></i>Name</th>
        <th><i class="fas fa-envelope"></i>Email</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
	<c:forEach items="${listUser}" var="user">
		<c:set var = "edit" value = "edit${user.username}" />
		<c:set var = "editModal" value = "#edit${user.username}" />
		<c:set var = "del" value = "del${user.username}" />
		<c:set var = "delModal" value = "#del${user.username}" />
		<tr>
        	<td>${user.username}</td>
        	<td>${user.name}</td>
        	<td>${user.email}</td>
        	<td>
        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="${editModal}"><i class="far fa-edit"></i> Edit</button>
        	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="${delModal}"><i class="fa fa-trash"></i> Delete</button>
        	</td>
      	</tr>
      	<div class="modal" id="${edit}" >
    	<div class="modal-dialog">
    		<div class="modal-header">
               <h4 class="modal-title" ><b>Edit user</b></h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
     	<div class="modal-content">    		
			<form action="<c:url value="/userManage-edit" />" method="post" modelAttribute="editUser">
            <div class="modal-body">
            	<div class="input-group mb-3">
  					<div class="input-group-prepend">
   						<span class="input-group-text" id="basic-addon1"><i class='fas fa-user'></i></span>
  					</div>
  					<input type="text" name="username" class="form-control" placeholder="Username" value="${user.username}" readonly>
				</div>  
				<div class="input-group mb-3">
  					<div class="input-group-prepend">
   						<span class="input-group-text" id="basic-addon1"><i class='fas fa-lock'></i></span>
  					</div>
  					<input type="text" name="password" class="form-control" placeholder="Password" value="${user.password}"
					pattern=".{6,}" required required title="Lenght of password at least 6 characters">
				</div>           	
				<div class="input-group mb-3">
  					<div class="input-group-prepend">
   						<span class="input-group-text" id="basic-addon1"><i class='fas fa-laugh'></i></span>
  					</div>
  					<input type="text" name="name" class="form-control" placeholder="Full name" value="${user.name}" required 
  				 	required title="Name can't be empty">
				</div>
   		    	<div class="input-group mb-3">
  					<div class="input-group-prepend">
   						<span class="input-group-text" id="basic-addon1"><i class='fas fa-envelope'></i></span>
  					</div>
  					<input type="text" name="email" class="form-control" placeholder="Email" value="${user.email}" required 
  				 	required title="Email can't be empty and right syntax">
				</div>
				<div class="input-group mb-3">
  					<div class="input-group-prepend">
   						<span class="input-group-text" id="basic-addon1"><i class='fas fa-clock'></i></span>
  					</div>
  					<input type="date" data-format="yyyy-MM-dd" name="birthDay" class="form-control"  value="${user.birthDay}"required>
				</div>
        	</div>        	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        	</form>
        </div>
   	    </div>
        </div>
      	
      	<div class="modal" id="${del}">
    	<div class="modal-dialog">
     	<div class="modal-content">
			<form action="<c:url value="/userManage-delete/${user.username}" />" method="post">
            <div class="modal-body">
            	<b>Delete user ${user.username}?</b>
            </div>	      	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Delete</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        	</form>
        </div>
   	    </div>
        </div>
	</c:forEach>
	</tbody>
	</table>
	</div><hr>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>