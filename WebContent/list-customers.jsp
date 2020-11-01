<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<jsp:include page="header.jsp"/>
<c:choose>
	<c:when test="${role=='Admin'}">
		<div class="container">
			<div id="content">
				<form action="CustomerManagement" method="POST" style="margin-top:35px;">
				    <div class="form-group col-md-12">
						  <div class="text-center">
						  <div class="row">
						  <div class="col-md-4 " style="font-size:22px"> <input type="hidden" name="command" value="SearchCustomer" />Search Customer : </div>
						  <div class="col-md-4"><input type="text" class="form-control " pattern="[0-9]{8}" name="regId" title="Please enter the right 8 digit Registration number" placeholder="Enter Registration number" required ></div>
						  <div class="col-md-4"><input type="submit" value="Search" class="btn btn-primary btn-xl" /></div>
						  </div>
						</div>
						<!-- 
				    <input   class="btn success"  style="border:1px"/> -->
					</div>
				</form>
				<br/><br/>
				<c:choose>
					<c:when test="${customers.size()>0 }">
						<table class="table table-striped table-bordered text-center">
							<thead class="thead-dark">
								<tr>
									<th>Registration Number</th><th>Customer Name</th><th colspan="3">Actions</th>
								</tr>
							</thead>	
							<tbody>
								<c:forEach var="customer" items="${customers}">
								<!-- Set up update link for each customer -->
								
								<c:url var="viewLink" value="CustomerManagement">
									<c:param name="command" value="ViewCustomer" />
									<c:param name="regId" value="${customer.regId}" />
								</c:url>
								
								
								<c:url var="deleteLink" value="CustomerManagement">
									<c:param name="command" value="DeleteCustomer" />
									<c:param name="regId" value="${customer.regId}" />
								</c:url>
								
								<tr class="text-center">
									<!-- As we use jstl tag customer.firstName will call customer.getFirstName() automatically -->
									<td><h5>${customer.regId}</h5></td>
									<td><h5>${customer.firstName}&nbsp; ${customer.lastName}</h5></td>
									<td><a class="btn btn-primary btn-lg"  href="${viewLink}">View</a></td>
									<td><a class="btn btn-danger btn-lg" href="${deleteLink}"onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a></td>
									
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<div class="text-center" style="font-size:23px;">No Customers Found</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<%for(int i=0;i<10;i++){ %>
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