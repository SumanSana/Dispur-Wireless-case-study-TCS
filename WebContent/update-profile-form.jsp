<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:choose>

<c:when test="${role !=null }">


<jsp:include page="header.jsp"/>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile</title>
	<style>
	.modal-content{
		background-color:rgb(135,206,250);
		opacity:0.8;
		padding:15px;
		border-radius:25px;
	}
	</style>
	
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 modal-dialog text-center">
			<div class="modal-content row">
				<div class="col-md-12">
					<h3>Update Profile</h3>
					<c:if test="${not empty msg }">
						<c:if test="${fn:containsIgnoreCase(msg, 'Error')}">
							<br><br><div style="color:red;text-align:center;font-size:19px;">${msg }</div><br>
						</c:if>
						<c:remove var="msg" scope="request" />
					</c:if>
					<hr>
				</div>
				<div class="col-md-12">
					<form action="CustomerManagement" method="POST">
						<input type="hidden" name="command" value="UpdateProfile"/>
						
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-id-badge" aria-hidden="true"></i></span>
								</div>
								<input type="number" class="form-control"  name="regId" value="${profile.regId }" readonly>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-envelope"></i></span>
								</div>
								<input type="email" class="form-control"  name="email" value="${profile.email }" placeholder="Email"  required>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="firstName" value="${profile.firstName }" placeholder="First Name" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="lastName" value="${profile.lastName }" placeholder="Last Name" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-address-card"></i></span>
								</div>
								<input type="text" class="form-control" name="address" value="${profile.address }" placeholder="Address" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
								</div>
								<input type="text" class="form-control" pattern="[0-9]{10}" title="Please enter your right 10 digit phone number" placeholder="Contact Number" name="contactNumber" value="${profile.contactNumber }">
							</div>
						</div>
						<div class="form-group row">
						<div class="col-md-4"></div>
						<button type="submit" class="btn btn-primary col-md-4" style="border-radius:20px;">Update</button>
						<div class="col-md-4"></div>
						</div>
					</form>
			      </div>
				</div>
			</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<br><br>
</body>
</html>
<jsp:include page="footer.jsp"/>
</c:when>
<c:otherwise>
	<% 
		String contextpath = request.getContextPath();
		
		response.sendRedirect(response.encodeRedirectUrl(contextpath+"/access-denied.jsp"));
	%>
</c:otherwise>
</c:choose>