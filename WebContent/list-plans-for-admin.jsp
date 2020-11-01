<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Plans</title>
</head>
<body>

<c:choose>
	<c:when test="${role=='Admin'}">
		<jsp:include page="header.jsp"/>
		<div class="container">
			<div id="content">
				<form action="PlanManagement" method="POST" style="margin-top:35px;">
				    <div class="form-group col-md-12">
						  <div class="text-center">
						  <div class="row">
						  <div class="col-md-4 " style="font-size:22px"> <input type="hidden" name="command" value="SearchPlan" />Search Plan : </div>
						  <div class="col-md-4"><input type="text" class="form-control " pattern="[0-9]{1,}" title="Please enter the right Plan Id" name="planId" placeholder="Enter Plan Id" required ></div>
						  <div class="col-md-4"><input type="submit" value="Search" class="btn btn-primary btn-xl" /></div>
						  </div>
						</div>
					</div>
				</form>
				<br/><br>
				
			    <div class="form-group col-md-12">
				  <div class="text-center">
					  <div class="row">
						  <div class="col-md-4">
						  	<a class="btn btn-info btn-lg" style="border-radius:10px;" href="<%=request.getContextPath() %>/add-plan-form.jsp">Add Plan</a>
						  </div>
					  </div>
					</div>
				</div>
				<br><br>
				<c:choose>
					<c:when test="${plans.size()>0}">
						<table class="table table-striped table-bordered text-center">
							<thead class="thead-dark">
								<tr>
									<th>Id</th><th>Name</th><th colspan="3">Actions</th>
								</tr>
							</thead>	
							<tbody>
								<c:forEach var="plan" items="${plans}">
								
									<c:url var="viewLink" value="PlanManagement">
										<c:param name="command" value="ViewPlan" />
										<c:param name="planId" value="${plan.planId}" />
									</c:url>
									
									<c:url var="updateLink" value="PlanManagement">
										<c:param name="command" value="LoadUpdatePlanForm"/>
										<c:param name="planId" value="${plan.planId }"/>
									</c:url>
									
									<c:url var="deleteLink" value="PlanManagement">
										<c:param name="command" value="DeletePlan" />
										<c:param name="planId" value="${plan.planId}" />
									</c:url>
								
									<tr class="text-center">
										
										<td><h5>${plan.planId}</h5></td>
										<td><h5>${plan.name}</h5></td>
										<td><a class="btn btn-success btn-lg" href="${viewLink }">View</a></td>
										<td><a class="btn btn-primary btn-lg" href="${updateLink }">Update</a></td>
										<td><a class="btn btn-danger btn-lg" href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this plan?'))) return false">Delete</a></td>
										
									</tr>
									
									
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<div class="text-center" style="font-size:23px;">No Plans Found</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%for(int i=0;i<5;i++){ %>
		<br>
		<%} %>
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