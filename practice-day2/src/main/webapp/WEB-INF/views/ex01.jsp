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

	th {
		background-color: #dadada;
		font-weight: bold;
	}
	
	th, td {
		border: 1px solid black;
		padding: 5px 10px;
		text-align: center;
	}
</style>

</head>
<body>

<h1>ex01</h1>
<hr>

<table>
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.name }</td>
		<td>${dto.kor }</td>
		<td>${dto.eng }</td>
		<td>${dto.mat }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>