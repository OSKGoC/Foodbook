<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Sun Nov 09 2014 11:26:13 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="545f371c70c9479e25495468">
<head>

  <title>Staple Add - FOOD BOOK</title>
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
	<jsp:include page="/WEB-INF/nav_menu.jsp" />
  	<%-- -------------------------------------------------------------- --%>
  </div><img class="recipe-image staple" src="images/pic 2 row 2.jpg" width="800" alt="545f37997848976b2dd626fa_pic%202%20row%202.jpg">
  <div class="section hero recipe-search">
    <div class="w-row">
      <div class="w-col w-col-6">
        <h1 class="recipe-heading staple add">Staple Add</h1>
      </div>
      <div class="w-col w-col-6"></div>
    </div>
  </div>
  <div class="section grey search-recipe" data-anchor="slide1"></div>
  <div class="section recipe">
  
  <c:choose>
        	<c:when test="${param.add_name!=null}">
        		<div class="w-container middle-container">
			      <h2 class="grey-heading sign-in">Add Staple Successful</h2>
			      <div class="w-form">
			        <form class="from-sign-in" id="email-form" name="email-form" data-name="Email Form" action="staple-search.jsp">
			          <label class="sign-in-text thank" for="pass-2">คุณได้เพิ่ม &lt;${param.add_name}&gt; ลงในระบบเรียบร้อยแล้ว</label>
			          <input class="w-button submit-sign-in register" type="submit" value="Staple Search" data-wait="Please wait...">
			        </form>
			        <div class="w-form-done">
			          <p>Thank you! Your submission has been received!</p>
			        </div>
			        <div class="w-form-fail">
			          <p>Oops! Something went wrong while submitting the form :(</p>
			        </div>
			      </div>
			    </div>
        	</c:when>
        	<c:otherwise>
		        <!-- ------------------------------------------------------------------------------------ -->
		        <div class="w-container middle-container">
			      <h2 class="grey-heading add-staple">ADD</h2>
			      <div>
			        <div class="w-form">
			          <form class="from-sign-in add-staple" id="email-form" name="email-form" data-name="Email Form"  action="CreStaple.u" method="post" enctype="multipart/form-data" >
			            <div class="staple-section">
			              <label class="sign-in-text add-staple" for="name-2">Staple Name</label>
			              <input class="w-input sign-in-input add-staple" id="name-2" type="text" placeholder="Enter Staple Name" name="name" data-name="Name 2" required="required">
			            </div>
			            <div class="staple-section">
			              <label class="sign-in-text add-staple" for="name-4">Staple Note</label>
			              <input class="w-input sign-in-input add-staple" id="name-4" type="text" placeholder="Enter Staple Note" name="note" data-name="Name 4">
			            </div>
			            <div class="add-staple-picture-section">
			              <label class="sign-in-text add-staple block" for="name-3">Picture</label>
			              <div class="w-embed embed-staple">
			                <input name="picture" type="file">
			              </div>
			            </div>
			            <input class="w-button submit-sign-in add-staple" type="submit" value="Add" data-wait="Please wait...">
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
		        <!-- ------------------------------------------------------------------------------------ -->
		    </c:otherwise>
   </c:choose>
  
  
    <!--  -->
  </div>
  <div class="social-section"></div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>