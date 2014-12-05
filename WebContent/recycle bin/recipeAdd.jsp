<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="CreRecipe.u" method="post" enctype="multipart/form-data">
		Name:<input name="name" ><br>
		Note:<input name="note" ><br>
		Kind:<input name="kind" ><br>
		How to:<input name="how_to" ><br>
<%-- 	member that login	<input type="hidden" name="member_no" value="${sessionScope.member_no}"><br> --%>
		<input type="hidden" name="member_no" value="1"><br>
		<sql:query var="staple" dataSource="jdbc/foodbook">   
			select * from staple;
		</sql:query>
		<c:forEach var="s" items="${staple.rows}">
		Staple:<input name="staple" type="checkbox" value="${s.no}"> ${s.name} <input name="volume"><br>
		</c:forEach>
		Picture:<input name="picture" type="file"><br>
		<input type="Submit" value="Let Save Nimple(Staple)">
	</form>
	
</body>
</html>