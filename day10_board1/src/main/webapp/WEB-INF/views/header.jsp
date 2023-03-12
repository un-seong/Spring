<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">    

<style>
	body {
 		font-family: 'Jua', sans-serif;
 	}
  
    table {
        border-collapse: collapse;
        margin-top: 20px;
    }

    th {
        background-color: black;
        color: white;
    }

    th, td {
        border: 1px solid black;
        padding: 10px 15px;
    }

    td:nth-child(1) {
        background-color: aquamarine;   
    }

    td:nth-child(n+2) {
        background-color: #dadada;
     }
     
     a {
     	text-decoration: none;
     }
     
     form {
     	display: flex;
     	flex-direction: column;
     	width: 500px;
     	text-align: center;
     }
     
     fieldset {
     	width: 500px;
     	text-align: center;
     }
     
     pre {
     	border: 1px solid black;
     	background-color: black;
     	color: white;
     }
     
     button {
     	margin: 10px 15px;
     }
</style>

</head>
<body>

<h1><a href="${cpath }">게시판 같지?</a></h1>

<c:if test="${not empty loginComplete }">
	<h3>${loginComplete.username } (${loginComplete.userid })</h3>
</c:if>




<ul>
	<li><a href="${cpath }/userlist">회원리스트</a></li>
	<c:if test="${loginComplete == null }">
		<li><a href="${cpath }/signup">가입</a></li>	
	</c:if>	
	<li><a href="${cpath }/${loginComplete==null ? 'login' : 'logout' }">${loginComplete==null ? '로그인' : '로그아웃' }</a></li>
	<li><a href="${cpath }/mypage/${loginComplete.idx}">마이페이지</a></li>
</ul>

<ul>
	<li><a href="${cpath }/boardlist">글목록</a></li>
</ul>