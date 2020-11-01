<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<style>
	.modal-content{
		box-shadow:0px 0px 25px -5px rgb(0, 128, 255) !important; 
		background-color:rgb(135,206,250) !important;
		opacity:0.8 !important;
		padding:15px !important;
		border-radius:25px !important;
	}
	.form-control{
	border-radius:80px !important;
	}
	</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 modal-dialog text-center">
			<div class="modal-content row">
				<div class="col-md-12">
					<div style="font-size:23px;">Sign In</div>
					<c:if test="${not empty error }">
						<br><br><div style="color:red;text-align:center;font-size:19px;">${error }</div><br>
					</c:if>
					<hr>
				</div>
				<div class="col-md-12">
					<form action="LogIn" method="POST">
						<input type="hidden" name="command" value="LOGIN"/>
						
						<div class="form-group">
							<input type="text" class="form-control" pattern="[0-9]{8}" title="Please enter your correct 8 digit registration number" name="regId" placeholder="Registration Number" required>
						</div>
						
						<div class="form-group">
							<input type="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10,}" title="Password must be 8 characters including 1 uppercase letter, 1 lowercase letter and numeric characters" name="password" placeholder="Password" required>
						</div>
						
						<div class="form-group">
							<button type="submit" class="btn btn-primary col-md-12" style="border-radius:80px;">Sign In</button>
						</div>
						
						 <p>Don't have an account &nbsp;<a href="<%= request.getContextPath() %>/register-form.jsp" style="text-decoration: none;"><span style="font-size:19px;">Sign Up</span></a></p>
						 
					</form>
			      </div>
				</div>
			</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
  
             
              
      
  <br>
  <jsp:include page="footer.jsp"/>
</body>
</html>