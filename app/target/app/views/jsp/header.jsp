<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.hust.model.*" %>
<div id="header">

<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="<c:url value="/home" />">
  	<img src="<c:url value="/resources/images/home64.png" />" alt="Home">
  </a>
  <ul class="navbar-nav">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="frontEndDropdown" data-toggle="dropdown">Front End</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">HTML</a>
        <a class="dropdown-item" href="#">CSS</a>
        <a class="dropdown-item" href="#">JavaScript</a>
      </div>
    </li>    
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="backEndDropdown" data-toggle="dropdown">Back End</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Java</a>
        <a class="dropdown-item" href="#">PHP</a>        
      </div>
    </li>
  </ul>
  
  <!-- Links -->
  <ul class="navbar-nav ml-auto" >
  	<li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" data-toggle="dropdown">User</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<c:url value="/userInfo" />">User info</a>
        <a class="dropdown-item" href="<c:url value="/registerManage" />">Register Manage</a>
        <a class="dropdown-item" href="<c:url value="/logout" />">Logout</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" data-toggle="dropdown">Admin</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<c:url value="/userManage" />">User Manage</a>
        <a class="dropdown-item" href="<c:url value="/classManage" />">Class Manage</a>
        <a class="dropdown-item" href="<c:url value="/courseManage" />">Course Manage</a>
        <a class="dropdown-item" href="<c:url value="/logout" />" >Logout</a>
      </div>
    </li>
    <li class="nav-item" id="loginNav">
      <a class="nav-link" href="<c:url value="/login" />" >Login</a>
    </li>
    <li class="nav-item" id="registerNav">
      <a class="nav-link" href="<c:url value="/register" />">Register</a>
    </li>
    <li class="nav-item" id="contactNav">
      <a class="nav-link" href="<c:url value="/contact" />">Contact us</a>
    </li>   
  </ul>
  

  <c:choose>
  	<c:when test="${sessionScope.user == null}">
  		<script>
  			document.getElementById("userDropdown").style.display = "none";
  			document.getElementById("adminDropdown").style.display = "none";  		
  		</script>
  	</c:when>
  	<c:when test="${sessionScope.user != null}">
  		<c:if test="${sessionScope.user.role == 0}">
  		<script>  			
  			document.getElementById("adminDropdown").style.display = "none";
  			document.getElementById("loginNav").style.display = "none";
  			document.getElementById("registerNav").style.display = "none";
  			document.getElementById("userDropdown").innerHTML = "${sessionScope.user.name}";
  		</script>
  		</c:if>
  		<c:if test="${sessionScope.user.role == 1}">
  		<script>  			
  			document.getElementById("userDropdown").style.display = "none";
  			document.getElementById("loginNav").style.display = "none";
  			document.getElementById("registerNav").style.display = "none";
  		</script>
  		</c:if>
  	</c:when>
  
  </c:choose>
</nav>
</div>
