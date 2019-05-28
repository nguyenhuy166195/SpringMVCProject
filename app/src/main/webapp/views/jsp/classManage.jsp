<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Class Manage Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	td{
		font-family: "Lucida Console", Monaco, monospace;
	}
</style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<div align="center">
	    <c:if test="${message != null}"><div class="alert alert-success"><b>${message}</b></div></c:if>	
	</div>
	<div class="container" style="width: 100%; padding: 5px;">
	<div class="clearfix">
    		<span class="float-left">
    			<h3><b>Class Manage Page</b></h3>
    		</span>
    		<span class="float-right">
    			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal"><i class="fa fa-plus"></i> Add new class</button>
    		</span>
  	</div>	
	
	<div class="modal" id="addModal">
    	<div class="modal-dialog">
     	<div class="modal-content">
     		<div class="modal-header">
               	   <h4 class="modal-title"><b>Add new class</b></h4>
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
			<form action="<c:url value="/classManageAdd" />" method="post" modelAttribute="addClass">
            <div class="modal-body">
                <div class="form-group">
                	<label for="idCourse">Course </label>
                	<select name="idCourse" id="idCourse" class="form-control" required>
                		<c:forEach items="${listCourse}" var="c">
                			<option value="${c['courseID'] }">${c['courseName']}</option>
                		</c:forEach>
                	</select>
                </div>
				<div class="form-group">
                	<label for="name">Class Name</label>
                	<input type="text" class="form-control" id="name" name="name" value="Class Name" required>
                </div>
                <div class="form-group">
                	<label for="lecturer">Lecturer</label>
                	<input type="text" class="form-control" id="lecturer" name="lecturer" value="Lecturer" required>
                </div>
                <div class="form-group">
                	<label for="date">Date Start</label>
                	<input type="date" class="form-control" id="date" name="date" required>
                </div>            
                <input type="hidden" name="count" value="0">
                <div class="form-group">
                	<label for="countMax">Count Max</label>
                	<input type="number" class="form-control" id="countMax" name="countMax" min="50" max="150" required>
                </div>
        	</div> 	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Add</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
			</form></div></div></div>
	<table class="table table-striped table-hover">
	<thead>
      <tr>
      	<th><i class="fas fa-tint"></i>Class ID</th>
        <th><i class="far fa-folder-open"></i>Course</th>
        <th><i class='fas fa-laugh'></i>Name</th>
        <th><i class="far fa-user"></i>Lecturer</th>
        <th><i class="far fa-clock"></i>Date start</th>
        <th><i class="fas fa-user-graduate"></i>Count</th>
        <th><i class="fas fa-laptop-code"></i>Count max</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${lists}" var="c">
			<c:set var = "edit" value = "edit${c['classID']}" />
			<c:set var = "editModal" value = "#edit${c['classID']}" />
			<c:set var = "del" value = "del${c['classID']}" />
			<c:set var = "delModal" value = "#del${c['classID']}" />	
		<tr>
			<td><a href="<c:url value="/class/${c['classID']}" />">${c['classID']}</a></td>
			<td>${c['courseName']}</td>
			<td>${c['className']}</td>
			<td>${c['classLecturer']}</td>
			<td>${c['classDate']}</td>
			<td>${c['classCount']}</td>
			<td>${c['classCountMax']}</td>
			<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="${editModal}"><i class="far fa-edit"></i> Edit</button>		
 				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="${delModal}"><i class="fa fa-trash"></i> Delete</button>
			</td>
		</tr>
		<div class="modal" id="${edit}">
    	<div class="modal-dialog">
     	<div class="modal-content">
        	<div class="modal-header">
               <h4 class="modal-title"><b>Edit information</b></h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
			<form action="<c:url value="/classManageEdit" />" method="post" modelAttribute="editClass">
            <div class="modal-body">
            	<div class="form-group">
                	<label for="id">Class ID</label>
                	<input type="number" class="form-control" id="id" name="id" value="${c['classID']}" readonly>
                </div>
                <div class="form-group">
                	<label style="background-color: lightblue;"><b>Course: ${c['courseName']}</b></label>
                </div>
                <input type="hidden" name="idCourse" value="${c['courseID']}">
  		        <div class="form-group">
                	<label for="name">Name</label>
                	<input type="text" class="form-control" id="name" name="name" value="${c['className']}" required>
                </div>
        		<div class="form-group">
                	<label for="lecturer">Lecturer</label>
                	<input type="text" class="form-control" id="lecturer" name="lecturer" value="${c['classLecturer']}" required>
                </div>
                <div class="form-group">
                	<label for="date">Date</label>
                	<input type="date" class="form-control" id="date" name="date" value="${c['classDate']}" required>
                </div>
                <div class="form-group">
                	<label for="count">Count</label>
                	<input type="number" class="form-control" id="count" name="count" value="${c['classCount']}" required readonly>
                </div>
                 <div class="form-group">
                	<label for="countMax">Count Max</label>
                	<input type="number" class="form-control" id="countMax" name="countMax" value="${c['classCountMax']}" min="50" max="150" required>
                </div>
        	</div> 	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        	</form></div></div></div>
        
        <div class="modal" id="${del}">
    	<div class="modal-dialog">
     	<div class="modal-content">         
			<form action="<c:url value="/classManageDelete/${c['classID']}" />" method="post">
            <div class="modal-body">
            	<b>Delete class ${c['className']}?</b>
        	</div>     	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Delete</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
            </div>
        	</form></div></div></div>
		</div>
	</c:forEach>
    </tbody>
    </table>	
</div>
<jsp:include page="footer.jsp" />
</div>	
</body>
</html>