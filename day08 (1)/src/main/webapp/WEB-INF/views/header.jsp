<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08</title>
<style>
	table {
		border-collapse: collapse;
	}
	
	th {
		background-color: #dadada;
		font-weight: bold;
		font-size: 20px;
	}
	
	th, td {
		border: 2px solid black;
		padding: 5px 10px;
		text-align: center;
	}
	
	fieldset {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	margin-left: 20px;
	width: 20px;
	}

</style>


</head>
<body>
<h1><a href="${cpath }">day08</a></h1>


<ul>
	<li><a href="${cpath }/ex01">ex01 - member5 회원가입 및 회원 목록</a></li>
</ul>

</body>
</html>