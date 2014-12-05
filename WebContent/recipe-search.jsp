<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Sun Nov 09 2014 11:26:13 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="5459aef63007e3302336d044">
<head>
  <meta charset="utf-8">
  <title>Recipe Search - FOOD BOOK</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="generator" content="Webflow">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/food-book.webflow.css">
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script> -->
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
  <div class="section hero recipe-search"><img class="recipe-image" src="images/pic 5 row 1.jpg" width="1000" alt="545e24429e0dd64959381965_recipe%201%20one%20row%202.jpg">
    <div class="w-row">
      <div class="w-col w-col-6">
        <h1 class="recipe-heading">Menu Search</h1>
        <a class="w-inline-block" href="recipe-add.jsp">
        	<img class="staple-icon" src="images/icon add brown.png" width="48" alt="545f34f87848976b2dd626e6_icon%20add%20brown.png">
        </a>
      </div>
      
      
	  <div class="w-col w-col-6">
	      <div class="w-form recipe-from-warp">
	          <form class="recipe-form" id="email-form" name="email-form" data-name="Email Form" action="#">
	            <input class="w-input recipe-search-bar" id="name" type="text" placeholder="Search your menu ..." name="name" data-name="Name" value="${param.name }">
	            <input class="w-button recipe-submit" type="submit" value="Search" data-wait="Please wait...">
	          </form>
	      </div>    
      </div>
      
      
    </div>
  </div>
  <div class="section grey search-recipe" data-anchor="slide1">
  
  <sql:query var="recipe" dataSource="jdbc/foodbook">   
			select recipe.*,member.id from recipe left join member on member_no=member.no where name like '%${param.name}%';
  </sql:query>
  
  <c:forEach var="rec" items="${recipe.rows}">
  	<div class="w-container middle-container card">
      <div class="recipe-card-row">
        <div class="w-row card-row-col">
          <div class="w-col w-col-3 card-col1">
          	<img class="card-image" src="ShowPic?path=${rec.picture}" alt="http://placehold.it/240x160" width="240" height="160""/>
          </div>
          <div class="w-col w-col-9 card-col2">
            <h2 class="card-head">${rec.name }</h2>
            <p class="card-para head">${rec.note }</p>
            <p class="card-para head">ประเภท : ${rec.kind }</p>
            
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
  
   
  </div>
  <div class="section recipe"></div>
  <div class="social-section">
    <div class="w-container">
      <h2>Tell your friends</h2>
      <p>When youâre sharing your kitchen with someone, youâre sharing your life.</p>
    </div>
  </div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>