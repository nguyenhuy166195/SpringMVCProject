<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class</title>
<link rel="icon" href="<c:url value="/resources/images/icon.png" />">
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
	</div><br>
	<div class="container" style="width: 90%;">
	<div class="clearfix">
    	<span class="float-left"><h3><b>Class profile</b></h3></span>
    	<span class="float-right">
    	<c:if test="${isRegistered == -1}">
    	<a href="<c:url value="/classManage"/>"><button type="button" class="btn btn-success"><i class="far fa-edit"></i> Class manage</button></a>
    	</c:if>
    	</span>
	</div><hr>
	</div>
  	<div class="container" style="width: 90%; background-color: #e0e0e0;">
  		<div class="row">
  			 <div class="col-md-4 order-md-1 mb-4">
  			 	<h4 class="d-flex justify-content-between align-items-center mb-3">
            		<span class="text-muted"><b>Class</b></span>
            		<span class="badge badge-success badge-pill">${c.id}</span>
         		</h4>
  			 	<ul class="list-group mb-3">
             	<li class="list-group-item list-group-item-success d-flex justify-content-between lh-condensed">
                    <h6 class="my-0"><i class="far fa-file"></i>Class name</h6>
                    <span><b>${c.name}</b></span>
                </li>
                <li class="list-group-item list-group-item-warning d-flex justify-content-between lh-condensed">
                    <h6 class="my-0" ><i class="far fa-folder-open"></i>Course</h6>
                    <span><b>${courseName}</b></span>
                </li>
                <li class="list-group-item list-group-item-dark d-flex justify-content-between lh-condensed">
                    <h6 class="my-0" ><i class="far fa-user"></i>Lecturer</h6>
                    <span><b>${c.lecturer}</b></span>
                </li> 
                <li class="list-group-item list-group-item-info d-flex justify-content-between lh-condensed">
                    <h6 class="my-0" ><i class="far fa-clock"></i>Date</h6>
                    <span><b>${c.date}</b></span>
                </li> 
                <li class="list-group-item list-group-item-light d-flex justify-content-between lh-condensed">
                    <h6 class="my-0" ><i class="fas fa-user-graduate"></i>Count</h6>
                    <span><b>${c.count}</b></span>
                </li> 
                <li class="list-group-item list-group-item-primary d-flex justify-content-between lh-condensed">
                    <h6 class="my-0" ><i class="fas fa-laptop-code"></i> Count Max</h6>
                    <span><b>${c.countMax}</b></span>
                </li>        
            	</ul>
             </div>
             <div class="col-md-8 order-md-2">
             	<div class="mx-auto py-2 bg-warning" style="width:150px; text-align: center;"><b>List student</b></div>
             	<table class="table table-striped table-hover">
	                <thead>
                       <tr>
                           <th><i class="fas fa-user-graduate"></i>Student</th>
                           <th><i class="fas fa-envelope"></i>Email</th>
                           <th><i class="far fa-clock"></i>BirthDay</th>
                           <th><i class="fas fa-pen-square"></i>Register</th>
                       </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${listStudent}" var="s">
                    	<tr>
                    		<td>${s['name']}</td>
                    		<td>${s['email']}</td>
                    		<td>${s['birthday']}</td>
                    		<td>${s['dateRegister']}</td>
                    	</tr>
                    	</c:forEach>
                    </tbody>
                </table>
                <c:set var = "regis" value = "regis${c.id}" />
				<c:set var = "regisModal" value = "#regis${c.id}" />
				<c:set var = "leave" value = "leave${c.id}" />
				<c:set var = "leaveModal" value = "#leave${c.id}" />
                <c:choose>
                	<c:when test="${isRegistered == 0 || isRegistered == -2}">
                		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="${regisModal}"><i class="fas fa-pen-square"></i> Register</button>
                		<div class="modal" id="${regis}">
    	                    <div class="modal-dialog">
     	                        <div class="modal-content">
			                    <form action="<c:url value="/classDoRegister/${c.id}" />" method="post">
                                     <div class="modal-body">
            	                          <b>Register class ${c.name}?</b>
                                     </div>	      	     
                                     <div class="modal-footer">
        	                              <button type="submit" class="btn btn-primary">Register</button>
                                          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                     </div>
        	                     </form>
                                 </div>
   	                        </div>
                         </div>
                	</c:when>
                	<c:when test="${isRegistered == 1}">                		
                		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="${leaveModal}"><i class="fa fa-trash"></i> Leave</button>
                		<div class="modal" id="${leave}">
    	                    <div class="modal-dialog">
     	                        <div class="modal-content">
			                    <form action="<c:url value="/classRemoveRegister/${c.id}" />" method="post">
                                     <div class="modal-body">
            	                          <b>Leave class ${c.name}?</b>
                                     </div>	      	     
                                     <div class="modal-footer">
        	                              <button type="submit" class="btn btn-primary">Leave</button>
                                          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                     </div>
        	                     </form>
                                 </div>
   	                        </div>
                         </div>
                	</c:when>
                </c:choose>
             </div>
             
  		</div><hr>
	</div>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>