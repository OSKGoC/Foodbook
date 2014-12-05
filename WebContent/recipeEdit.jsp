<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:query var="recipe" dataSource="jdbc/foodbook">   
		select recipe.*,member.id from recipe left join member on member_no=member.no where recipe.no='${param.no}';
	</sql:query>
	<c:forEach var="r" items="${recipe.rows}">
		<form action="EditRecipe.u" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${r.no}">
			no: ${r.no }<br>
			<br>
			Name:<input name="name" value="${r.name }"><br> 
			Note:<input name="note" value="${r.note }"><br>
			Kind:<input name="kind" value="${r.kind }"><br> 
			How to:<input name="how_to" value="${r.how_to }"><br>
			Date Add : ${r.date_add}<br>
			member_add : ${r.id}<br>
			
			<jsp:include page="DragStaple.jsp?recipe_no=${r.no}"></jsp:include>
			
			<img src="ShowPic?path=${r.picture}">
			Picture:<input name="picture" type="file"><br>
			<input type="Submit" value="Let Edit Staple">
		</form>
	</c:forEach>
</body>
</html>