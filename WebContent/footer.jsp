<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/136b4fde49.js" crossorigin="anonymous"></script>
</head>
<style>

      .footer{
        background-color: rgba(0, 0, 0, 0.89);
      }
      #footer{
        
        bottom: 0;
        /* margin-top: auto; */
        border-top: solid 5px yellow;
        /* padding: -80px; */
        /* height: 150px; */
      }

      #copyright{
        background-color: #141414;
        height: 40px;
        color: white;
      }

      .foottext{
        color:white;
        font-size: 13px;
        text-align: justify;
      }

      #icon{
        color: #FFFB00;
      }

    </style>
<body>
	<div class="container-fluid footer" id="footer">
	
      <div class="row">
        
        <div class="col foottext">
          <div class="row py-2">
            <div class="col-6">
              <p><span style="color:#FFFB00;font-size: 1.0rem;padding-left:40px;">About Us</span></p>
                <p style="padding-left:40px;">
                Dispur Wireless, Assam's largest wireless provider provides wireless voice and data communications services across Assam to more than 9 million customers
                <br/>
                Dispur Cable, cable business of Dispur is a leading cable services provider, offering cable television, high-speed Internet access, and telephony products for residential and business customers
                <br/>
                Dispur Media is Assam's premier group of category-leading broadcast, specialty, print and on-line media assets with businesses in radio and television broadcasting, televised shopping, magazine and trade journal publication, and sports entertainment
                </p>
            </div>
          
            <div class="col-3">
              <p><span style="color:#FFFB00;font-size: 1.0rem;">Services</span></p>
              	<li>Wireless voice and Data communications</li><br> 
                <li>Cable Television</li><br>
                <li>High speed Internet</li><br>
                <li>Telephony products</li>
            </div>
  
            <div class="col-3">
              <p><span style="color:#FFFB00;font-size: 1.0rem;">Contact Us</span></p>
                <a>Email: customer.services@dispurwireless.com</a><br>
                <a>Contact No : 022-42406778, 022-54567890</a><br>
                <a>Address : Hengrabari Rd, Sanket Vihar, Swaraj Nagar, Sarumotoria, Guwahati, Assam 781006</a>
            </div>
  
          </div>	
        </div>
      
      </div>
  
    <div class="row py-2" id="copyright">
      <div class="col-2"></div>
      <div class="col-6" style="font-weight: bold;">Copyright <i class="far fa-copyright"></i> All rights reserved by <span style="color:#FFFB00;">Dispur Wireless</span></div>
      <div class="col-4">
        <p>
          <span style="color:#FFFB00;font-size:15px;">Connect With Us </span>
          <i class="fab fa-facebook-square" id="icon"> </i> 
          <i class="fab fa-twitter-square" id="icon"> </i> 
          <i class="fab fa-google-plus-g" id="icon"> </i> 
          <i class="fab fa-linkedin" id="icon"> </i>
        </p> 
      </div>
    </div>
    
    
  </div>
</body>
</html>