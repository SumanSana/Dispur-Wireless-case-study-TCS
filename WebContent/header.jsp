<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
            
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

            
 <style>
 #nav{
border-bottom: solid 5px yellow;
}
.nav-link{
    color: white !important;
    font-size: 20px !important;
    }
 .nav-link:hover{
 	opacity:0.5;
 }
 .profile-button{
 	border-radius:30px !important;
 	margin-top:15px;
 	background-color:white !important;
 	font-size:20px;
 }
 </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="nav">
  <a class="navbar-brand" href="#" style="color:yellow;"><h2>Dispur Wireless</h2></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    	<li class="nav-item active">
	        <a class="nav-link" href="<%=request.getContextPath()%>/home.jsp">Home <span class="sr-only">(current)</span></a>
	 	</li>
    <c:choose>
    	<c:when test="${role == 'Admin'}">
    		<li class="nav-item">
	        	<a class="nav-link px-3" href="<%=request.getContextPath()%>/CustomerManagement">Customer Management</a>
	      	</li>
	      	<li class="nav-item">
	        	<a class="nav-link px-3" href="<%=request.getContextPath()%>/PlanManagement">Plan Management</a>
	      	</li>
    	</c:when>
    	<c:otherwise>
    		<li class="nav-item dropdown">
	        <a class="nav-link px-4 dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        Plan
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<%= request.getContextPath() %>/PlanManagement?command=ListDataPlans">Data Plan</a>
	          <a class="dropdown-item" href="<%= request.getContextPath() %>/PlanManagement?command=ListVoicePlans">Voice Plan</a>
	        </div>
	      </li>
    	</c:otherwise>
    </c:choose>
    </ul>
    <ul class="navbar-nav ml-auto">
    <c:choose>
    	<c:when test="${profile==null}">
    		<li class="nav-item">
	        	<a class="nav-link px-4" href="<%= request.getContextPath()%>/login.jsp">Sign In <i class="fa fa-sign-in" ></i></a>
	      	</li>
	      	<li class="nav-item">
	        	<a class="nav-link px-4" href="#"></a>
	      	</li>
	      	<li class="nav-item">
	        	<a class="nav-link px-4" href="#"></a>
	      	</li>
    	</c:when>
    	<c:otherwise>
    		<li class="nav-item dropdown">
    			<button class="btn btn-lg dropdown-toggle profile-button" type="button" id="dropdownProfileMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    				<i class="fa fa-user-circle-o" aria-hidden="true"></i>
    				${profile.firstName}&nbsp;${profile.lastName}
    			</button>
   				<div class="dropdown-menu" aria-labelledby="dropdownProfileMenu">
   				  <c:if test="${role!='Admin' }">
		          <a class="dropdown-item" href="<%= request.getContextPath() %>/PlanManagement?command=MyPlans">My plans</a>
		          <div class="dropdown-divider"></div>
		          </c:if>
		          
		          <a class="dropdown-item" href="<%= request.getContextPath()%>/update-profile-form.jsp">Edit profile</a>
		          
		          <a class="dropdown-item" href="<%= request.getContextPath()%>/change-password-form.jsp">Change Password</a>
		          
		       </div>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link px-3" href="<%= request.getContextPath()%>/LogOut">
    				<i class="fa fa-sign-out fa-2x " style="margin-top:13px;" aria-hidden="true"></i>
    			</a>
    		</li>
    		<li class="nav-item">
	        	<a class="nav-link px-4" href="#"></a>
	      	</li>
    	</c:otherwise>
    </c:choose>
    </ul>
    
  </div>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>