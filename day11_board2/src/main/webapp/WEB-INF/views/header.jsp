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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">    

<style>
	body {
 		font-family: 'Jua', sans-serif;
 		width: 1800px;
 		height: 1080px;
 		margin: 0px;
 		padding: 0px;
 	}
 	
 	.top {
 		display: flex;
 		justify-content: center;
 	}
  
    table {
        border-collapse: collapse;
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }

    th {
        background-color: black;
        color: white;
    }

    th, td {
        border: 1px solid black;
        padding: 10px 15px;
    }
    
    th {
    	font-size: 14px;
    }
    
    td {
    	font-size: 11px;
    }

    td:nth-child(1) {
        background-color: aquamarine;   
    }

    td:nth-child(n+2) {
        background-color: #dadada;
    }
     
    a {
    	color: black;
    	text-decoration: none;
    }
        
    .menu > ul {
    	display: flex;
    	justify-content: center;
    	padding: 0px;
    }
    
    .menu > ul > li {
    	font-size: 20px;
    	list-style: none;
    	margin: 10px 15px;
    	text-align: center;
    }
    
    .loginComplete {
    	font-size: 25px;
    	color: maroon;
    	display: flex;
    	justify-content: end;
    	margin: 0px;
    }
    
    .list {
    	display: flex;
    	justify-content: center;
    }
    
    .bold {
    	font-weight: bold;
    }
    
    fieldset {
		display: flex;
		justify-content: center;
		text-align: center;
		margin: 0 auto;
		width: 300px;
	}
	
	.mypage {
		flex-direction: column;
	}
	
	.mypageMenu {
		display: flex;
		justify-content: center;
		
	}

	.search {
		display: flex;
		justify-content: center;
		text-align: center;
		margin: 0 10px;
	}
    
    .listNumber {
    	display: flex;
    	justify-content: center;
    	text-align: center;
    	margin: 5px 10px;
    }
    
    .detail {
    	flex-direction: column;
    	height: 500px; 
    }
    
    .writeReply {
    	display: flex;
    	justify-content: center;    
    }
    
    .reply {
    	width: 700px;
    }
    
    .reply > p {
    	margin: 0 15px;
    }
    
    .detailMenu {
    	display: flex;
    	justify-content: center;
    	text-align: center;
    }
    
    .detailMenu > a {
    	margin: 5px 10px;
    }
    
    .detailMenu > a:nth-child(3) {
		justify-content: flex-end;
	}
	
	.back {
		position: absolute;
		width: 100px;
		height: 30px;
		top: 700px;
	}
</style>

</head>
<body>

<div class="top">
	<h1><a href="${cpath }">게시판 같지? v0.2</a></h1>
</div>


<div class="menu">
	<ul>
		<li><a href="${cpath }/member/userlist">회원리스트</a></li>
		
		<c:if test="${loginComplete == null }">
			<li><a href="${cpath }/member/signup">가입</a></li>
		</c:if>
		
		<li><a href="${cpath }/member/${loginComplete==null ? 'login' : 'logout' }">${loginComplete==null ? '로그인' : '로그아웃' }</a></li>
		
		<c:if test="${not empty loginComplete }">
			<li><a href="${cpath }/member/mypage/${loginComplete.idx}">마이페이지</a></li>
		</c:if>
	</ul>
	
	<c:if test="${not empty loginComplete }">
		<h3 class="loginComplete">${loginComplete.username } (${loginComplete.userid })</h3>
	</c:if>
	
</div>

<div class="list">
<ul>
	<li><a href="${cpath }/board/boardlist">글목록</a></li>
</ul>
</div>