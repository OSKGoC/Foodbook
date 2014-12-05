<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:query var="staple" dataSource="jdbc/foodbook">   
			select * from staple where no='${param.no}';
	</sql:query>
	<c:forEach var="s" items="${staple.rows}">
		<form action="EditStaple.u" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${s.no}">
			no: ${s.no }<br>
			<br>
			Name:<input name="name" value="${s.name }"><br> 
			Note:<input name="note" value="${s.note }"><br>
			<img src="ShowPic?path=${s.picture}">
			Picture:<input name="picture" type="file"><br>
			<input type="Submit" value="Let Edit Staple">
		</form>
	</c:forEach>
</body>
</html>