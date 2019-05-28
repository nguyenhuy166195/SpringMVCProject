<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class Info</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<c:url var="home" value="/" scope="request" />
<div align="center">
	<h1 >Your register</h1>	
</div>

	<table class="table table-striped table-hover">
    <thead>
      <tr>
        <th>Class name</th>
        <th>Class lecturer</th>
        <th>Start day</th>
        <th>Date register</th>
        <th>Status</th>
        <th>Remove</th>
      </tr>
    </thead>
    <tbody>
       	<c:forEach items="${lists}" var="c">
		<c:set var = "del" value = "del${c['id']}" />
		<c:set var = "delModal" value = "#del${c['id']}" />	
		<tr>
			<td>${c['className']}</td>
			<td>${c['classLecturer']}</td>
			<td>${c['classDate']}</td>
			<td>${c['dateRegister']}</td>
			<td>
				<c:if test="${c['status'] == 0}">Active</c:if>
				<c:if test="${c['status'] == 1}">Disabled</c:if>
			</td>
			<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="${delModal}">Remove</button></td>
		</tr> 
        <div class="modal" id="${del}">
    		<div class="modal-dialog">
     		<div class="modal-content">      		        
				<form action="<c:url value="/classManageDelete/${c['id']}" />" method="post">
                <div class="modal-body">
            	    <b>Do you want to leave Class ${c['className']}</b>
        	    </div>     	     
                <div class="modal-footer">
        	        <button type="submit" class="btn btn-primary">Remove</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
                </div>
        		</form>
        	</div></div>
		</div>
	</c:forEach>
    </tbody>
  </table>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>