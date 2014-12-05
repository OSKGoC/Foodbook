<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Sun Nov 09 2014 11:26:13 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="545f226970c9479e25495391">
<head>
  <meta charset="utf-8">
  <title>Staple Search - FOOD BOOK</title>
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
  	<img class="recipe-image staple" src="images/pic 2 row.jpg" width="800" alt="545f23ccc3684d9f25f51c8a_pic%202%20row.jpg">
	  <div class="section hero recipe-search">
	    <div class="w-row">
	      <div class="w-col w-col-6">
	        <h1 class="recipe-heading staple">Staple Search</h1>
	        <a class="w-inline-block" href="staple-add.jsp">
	        <img class="staple-icon" src="images/icon add brown.png" width="48" alt="545f34f87848976b2dd626e6_icon%20add%20brown.png">
	        </a>
	      </div>
	      <div class="w-col w-col-6">
	      	<div class="w-form recipe-from-warp">
	          <form class="recipe-form" id="email-form" name="email-form" data-name="Email Form" action="#">
	            <input class="w-input recipe-search-bar staple" id="name" type="text" placeholder="Search Staple ..." name="name" data-name="Name" value="${param.name }">
				<img class="image-block staple" src="images/mig icon.png" width="64" alt="5464aeeb14c5b0046dad34c9_mig%20icon.png">
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <div class="section grey search-recipe" data-anchor="slide1">
	  
	    <%-- <div class="container-wide">
	      <div class="w-row">
	        <div class="w-col w-col-8 staple-list-col">
	         
	        <sql:query var="staple" dataSource="jdbc/foodbook">   
				select * from staple where name like '%${param.name}%';
			</sql:query>
	        
	        <c:forEach var="s" items="${staple.rows}" varStatus="o">
	          <div class="w-row card-row-col">
	            <div class="w-col w-col-4 card-col1">
	            	<img class="card-image" src="ShowPic?path=${s.picture}" alt="http://placehold.it/240x160" width="240" height="160">
	            </div>
	            <div class="w-col w-col-8 card-col2">
	              <h2 class="card-head staple">${s.name }</h2>
	              <p class="card-para head staple">อธิบาย : ${s.note }</p>
	            </div>
	          </div>
	        </c:forEach>
	        
	        </div>
	        <div class="w-col w-col-4 staple-cart-col">
	          <div>
	              <form class="from-sign-in add-staple" id="email-form" name="email-form" data-name="Email Form" data-redirect="/extend-register-success">
	                <div class="staple-cart-text">drop staple here</div>
	                <div class="staple-cart-space">
	                
	                
	                  <!-- <div class="w-clearfix staple-div-in-cart">
	                    <div class="staple-text-in-cart">ไข่ไก่</div><img class="staple-image-in-cart" src="images/cross.png" alt="5461989feda5e620048f5fb5_cross.png">
	                  </div> -->
	                  
	                  
	                </div>
	                <input class="w-button submit-sign-in add-staple cart" type="submit" value="Cook" data-wait="Please wait...">
	              </form>
	          </div>
	        </div>
	      </div>
	    </div>
	--%>
	
	  <div class="container-wide">
	  	<form action="SearchRecipe.u">
	  		
			<jsp:include page="DragStaple.jsp"></jsp:include>	 
			<input type="submit" value="COOK" class="w-button submit-sign-in add-staple cart">
			
		</form> 
	  </div>
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