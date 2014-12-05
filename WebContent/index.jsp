<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Tue Nov 04 2014 04:35:22 GMT+0000 (UTC) -->
<html data-wf-site="54505b5d2e727128158ccd56" data-wf-page="54505b5d2e727128158ccd58">
<head>
  <meta charset="utf-8">
  <title>FOOD BOOK</title>
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
  
  <div class="section hero">
    <div class="w-slider home-slider" data-animation="slide" data-duration="500" data-infinite="1" data-delay="4000" data-autoplay="1">
      <div class="w-slider-mask">
        <div class="w-slide home-slide"></div>
        <div class="w-slide home-slide two" id="home"></div>
        <div class="w-slide home-slide three"></div>
      </div>
      <div class="w-slider-arrow-left">
        <div class="w-icon-slider-left"></div>
      </div>
      <div class="w-slider-arrow-right">
        <div class="w-icon-slider-right"></div>
      </div>
      <div class="w-slider-nav w-round"></div>
    </div>
  </div>
  <div class="section grey home" data-anchor="slide1">
    <div class="w-container middle-container">
      <h2 class="grey-heading" data-ix="fade-in">Let’s Cook</h2>
      <p class="para-middle" data-ix="fade-in">Whether you’re looking for healthy recipes or ideas to use up last night’s chicken, we’ve more than 2000 tested recipes to choose from, so you’re sure to find the perfect dish</p>
      <div class="div-center" data-ix="fade-in">
      <img class="infinite image" src="images/let cook 5.png" width="128" alt="54547645b05c765715b9eff2_let%20cook%205.png">
      <img class="infinite image" src="images/let cook 5.png" width="128" alt="54547645b05c765715b9eff2_let%20cook%205.png">
      <img class="infinite image" src="images/let cook 5.png" width="128" alt="54547645b05c765715b9eff2_let%20cook%205.png">
      </div>
    </div>
  </div>
  <div class="section">
    <div class="w-container">
      <h2 class="grey-heading" data-ix="fade-in">Mobile Access</h2>
      <p data-ix="fade-in">“Most importantly, responsive web design isn't intended to serve as a replacement for mobile web sites.”</p>
    </div>
  </div>
  <div class="social-section" data-ix="fade-in">
    <div class="w-container">
      <h2 data-ix="fade-in">Tell your friends</h2>
      <p data-ix="fade-in">When you’re sharing your kitchen with someone, you’re sharing your life.</p>
      <div class="share-wrapper">
        <div class="w-widget w-widget-facebook share-btn" data-ix="fade-in">
          <iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Ffacebook.com%2Fwebflow&amp;layout=box_count&amp;locale=en_US&amp;action=like&amp;show_faces=false&amp;share=false" scrolling="no" frameborder="0" allowtransparency="true" style="border: none; overflow: hidden; width: 55px; height: 65px;"></iframe>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/footer.jsp" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>