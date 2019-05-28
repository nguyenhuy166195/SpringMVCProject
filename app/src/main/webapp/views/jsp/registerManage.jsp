<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register Manage</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	td, input, select{
		font-family: "Lucida Console", Monaco, monospace;
	}
	#searchInput{
		border: 2px solid black;
  		
  		width: 300px;
	}
	select{
		padding: 10px 15px;
		border-radius: 10px;
 		background-color: #cddbf2;
 		border: 2px solid black;
	}
	#backBtn{
		background-color: #242b38;
  		color: white;
  		padding: 7px 20px;
  		text-align: center;
  		text-decoration: none;
  		display: inline-block;
	}
</style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<div align="center">
	    <c:if test="${message != null}"><div class="alert alert-success" style="width: 60%; height: 40px;" align="center"><strong>${message}</strong></div></c:if>
	    <c:if test="${error != null}"><div class="alert alert-danger"  style="width: 60%; height: 40px;" align="center"><em>${error}</em></div></c:if>
	    <h3><b>Register Manage</b></h3>
	</div><hr>
<div class="container" style="width: 90%;">
 	<div>
 	<form action="<c:url value="/registerManageSearch"/>" method="post">
			<div class="input-group mb-3">
  				<div class="input-group-prepend">
   					<span class="input-group-text" id="basic-addon1"><i class='fas fa-search'></i></span>
  				</div>
  				<input type="text" name="values" id="searchInput" placeholder="" required>&nbsp;&nbsp;
  				<select name="type" id="searchSelect">
					<option value="username" selected>Username</option>
					<option value="className">Class Name</option>
					<option value="dateRegister">Date Register</option>
				</select>
  			</div>
  			<button type="submit" class="btn btn-primary" style="width: 200px;">Search</button>&nbsp;&nbsp;
  			<a href="<c:url value="/registerManage" />" id="backBtn">Back</a>
	</form></div><hr>

	<table class="table table-striped table-hover">
		<thead>
           <tr>
              <th><i class='fas fa-laugh'></i>User</th>
              <th><i class="far fa-file"></i>Class</th>
       		  <th><i class="far fa-user"></i>Lecturer</th>
        	  <th><i class="far fa-bell"></i>Date register</th>
              <th><i class="fas fa-user-graduate"></i>Count</th>
              <th><i class="fas fa-laptop-code"></i>Count max</th>
              <th></th>
          </tr>
        </thead>
        <tbody>
    		<c:forEach items="${lists}" var="c">
				<c:set var = "del" value = "del${c['id']}" />
				<c:set var = "delModal" value = "#del${c['id']}" />	
				<tr>
					<td>${c['username']}</td>
					<td><a href="<c:url value="/class/${c['idClass']}" />">${c['className']}</a></td>
					<td>${c['classLecturer']}</td>
					<td>${c['dateRegister']}</td>
					<td>${c['classCount']}</td>
					<td>${c['classCountMax']}</td>
					<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="${delModal}"><i class="fa fa-trash"></i> Remove</button></td>
				</tr>
				
				<div class="modal" id="${del}">
    			<div class="modal-dialog">
     			<div class="modal-content">         
					<form action="<c:url value="/registerManageDelete/${c['id']}" />" method="post">
            		<div class="modal-body">
            			<b>Do you want to remove?</b>
        			</div>     	     
            		<div class="modal-footer">
        	    		<button type="submit" class="btn btn-primary">Remove</button>
                		<button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
            		</div>
        			</form>
        		</div></div></div>
        	</c:forEach>
        </tbody>
    </table>

</div></div><hr>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>