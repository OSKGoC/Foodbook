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
			select * from member where no='${param.no}';
	</sql:query>

	<c:forEach var="m" items="${member.rows}">
		<form action="EditMember.u" method="post">
			<input type="hidden" name="no" value="${m.no}">
			NO: ${m.no}<br>
			ID: ${m.id }<br>
			Pass : <input name="p"><br>
			 email : <input name="email" value="${m.email }"><br>
			Role : <input name="role" value="${m.role }"><br> 
			<input type="submit" value="Edit">
		</form>
	</c:forEach>


</body>
</html>