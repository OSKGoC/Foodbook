<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/food-book.webflow.css">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
<script>
	var right="images/check.png";
	WebFont
			.load({
				google : {
					families : [
							"Exo:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic",
							"Roboto:300,regular", "Roboto Condensed:regular" ]
				}
			});

	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev) {
		ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));

	}
	//event.preventDefault()
	function loadRecipeStaple(no,name){
		keep[keep.length] = no;
		var originalDiv = document.getElementById(no+'div');
		var alreadyImg = document.createElement("img");
		alreadyImg.id=name+'r';
		alreadyImg.src=right;
		alreadyImg.draggable=false;
		originalDiv.appendChild(alreadyImg).style.width = "30px";
		for (var i = 0; i < keep.length; i++) {
			if (no = keep[i]) {
				document.getElementById(no).draggable = false;
				
			}
			
		}
	}
	
	var keep = [];

	function dropcopy(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("Text");
		var copyimg = document.createElement("img");
		var alreadyImg = document.createElement("img");
		var input = document.createElement("input");
		var div = document.createElement("div");
		var original = document.getElementById(data);
		var originalDiv = document.getElementById(data+'div');

		keep[keep.length] = data;
		for (var i = 0; i < keep.length; i++) {
			if (data = keep[i]) {
				document.getElementById(data).draggable = false;
			}
		}
		alreadyImg.id=original.title+"r";
		alreadyImg.src=right;
		alreadyImg.draggable=false;
		copyimg.id = original.id+'s';
		copyimg.src = original.src;
		copyimg.title = original.title;
		copyimg.draggable=true;
		copyimg.ondragstart=function(){drag(event)};
		input.id = original.title;
		input.name = "staple";
		input.type = "hidden";
		input.value = data;
		div.className = "div-staple-image"; // <<<<<<<<<< Chang This
		
		originalDiv.appendChild(alreadyImg).style.width = "30px";
		div.appendChild(copyimg).style.width = "64px";
		div.appendChild(input);
		ev.target.appendChild(div);
	}
	
	function dropOut(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("Text");

		var original = document.getElementById(data);
		var name=original.title;
		var originalInput = document.getElementById(name);
		
		var stapleDragged = document.getElementById("stapleDragged");
		remove(data);
		remove(name);
		remove(name+'r');
		
		for (var i = 0; i < keep.length; i++) {
			if (data = keep[i]) {
				document.getElementById(data).draggable = true;
			}
		}
		
		
	}
	
	function remove(id)
	{
	    return (elem=document.getElementById(id)).parentNode.removeChild(elem);
	}

	function doSearch() {
		//using input tag in Div stapleAll
		var q = document.getElementById("search");
		var v = q.value.toLowerCase();
		var stapleAll = document.getElementById("stapleAll");
		var rows=stapleAll.getElementsByTagName("input");
		var rowd=stapleAll.getElementsByTagName("div");
		var on = 0;
		
		for (var i = 0; i < rows.length; i++) {
			var value = rows[i].id.toLowerCase();
			var id = rows[i].value;
			if (value.indexOf(v)==-1){
				document.getElementById(id+"div").style.display='none';
			}
			else {
				document.getElementById(id+"div").style.display='inline-block';
			}
		}
		
	}
</script>
</head>
<body>
	
	
	<div class="add-staple-picture-section recipe">
		<label class="sign-in-text add-staple inbox" for="search">Staple</label>
		<input id="search" onkeyup="doSearch()" class="w-input sign-in-input add-staple check-box" type="text" placeholder="Search staple">
		
		<sql:query var="staple" dataSource="jdbc/foodbook">   
					select * from staple;
		</sql:query>

		<!-- <img draggable="true"> -->
		
		<div id="stapleAll" class="w-row recipe-add-table">
			<div class="w-col w-col-8 recipe-col-1" style="overflow-x:hidden;">
			<c:forEach var="s" items="${staple.rows}">
			
				<div id="${s.no}div" class="div-staple-block">
						<input type="hidden" id="${s.name}input" value="${s.no }">
						<img id="${s.no}" src="ShowPic?path=${s.picture}" title="${s.name }" draggable="true" ondragstart="drag(event)" class="div-staple-image" height="160" width="240" />
						<div class="div-text-block">${s.name}</div>
				</div>
				
			</c:forEach>
			</div>
	
			<div class="w-col w-col-4 recipe-col-2">
			  <div class="staple-cart-text">drop staple here</div>
			  <div id="stapleDragged" class="staple-cart-space" ondrop="dropcopy(event)" ondragover="allowDrop(event)" draggable="true" >  
				  <c:if test="${not empty param.recipe_no}">
						<sql:query var="recipe_staple" dataSource="jdbc/foodbook">   
						select * from recipe_staple join staple on(staple_no=no) where recipe_no=${param.recipe_no};
						</sql:query>
						<img draggable="true">
						<c:forEach var="rs" items="${recipe_staple.rows}">
						<div class = "div-staple-image">
						<input id="${rs.name}" type="hidden" name="staple" value="${rs.staple_no}">
						<img id="${rs.staple_no}s" src="ShowPic?path=${rs.picture}" title="${rs.name}" draggable="true" ondragstart="drag(event)" style="width:64px;"/>
						</div>
						<script type="text/javascript">
							loadRecipeStaple("${rs.staple_no}","${rs.name}");
						</script>
						</c:forEach>
				  </c:if>
			  </div>
			  <div id="stapleDel" class="staple-cart-space bin" ondrop="dropOut(event)" ondragover="allowDrop(event)" draggable="true"  > 
				</div>
			</div>
		</div>
	</div>
	
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
</body>
</html>