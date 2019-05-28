<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.hust.model.*" %>
<div id="header">
<div id="title">
	<div class="clearfix" style="font-family: Book Antiqua;">
    	<span class="float-left" style="padding-top: 5px; padding-left: 5px; font-family: Book Antiqua;"><h4 id="nameTitle">TRUNG TÂM ĐÀO TẠO LẬP TRÌNH CODEMAN</h4>
    	<h5><i>Đào tạo chuyên sâu lập trình WEB</i></h5>
    	</span>
    	<span class="float-right" style="padding-top: 20px; padding-right: 20px;">
			<i class="fas fa-phone"></i> <b>0384194477</b>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-envelope"></i> <i>huynv@gmail.com</i>
    	</span>
  	</div>
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
  <!-- Brand -->
  <a class="navbar-brand" href="<c:url value="/home" />">
  	  <i class="fa fa-fw fa-home"></i> Home</a>
  </a>

  <!-- Links -->
  <ul class="navbar-nav">
    <!-- Dropdown -->
    <li class="nav-item dropdown" >
      <a class="nav-link dropdown-toggle" href="#" id="frontEndDropdown" data-toggle="dropdown">
        <span style="color: white;">Front End</span>
      </a>
      <div class="dropdown-menu">
          <a class="dropdown-item" href="<c:url value="/html" />">HTML</a>
          <a class="dropdown-item" href="<c:url value="/css" />">CSS</a>
          <a class="dropdown-item" href="<c:url value="/javascript" />">JavaScript</a>
      </div>
    </li>    
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="backEndDropdown" data-toggle="dropdown">
       <span style="color: white;">Back End</span>
      </a>
      <div class="dropdown-menu">
          <a class="dropdown-item" href="<c:url value="/java" />">Java</a>
          <a class="dropdown-item" href="<c:url value="/php" />">PHP</a>
      </div>
    </li>
  </ul>  
  <ul class="navbar-nav ml-auto">
  	   <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="userDropdown" data-toggle="dropdown" href="#"><i class="fas fa-user"></i><b id="usernameDrop">User</b></a>
           <div class="dropdown-menu">
             <a class="dropdown-item" href="<c:url value="/userInfo" />">User info</a>
             <a class="dropdown-item" href="<c:url value="/userRegister" />">Register Manage</a>
             <a class="dropdown-item" href="<c:url value="/logout" />">Logout</a>
          </div>
       </li>
       <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="adminDropdown" data-toggle="dropdown" href="#"><i class="fas fa-laptop"></i> Admin</a>
          <div class="dropdown-menu">
          	<a class="dropdown-item" href="<c:url value="/userManage" />">User Manage</a>
          	<a class="dropdown-item" href="<c:url value="/classManage" />">Class Manage</a>
       	  	<a class="dropdown-item" href="<c:url value="/courseManage" />">Course Manage</a>
          	<a class="dropdown-item" href="<c:url value="/registerManage" />">Register Manage</a>
          	<a class="dropdown-item" href="<c:url value="/logout" />" >Logout</a>
          </div>
      </li>
      <li class="nav-item" id="loginNav">
         <a class="nav-link" href="<c:url value="/login" />" ><i class="far fa-user"></i> Login</a>
      </li>
      <li class="nav-item" id="registerNav">
        <a class="nav-link" href="<c:url value="/register" />"><i class="far fa-address-card"></i> Register</a>
      </li>
      <li class="nav-item" id="contactNav">
        <a class="nav-link" href="<c:url value="/contact" />"><i class="fa fa-fw fa-envelope"></i> Contact us</a>
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
  		<c:if test="${sessionScope.user.role == 'ROLE_USER'}">
  		<script>  			
  			document.getElementById("adminDropdown").style.display = "none";
  			document.getElementById("loginNav").style.display = "none";
  			document.getElementById("registerNav").style.display = "none";
  			/* document.getElementById("userDropdown").innerHTML = "${sessionScope.user.name}"; */
  			document.getElementById("usernameDrop").innerHTML = "${sessionScope.user.name}"; 
  		</script>
  		</c:if>
  		<c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
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
