<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Buy Plan</title>

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
	<c:when test="${profile!=null}">
		<jsp:include page="header.jsp"/>
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 modal-dialog text-center " style="margin-top:50px;">
					<div class="modal-content row">
						<div class="col-md-12">
							<div style="font-size:23px;">Buy Plan</div>
							
							<div id="msg">
								<c:if test="${not empty msg }">
									<br><br><div  style="color:red;text-align:center;font-size:19px;">${msg }</div><br>
									<c:remove var="msg" scope="request"/>
								</c:if>
							</div>
							<hr>
						</div>
						<div class="col-md-12">
							<form action="PlanManagement" method="POST">
								<input type="hidden" name="command" value="BuyPlan"/>
								<input type="hidden" name="planId" value="${param.planId }"/>
								
								<div class="form-group">
									<input type="text" class="form-control" name="name" placeholder="Name on Card" required/>
								</div>
								
								<div class="form-group">
									<input type="text" class="form-control" name="text" pattern="[0-9]{6,}" placeholder="Card Number" required/>
								</div>
								
								<div class="form-group row">
									<div class="col-md-3">
										<select class="form-control" required>
											<option disabled selected>MM</option>
											<%for(int i=1;i<=12;i++){ %>
											<option><%=i %></option>
											<% }%>
										</select> 
									</div>
									<div class="col-md-4">
										<select class="form-control" required>
											<option disabled selected>YYYY</option>
											<%for(int i=2020;i<=2040;i++){ %>
											<option><%=i %></option>
											<% }%>
										</select> 
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" pattern="[0-9]{3}" name="csv" placeholder="Security Code"/>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-4"></div>
										<button type="submit" class="btn btn-primary col-md-4" style="border-radius:20px;">Buy</button>
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
		
		response.sendRedirect(response.encodeRedirectUrl(contextpath+"/login.jsp"));
		%>
	</c:otherwise>
</c:choose>
</body>
</html>