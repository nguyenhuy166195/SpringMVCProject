<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>403</title>
</head>
<body>
	<h1>Your don't have permision to view this page</h1>
	<a href="<c:url value="/home" />" >Home Page</a>
	<c:url value="/test" var="test" />
	<form action="${test }" method="post" accept-charset="UTF-8" >
		<input type="text" name="name" value="ăn cơm">
		<input type="submit" value="OK">
	</form>
</body>
</html>