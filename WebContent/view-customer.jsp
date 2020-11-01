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
		margin-bottom:50px;
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
						${customer.firstName}&nbsp;${customer.lastName}&nbsp;
						<br>
						<div style="font-size:15px;">
						<i>${customer.email }</i>
						<br>
						${customer.address }
						</div>
						
					</div>
					<div class="card-body">
						<h2>Active Plans</h2>
						<br>
						<c:choose>
							<c:when test="${customerplans.size()>0 }">
								<div class="row">
									<table class="table table-striped table-bordered text-center">
										<thead>
											<tr>
												<th>Id</th>
												<th>Name</th>
												<th>Subscription Date</th>
												<th>Expire Date</th>
												<th>Payement</th>
											</tr>
										</thead >
										<tbody>
											<c:forEach var="customerplan" items="${customerplans}">
												<tr>
													<td>${customerplan.plan.planId }</td>
													<td>${customerplan.plan.name }</td>
													<td>${customerplan.subscriptionDate }</td>
							 						<td>${customerplan.expireDate }</td>
							 						<td>
							 							<c:choose>
															<c:when test="${customerplan.plan.rental=='No' }">
																<div style="color:green;">Paid</div>
															</c:when>
															<c:otherwise>
																<div style="color:red;">Due</div>
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
							<div class="text-center" style="font-size:23px;">No Plans Found</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
		<br><br><br>
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