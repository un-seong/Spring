<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	table {
		border-collapse: collapse;
		margin-top: 10px;
	}
	
	th, td {
		border: 1px solid black;
		padding: 5px 10px;
		text-align: center;
	}
	
	th {
		background-color: black;
		color: white;
	}

</style>

</head>
<body>

<h3>대문</h3>
<hr>

<a href="${cpath }/ex01">ex01 - version check</a>
<a href="${cpath }/ex02">ex02 - date check</a>
<a href="${cpath }/ex03">ex03 - member5 check</a>

</body>
</html>