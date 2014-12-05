
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Sun Nov 02 2014 06:35:08 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="5454813fb05c765715b9f07c">
<head>
  <meta charset="utf-8">
  <title>Register - FOOD BOOK</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="generator" content="Webflow">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/food-book.webflow.css">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
  <script>
    WebFont.load({
      google: {
        families: ["Exo:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Roboto:300,regular","Roboto Condensed:regular"]
      }
    });
  </script>
  <script type="text/javascript" src="js/modernizr.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="https://y7v4p6k4.ssl.hwcdn.net/placeholder/favicon.ico">
</head>
<body>
  <%-- This is include Tab ---------------------------------------------%>
	<jsp:include page="/WEB-INF/top_menu.jsp" />
  	<%-- -------------------------------------------------------------- --%>
  <div class="section hero register">
  	<c:if test="${param.reg_ok == -1}">
  		<label class="sign-in-text thank" for="pass-2">Something Wrong.</label>
  	</c:if>
  </div>
  
  <c:choose>
  	<c:when test="${param.reg_ok == 1}">
  		<div class="section grey sign-in" data-anchor="slide1">
			<div class="w-container middle-container">
			  <h2 class="grey-heading sign-in">Thank you for Register</h2>
			  <div class="w-form">
			    <form class="from-sign-in" id="email-form" name="email-form" data-name="Email Form" action="index.jsp">
			      <label class="sign-in-text thank" for="pass-2">Thank you for registering with us. You will receive an email from us shortly, confirming your registration request and including summary of your registration details.</label>
			      <input class="w-button submit-sign-in register" type="submit" value="Back to Home" data-wait="Please wait...">
			    </form>		 
			  </div>
			</div>
		</div>
  	</c:when>
  	
  	<c:otherwise>
  <!-- -------------------------------------------------------------------------------------------------------------------------- -->
  <div class="section grey sign-in" data-anchor="slide1">
    <div class="w-container middle-container">
      <h2 class="grey-heading sign-in">Register</h2>
      <div class="w-form">
        <form class="from-sign-in" id="email-form" name="email-form" data-name="Email Form" action="register.u" method="post">
          <label class="sign-in-text" for="name">Username</label>
          <input class="w-input sign-in-input" id="name" type="text" placeholder="Enter username" name="id" data-name="Name">
          <label class="sign-in-text" for="pass">Password</label>
          <input class="w-input sign-in-input" id="pass" type="text" placeholder="Enter password" name="pass" data-name="pass" required="required">
          <label class="sign-in-text" for="pass-2">Re-Password</label>
          <input class="w-input sign-in-input" id="pass-2" type="text" placeholder="Re-Enter password" name="re_pass" data-name="Pass 2" required="required">
          <label class="sign-in-text" for="pass-3">E-mail Address</label>
          <input class="w-input sign-in-input" id="pass-3" type="email" placeholder="Enter your email" name="email" data-name="Pass 3" required="required">
          <input class="w-button submit-sign-in register" type="submit" value="Register" data-wait="Please wait...">
          <input type="hidden" name="role" value="user">
        </form>
        <div class="w-form-done">
          <p>Thank you! Your submission has been received!</p>
        </div>
        <div class="w-form-fail">
          <p>Oops! Something went wrong while submitting the form :(</p>
        </div>
      </div>
    </div>
  </div>
  <!-- -------------------------------------------------------------------------------------------------------------------------- -->
	  </c:otherwise>
	  </c:choose>
  
  <div class="social-section register"></div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>