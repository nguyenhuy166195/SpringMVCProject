<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Course Manage</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	input, label{
		font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	}
</style>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("img.img-responsive").attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<div align="center">
	    <c:if test="${message != null }"><div class="alert alert-success"><b>${message}</b></div></c:if>
	    <h3><b>Course Manage</b></h3>	
	</div><hr>
	<div class="container" style="width: 90%;">
	<div class="row">
    <c:forEach items="${lists}" var="c">
 		<c:set var = "edit" value = "edit${c.id}" />
		<c:set var = "editModal" value = "#edit${c.id}" />
		<c:set var = "del" value = "del${c.id}"/>
		<c:set var = "delModal" value = "#del${c.id}"/>	

 		<div class="col">
 			<div class="card" style="width:300px;">
 				<img class="card-img-top" src="<c:url value="/resources/images/Course/${c.img}"/>" alt="Card image" style="width: 300px; height: 300px;">
 				<div class="card-body">
 					<h4 class="card-title">${c.name}</h4>
 					<p class="card-text">${c.content}</p>
 					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="${editModal}"><i class="far fa-edit"></i> Edit</button>		
 					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="${delModal}"><i class="fa fa-trash"></i> Delete</button>
 				</div>
 			</div>	
 		
 		<div class="modal" id="${edit}">
    	<div class="modal-dialog">
     	<div class="modal-content">
			<form action="<c:url value="/courseManageEdit" />" method="post" enctype="multipart/form-data">
            <div class="modal-body">
            	<div class="form-group">
                	<label for="id">Course ID</label>
                	<input type="text" class="form-control" id="id" name="id" value="${c.id}" readonly>
                </div>
                	<div class="form-group">
                	<label for="name">Course Name</label>
                	<input type="text" class="form-control" id="name" name="name" value="${c.name}" required>
                </div>
  		        <div class="form-group">
                	<label for="content">Course Content</label>
                	<textarea class="form-control" rows="5" id="content" name="content" required>${c.content}</textarea>
                </div>
        		<div class="form-group">
                	<label for="kind">Course Kind: </label>
                	<input type="radio" name="kind" value="FrontEnd" checked>Front End
                	<input type="radio"  name="kind" value="BackEnd">Back End
                </div>
                <div class="form-group">
               		<label >Image </label>
                	<c:set var = "img_default" value="/resources/images/Course/${c.img}" />
                	<img class="img-responsive" src="<c:url value="${img_default}" />" id="img_default" alt="Course image" style="width: 200px; height: 200px;">
                	<br><input type="file" class="form-control" id="img" name="img" accept="image/*" onchange="readURL(this);">
                </div>
               <input type="hidden" name="image" value="${c.img}">
        	</div> 	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        	</form>
        </div></div></div>
        
        <div class="modal" id="${del}">
    	<div class="modal-dialog">
     	<div class="modal-content">      	        
			<form action="<c:url value="/courseManageDelete/${c.id}" />" method="post">
            <div class="modal-body">
            	<b>Delete course ${c.name}?</b>
        	</div>     	     
            <div class="modal-footer">
        	    <button type="submit" class="btn btn-primary">Delete</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancle</button>
            </div>
        	</form>
 		</div></div></div>	
 		
 		</div>
 	</c:forEach>
 	</div></div><hr>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>