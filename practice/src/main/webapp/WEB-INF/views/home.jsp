<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border-collapse: collapse;
	}
	
	th, td {
		border: 1px solid black;
	}


</style>
</head>
<body>

<h1>학원생 목록</h1>
<hr>

<table>
	<tr>
		<th>이름</th>
		<th>나이</th>
	</tr>
	<c:forEach var="dao" items="${list }">
	<tr>
		<td>${dao.userName }</td>
		<td>${dao.userAge }</td>
	</tr>
	</c:forEach>

</table>

</body>
</html>