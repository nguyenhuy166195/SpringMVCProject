<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>User Register</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	input{
		font-family: Book Antiqua;
	}
</style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<c:url var="home" value="/" scope="request" />
	<div align="center">
		<c:if test="${message != null}"><div class="alert alert-success"><b>${message}</b></div></c:if>
	</div>
	<div class="container" style="width: 90%;">
	<div class="clearfix">
    		<span class="float-left">
    			<h3><b>User register</b></h3>
    		</span>
    		<span class="float-right">
    			<a href="<c:url value="/userInfo"/>"><button type="button" class="btn btn-success"><i class="fas fa-user"></i>
    			 Your info</button></a>
    		</span>
  	</div><hr>
	<table class="table table-striped table-hover">
    <thead>
      <tr>
        <th><i class='fas fa-laugh'></i>Class name</th>
        <th><i class="far fa-user"></i>Class lecturer</th>
        <th><i class="far fa-clock"></i>Start day</th>
        <th><i class="far fa-bell"></i>Date register</th>
        <th><i class="far fa-heart"></i>Status</th>
        <th> </th>
      </tr>
    </thead>
    <tbody>
       	<c:forEach items="${lists}" var="c">
		<c:set var = "del" value = "del${c['id']}" />
		<c:set var = "delModal" value = "#del${c['id']}" />	
		<tr>
			<td><a href="<c:url value="/class/${c['idClass']}"/>">
			${c['className']}</a></td>
			<td>${c['classLecturer']}</td>
			<td>${c['classDate']}</td>
			<td>${c['dateRegister']}</td>
			<td>
				<c:if test="${c['status'] == 0}">Active</c:if>
				<c:if test="${c['status'] == 1}">Disabled</c:if>
			</td>
			<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="${delModal}"><i class="fa fa-trash"></i> Remove
			</button></td>
		</tr> 
        <div class="modal" id="${del}">
    		<div class="modal-dialog">
     		<div class="modal-content">      		        
				<form action="<c:url value="/userRegisterDelete/${c['id']}" />" method="post">
                <div class="modal-body">
            	    <b>Leave class ${c['className']}</b>
        	    </div>     	     
                <div class="modal-footer">
        	        <button type="submit" class="btn btn-primary">Leave</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
                </div>
        		</form>
        	</div></div>
		</div>
	</c:forEach>
    </tbody>
  </table><hr>
</div>	
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>