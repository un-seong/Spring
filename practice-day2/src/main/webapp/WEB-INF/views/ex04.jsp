<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="POST">
	<input type="text" name="name" placeholder="수정할 사람 이름 입력">
	<input type="submit">
</form>

<table>
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>수학</th>
		<th>영어</th>
	</tr>
	<tr>
		<td>${ob1.name }</td>
		<td>${ob1.kor }</td>
		<td>${ob1.eng }</td>
		<td>${ob1.mat }</td>
	</tr>
</table>

<a href="${cpath }/ex04result">수정하러 가기!</a>


</body>
</html>