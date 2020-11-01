<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Plan</title>
<style>

	.card{
		box-shadow:0px 0px 25px -5px rgb(152,152,152) !important;
		background-color:rgb(211,211,211) !important;
		padding:15px;
		margin-top:50px;
	}
	</style>
</head>
<body>
<c:choose>
	<c:when test="${role=='Admin'}">
		<jsp:include page="header.jsp"/>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="card col-md-8">
					<div class="card-header" style="font-size:23px;">
						${plan.type}&nbsp;plan
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-2 text-left">
								Name
							</div>
							<div class="col-md-1 text-left">
								:
							</div>
							<div class="col-md-9 text-left">
								${plan.name }
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2 text-left">
								Tarrif
							</div>
							<div class="col-md-1 text-left">
								:
							</div>
							<div class="col-md-9 text-left">
								${plan.tarrif}
								<c:choose>
									<c:when test="${plan.type=='Data' }">
										&nbsp;mbps
									</c:when>
									<c:otherwise>
										&nbsp;miniutes
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2 text-left">
								Validity
							</div>
							<div class="col-md-1 text-left">
								:
							</div>
							<div class="col-md-9 text-left">
								${plan.validity }&nbsp;days
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2 text-left">
								MRP
							</div>
							<div class="col-md-1 text-left">
								:
							</div>
							<div class="col-md-9 text-left">
								<div style="color:red">&#x20B9;&nbsp;${plan.price }</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2 text-left">
								Payment
							</div>
							<div class="col-md-1 text-left">
								:
							</div>
							<div class="col-md-9 text-left">
								<c:choose>
									<c:when test="${plan.rental=='Yes' }">
										Prepaid
									</c:when>
									<c:otherwise>
										Postpaid
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2 text-left">
								<form action="PlanManagement">
									<input type="hidden" name="command" value="LoadUpdatePlanForm">
									<input type="hidden" name="planId" value="${plan.planId }">
									<button class="btn btn-primary btn-small" type="submit" style="border-radus:35px;">Update</button>
								</form>
							</div>
							<div class="col-md-10"></div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
		<br><br><br><br><br>
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