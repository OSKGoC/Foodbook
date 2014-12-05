<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Sun Nov 02 2014 06:59:04 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="54547cdf99d60fc6367cf502">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
  <meta charset="utf-8">
  <title>Sign In - FOOD BOOK</title>
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
  <div class="section hero register"></div>
  <div class="section grey sign-in" data-anchor="slide1">
    <div class="w-container middle-container">
      <h2 class="grey-heading sign-in">Sign In</h2>
      <div class="w-form">
        <form class="from-sign-in" id="email-form" name="email-form" data-name="Email Form" action="login.u" method="post">
          <label class="sign-in-text" for="name-2">Username</label>
          <input class="w-input sign-in-input" id="name-2" type="text" placeholder="Enter username" name="id" data-name="name" required="required">
          <label class="sign-in-text" for="pass">Password</label>
          <input class="w-input sign-in-input" id="pass" type="password" placeholder="Enter password" name="pass" data-name="pass" required="required">
          <input class="w-button submit-sign-in" type="submit" value="Submit" data-wait="Please wait...">
          <a class="w-inline-block link-block" href="register.jsp">
            <label class="text-to-register">or register here</label>
          </a>
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
  <div class="social-section register"></div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>