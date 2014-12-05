<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:query var="recipe" dataSource="jdbc/foodbook">   
			select recipe.*,member.id from recipe left join member on member_no=member.no where name like '%${param.name}%';
	</sql:query> 
	<table border="1">
	<c:forEach var="r" items="${recipe.rows}">
		<tr>
		<td>${r.no}</td>
		<td>${r.name}</td>
		<td>${r.note}</td>
		<td>${r.kind}</td>
		<td>${r.how_to}</td>
		<td>${r.date_add}</td>
		<td>${r.picture}</td>
		<td>${r.id}</td>

		<td><a href="recipeEdit.jsp?no=${r.no}">Edit</a></td>
		<td><a href="EditRecipe.u?delete=yes&no=${r.no}">Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>