<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	textarea {
		resize: none;	
	}
	
	label {
		color: #darkgray;
		font-size: 10px;
	}

</style>
</head>
<body>


<h1><a href="${cpath }">장기이식전문</a></h1>
<hr>

<nav>
	<div>
		<a href="${cpath }/login">로그인</a>
	</div>

	<div>
		<a href="${cpath }/list">목록</a>
		<a href="${cpath }/insert">추가</a>
		<a href="#">수정</a>
		<a href="#">삭제</a>
	</div>
</nav>
