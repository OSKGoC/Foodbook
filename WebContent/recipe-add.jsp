<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Wed Nov 12 2014 13:10:08 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="546355a59d93a2990f0bea6a">
<head>
  <meta charset="utf-8">
  <title>Recipe Add - FOOD BOOK</title>
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
  <img class="recipe-image staple" src="images/pic 2 row 2.jpg" width="800" alt="545f37997848976b2dd626fa_pic%202%20row%202.jpg">
  <div class="section hero recipe-search">
    <div class="w-row">
      <div class="w-col w-col-6">
        <h1 class="recipe-heading staple add">Menu Add</h1>
      </div>
      <div class="w-col w-col-6"></div>
    </div>
  </div>
  <div class="section grey search-recipe" data-anchor="slide1"></div>
  <div class="section recipe">
    <div class="w-container middle-container">
      <h2 class="grey-heading add-staple">Menu Add</h2>
      <div>
        <div class="w-form">
          <form class="from-sign-in add-staple" id="email-form" name="email-form" data-name="Email Form" data-redirect="/extend-register-success" action="CreRecipe.u" method="post" enctype="multipart/form-data">
            <div class="staple-section">
              <label class="sign-in-text add-staple" for="name-2">Name</label>
              <input class="w-input sign-in-input add-staple" id="name-2" type="text" placeholder="Enter Staple Name" name="name" data-name="Name 2" required="required">
            </div>
            <div class="staple-section">
              <label class="sign-in-text add-staple" for="name-4">Note</label>
              <input class="w-input sign-in-input add-staple" id="name-4" type="text" placeholder="Enter Staple Note" name="note" data-name="Name 4" >
            </div>
            <div class="staple-section">
              <label class="sign-in-text add-staple" for="name-6">Kind</label>
              <input class="w-input sign-in-input add-staple" id="name-6" type="text" placeholder="Enter Staple Kind" name="kind" data-name="Name 6" >
            </div>
            <div class="staple-section add-line">
              <label class="sign-in-text add-staple" for="field">How to Cook</label>
              <textarea class="w-input sign-in-input add-staple" id="field" placeholder="Enter How to cook" name="how_to" rows="4" draggable="false" "></textarea>
              <input type="hidden" name="member_no" value="1">
            </div>
            <div class="add-staple-picture-section">
              <label class="sign-in-text add-staple block" for="name-3">Picture</label>
              <div class="w-embed embed-staple">
                <input name="picture" type="file">
              </div>
            </div>
            
            
              <jsp:include page="DragStaple.jsp"></jsp:include>
              
            </div>
            <input class="w-button submit-sign-in add-staple" type="submit" value="Register" data-wait="Please wait...">
          </form>

        </div>
      </div>
    </div>
  </div>
  <div class="social-section"></div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>