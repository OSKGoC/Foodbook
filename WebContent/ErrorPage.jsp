<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Wed Nov 12 2014 13:10:08 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="546236d6295de6c507e86a12">
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
  <meta charset="utf-8">
  <title>[practice] Error Page - FOOD BOOK</title>
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
  <div class="navbar">
    <div class="w-container">
      <div class="w-row home-nav-row">
        <div class="w-col w-col-6 w-col-small-6 w-col-tiny-6 left-nav">
          <a class="w-inline-block" href="index.html"><img class="logo" src="images/newfork_1x.png" width="64" height="64" alt="545461e699d60fc6367cf45f_newfork_1x.png">
            <div class="brand">Food Book</div>
          </a>
        </div>
        <div class="w-col w-col-6 w-col-small-6 w-col-tiny-6 w-clearfix right-nav"><a class="button sign-in" href="sign-in.html">Sign in or Register</a>
        </div>
      </div>
    </div>
  </div>
  <div class="section hero register"></div>
  <div class="section grey sign-in error" data-anchor="slide1">
    <div class="w-container middle-container">
      <h2 class="grey-heading sign-in">Error</h2>
	      <p class="error-para">system have something wrong.
	      <br> ${param.message}.
	      <br> <a href="${param.url}">Back</a>
      </p>
      <div class="w-form">
        <form class="from-sign-in error" id="email-form" name="email-form" data-name="Email Form" data-redirect="/extend-after-sign-in" action="index.jsp">
	        
			
          <a class="w-inline-block link-block" href="register.html">
            <input class="w-button submit-sign-in" type="submit" value="Submit" data-wait="Please wait...">
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
  <div class="section grey">
    <div class="w-container">
      <a class="w-inline-block social-btn footer" href="http://facebook.com/webflow"><img class="icon footer" src="images/facebook-icon_black.svg" alt="52f158327711748d2600072b_facebook-icon_black.svg">
        <div class="footer-text">visit me on facebook</div>
      </a>
      <div class="footer-text">STR T1&nbsp;&nbsp;|&nbsp;&nbsp;IT at KMITL</div>
    </div>
  </div>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>