<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
  	
	<img class="recipe-image staple" src="images/pic 7 row 1.jpg" width="800" alt="5464f1d6d1d74a9117385900_pic%207%20row%201.jpg">
	
	<div class="section hero recipe-search">
	    <div class="w-row">
	      <div class="w-col w-col-6">
	        <h1 class="recipe-heading staple">Result Menu</h1>
	      </div>
	      <div class="w-col w-col-6"></div>
	    </div>
	</div>
	
	<sql:query var="recipe" dataSource="jdbc/foodbook">   
		select recipe.*,member.id from recipe left join member on member_no=member.no where recipe.no in (
		<c:forEach items="${requestScope.meeKob}" var="mk">
			${mk},
		</c:forEach>-1);
	</sql:query>
	
	
	
	<div class="section grey result" data-anchor="slide1">
    <div class="container-wide">
      <div class="result-menu-section">
        <h1 class="result-head">Compete</h1>
      	<c:forEach var="rec" items="${recipe.rows}">
        <div class="result-div">
          <div class="w-row card-row-col result">
            <div class="w-col w-col-3 card-col1">
            <img class="card-image" src="ShowPic?path=${rec.picture}" width="240" height="160">
            </div>
            <div class="w-col w-col-9 card-col2">
              <h2 class="card-head">${rec.name }</h2>
              <p class="card-para head">อธิบาย : ${rec.note }</p>
              <p class="card-para head">ประเภท : ${rec.kind }</p>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
      
      
      <sql:query var="recipe" dataSource="jdbc/foodbook">   
		select recipe.*,member.id from recipe left join member on member_no=member.no where recipe.no in (
		<c:forEach items="${requestScope.kadPai}" var="mk">
			${mk},
		</c:forEach>-1);
	  </sql:query>
      
      <div class="result-menu-section">
        <h1 class="result-head">Incompete</h1>
           
        <c:forEach var="rec" items="${recipe.rows}">
        <div class="result-div">
          <div class="w-row card-row-col result">
            <div class="w-col w-col-3 card-col1">
            <img class="card-image" src="ShowPic?path=${rec.picture}" width="240" height="160"/>
            </div>
            <div class="w-col w-col-9 card-col2">
              <h2 class="card-head">${rec.name }</h2>
              <p class="card-para head">อธิบาย : ${rec.note }</p>
              <p class="card-para head">ประเภท : ${rec.kind }</p>
            </div>
          </div>
        </div>
        </c:forEach>
        
      </div>
    
    
    </div>
    <a class="button result" href="staple-search.jsp">BACK</a>
  </div>
	
  <div class="section recipe"></div>
	
	<div class="social-section">
	   <div class="w-container">
	      <h2>Tell your friends</h2>
	      <p>When youâre sharing your kitchen with someone, youâre sharing your life.</p>
	   </div>
	</div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  
  
</body>
</html>