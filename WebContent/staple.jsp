<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sql:query var="staple" dataSource="jdbc/foodbook">   
			select * from staple where name like '%${param.name}%';
	</sql:query> 
	<table border="1">
	<c:forEach var="s" items="${staple.rows}">
		<tr>
		<td>${s.no}</td>
		<td>${s.name}</td>
		<td>${s.note}</td>
		<td>${s.picture}</td>

		<td><a href="stapleEdit.jsp?no=${s.no}">Edit</a></td>
		<td><a href="EditStaple.u?delete=yes&no=${s.no}">Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>