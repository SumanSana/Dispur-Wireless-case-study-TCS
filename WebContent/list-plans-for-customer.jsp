<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.card{
		box-shadow:0px 0px 10px -5px rgb(152,152,152) !important;
		background-color:white !important;
		font-size:23px;
		padding:15px;
		margin-top:50px;
	}
	a.paidmode:link{
		color:black !important;
		text-decoration:none !important;
	}
	 a.paidmode:hover{
		opacity:0.5 !important;
		text-decoration:none;
	}
	a.paidmode:active{
		color:blue !important;
		text-decoration:underline !important;
	}
</style>
</head>
<body style="background-color: rgb(157,188,212,0.4);">
<div class="container">

	<div class="row" style="margin-top:30px;font-size:27px;font-family:Times new roman;">
		<div class="col-md-3"></div>
		<div class="col-md-3 text-center">
			<c:url var="Prepaid" value="PlanManagement">
				<c:param name="command" value="List${type }Plans" />
				<c:param name="rental" value="No" />
			</c:url>
			<c:choose>
				<c:when test="${rental=='No' }">
					<a class="paidmode " href="${Prepaid }"><ins style="color:blue !important;">Prepaid</ins></a>
				</c:when>
				<c:otherwise>
					<a class="paidmode" href="${Prepaid }"><div style="color:black !important;">Prepaid</div></a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-3 text-center">
			<c:url var="Postpaid" value="PlanManagement">
				<c:param name="command" value="List${type }Plans" />
				<c:param name="rental" value="Yes" />
			</c:url>
			<c:choose>
				<c:when test="${rental=='Yes' }">
					<a class="paidmode" href="${Postpaid }"><ins style="color:blue;">Postpaid</ins></a>
				</c:when>
				<c:otherwise>
					<a class="paidmode" href="${Postpaid }"><div style="color:black !important;">Postpaid</div></a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-3"></div>
	</div>
	<div class="card">
		<div  class="card-header">
			${type }&nbsp;plans
		</div>
		<div class="card-body">
			<c:choose>
				<c:when test="${plans.size()>0}">
					<table class="table table-striped table-bordered text-center">
						<thead>
							<tr>
								<th>Name</th>
								<th>MRP</th>
								<th>Validity</th>
								<th>Benefits</th>
								<th>Buy</th>
							</tr>
						</thead >
						<tbody>
							<c:forEach var="plan" items="${plans}">
									
								<c:url var="purchaseLink" value="/buy-plan-form.jsp">
									<c:param name="planId" value="${plan.planId}" />
								</c:url>
								
								<tr>
									<td>${plan.name }</td>
									<td style="color:red;">&#x20B9;&nbsp;${plan.price }</td>
									<td>${plan.validity }&nbsp;days</td>
									<td>
										<c:choose>
											<c:when test="${plan.type=='Data' }">
												<i style="color:green">${plan.tarrif }&nbsp;mbps</i>
											</c:when>
											<c:otherwise>
												<i style="color:green">${plan.tarrif }&nbsp;miniutes</i>
											</c:otherwise>
										</c:choose>
									</td>
			 						<td>
										<a class="btn btn-primary btn-small" style="border-radius:45px;" href="${purchaseLink }">&emsp;&emsp;Buy&emsp;&emsp;</a>
			 						</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<br><br>
					<div class="text-center" style="font-size:23px;">No Plans Found</div>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</div>
</body>
<br><br><br><br><br>
<jsp:include page="footer.jsp"/>
</html>
