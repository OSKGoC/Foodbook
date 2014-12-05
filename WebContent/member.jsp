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
	<sql:query var="member" dataSource="jdbc/foodbook">   
			select * from member ;
	</sql:query> 
	<table border="1">
	<c:forEach var="m" items="${member.rows}">
		<tr>
		<td>${m.no}</td>
		<td>${m.id}</td>
		<td>${m.pass}</td>
		<td>${m.email}</td>
		<td>${m.role}</td>
		<td><a href="memberEdit.jsp?no=${m.no}">Edit</a></td>
		<td><a href="EditMember.u?delete=yes&no=${m.no}">Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>