<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
	
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner">
	        <div class="carousel-item active">
	            <img class="d-block w-100" src="${pageContext.request.contextPath}/images/india-network.jpg" alt="First slide">
	            <div class="carousel-caption d-none d-md-block">
	                <h1>Dispur Wireless</h1>
	                <h3> Assam's largest wireless provider provides wireless voice and data communications services across Assam to more than 9 million customers</h3>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100" src="${pageContext.request.contextPath}/images/cable 1.jpg" alt="Second slide">
	            <div class="carousel-caption d-none d-md-block">
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100" src="${pageContext.request.contextPath}/images/cable-television.jpg" alt="Third slide">
	            <div class="carousel-caption d-none d-md-block">
	                <h1 class="text-dark">Dispur Media is Assam's premier group of category-leading broadcast</h1>
	            </div>
	        </div>
	    </div>
	    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	    </a>
	</div>
	<script>
	    $('.carousel').carousel({
	        interval: 1000
	    })
	</script>
</section>
<br><br><br>
<jsp:include page="footer.jsp"/>
</body>
</html>