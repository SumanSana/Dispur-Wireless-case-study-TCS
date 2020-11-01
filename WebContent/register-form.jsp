<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<jsp:include page="header.jsp"/>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
	<style>
	.modal-content{
		box-shadow:0px 0px 25px -5px rgb(0, 128, 255);
		background-color:rgb(135,206,250);
		opacity:0.8;
		padding:15px;
		border-radius:25px;
	}
	</style>
	<script type="text/javascript">
		function validate(){

			
			var password1 = document.getElementById("password1").value;
			var password2 = document.getElementById("password2").value;

			if(password1===password2){
				return true;
			}
			else{
				
				document.getElementById("error").innerHTML="Password and Confirm Password does not match";
				return false;
			}
			
		}
	</script>
	
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 modal-dialog text-center">
			<div class="modal-content row">
				<div class="col-md-12">
					<i class="fas fa-user-circle fa-5x"></i>
					<br><br>
					<div id="error" style="color:red;text-align:center;font-size:19px;"></div>
					<div id="msg">
						<c:if test="${not empty msg }">
						<c:if test="${fn:containsIgnoreCase(msg, 'Error')}">
							<br><br><div  style="color:red;text-align:center;font-size:19px;">${msg }</div><br>
						</c:if>
						<c:if test="${fn:containsIgnoreCase(msg, 'Success')}">
							<br><br><div style="color:green;text-align:center;font-size:19px;">${msg }</div><br>
						</c:if>
						<c:remove var="msg" scope="request"/>
					</c:if>
					</div>
					<hr>
				</div>
				<div class="col-md-12">
					<form action="CustomerManagement" onsubmit="return validate()" method="POST">
						<input type="hidden" name="command" value="RegisterCustomer"/>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-envelope"></i></span>
								</div>
								<input type="email" class="form-control"  name="email" placeholder="Email" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
								</div>
								<input type="password" class="form-control" id="password1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10,}" title="Password must be 8 characters including 1 uppercase letter, 1 lowercase letter and numeric characters" name="password" placeholder="Password" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
								</div>
								<input type="password" class="form-control" id="password2" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10,}" title="Password must be 8 characters including 1 uppercase letter, 1 lowercase letter and numeric characters" name="confirmPassword" placeholder="Confirm Password" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="firstName" placeholder="First Name" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="lastName" placeholder="Last Name" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-address-card"></i></span>
								</div>
								<input type="text" class="form-control" name="address" placeholder="Address" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
								</div>
								<input type="text" class="form-control" pattern="[0-9]{10}" title="Please enter your correct 10 digit phone number" name="contactNumber" placeholder="Contact Number">
							</div>
						</div>
						<div class="form-group row">
						<div class="col-md-4"></div>
						<button type="submit" class="btn btn-primary col-md-4" style="border-radius:20px;">Sign Up</button>
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