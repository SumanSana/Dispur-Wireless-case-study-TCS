<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dispurwireless.entity.Plan" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Plans</title>
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
	td{
	font-size:20px;
	}
</style>
</head>
<body style="background-color: rgb(157,188,212,0.4);">
<c:choose>
	<c:when test="${profile!=null}">
		<jsp:include page="header.jsp"/>
	<div class="container">
		<div class="card">
			<div  class="card-header">
				Active Plans
			</div>
			<c:choose>
				
				<c:when test="${myplans.size()>0 }">
					<div class="card-body">
						<table class="table table-striped table-bordered text-center">
							<thead>
								<tr>
									<th>Name</th>
									<th>Benefits</th>
									<th>Subscription Date</th>
									<th>Expire Date</th>
									<th>Payment</th>
								</tr>
							</thead >
							<tbody>
								<c:forEach var="myplan" items="${myplans}">
										
									
									<tr>
									
										<td>${myplan.plan.name}</td>
										<td>
											<c:choose>
												<c:when test="${myplan.plan.type=='Data' }">
													<div  style="color:green"><i>${myplan.plan.tarrif }&nbsp;mbps</i>&nbsp;</div>Internet Access
												</c:when>
												<c:otherwise>
													<div  style="color:green"><i>${myplan.plan.tarrif }&nbsp;minutes</i></div>Free Voice
												</c:otherwise>
											</c:choose>
										</td>
				 						<td>${myplan.subscriptionDate }</td>
				 						<td>${myplan.expireDate }</td>
				 						<td>
				 							<c:choose>
												<c:when test="${myplan.plan.rental=='No' }">
													<div style="color:green;">Paid</div>
												</c:when>
												<c:otherwise>
													<div style="color:red;">Unpaid</div>
												</c:otherwise>
											</c:choose>
				 						</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<br>
					<div class="text-center">No Plans Found</div>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	<br><br><br>
	<jsp:include page="footer.jsp"/>
	</c:when>
	<c:otherwise>
		<% 
		String contextpath = request.getContextPath();
		
		response.sendRedirect(response.encodeRedirectUrl(contextpath+"/login.jsp"));
		%>
	</c:otherwise>
</c:choose>
</body>
</html>
