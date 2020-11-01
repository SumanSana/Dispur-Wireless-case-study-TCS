<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Plan</title>

	<style>
	.modal-content{
		box-shadow:0px 0px 25px -5px rgb(152,152,152);
		background-color:rgb(211,211,211);
		padding:15px;
		
	}
	</style>
	
</head>
<body>
<c:choose>
	<c:when test="${role=='Admin'}">
		<jsp:include page="header.jsp"/>
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 modal-dialog text-center " style="margin-top:50px;">
					<div class="modal-content row">
						<div class="col-md-12">
							<div style="font-size:23px;">Add Plan</div>
							
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
							<form action="PlanManagement" method="POST">
								<input type="hidden" name="command" value="AddPlan"/>
								<div class="form-group">
									<input type="text" class="form-control" name="name" placeholder ="Plan Name" required>
								</div>
								<div class="form-group">
									<select class="form-control" name="type" required>
										<option value="" disabled selected>Type</option>
										<option value="Data">Data</option>
										<option value="Voice">Voice</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" pattern="[0-9]{1,}" name="tarrif" placeholder ="Tarrif" required>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" pattern="[0-9]{1,}" name="validity" placeholder ="Validity" required>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" pattern="[0-9]{1,}" name="price" placeholder ="Price" required>
								</div>
								<div class="form-group">
									<select class="form-control" name="rental" required>
										<option value="" disabled selected>Rental</option>
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
								
								<div class="form-group row">
									<div class="col-md-4"></div>
										<button type="submit" class="btn btn-primary col-md-4" style="border-radius:20px;">Submit</button>
									<div class="col-md-4"></div>
								</div>
							</form>
					      </div>
						</div>
					</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</c:when>
	<c:otherwise>
		<% 
		String contextpath = request.getContextPath();
		
		response.sendRedirect(response.encodeRedirectUrl(contextpath+"/access-denied.jsp"));
		%>
	</c:otherwise>
</c:choose>
</body>
</html>