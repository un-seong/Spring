<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME +</title>
<style>
	body {
		width: 1900px;
		height: 1080px;
		margin: 0;
		padding: 0;
	}
	
	.header {
		display: flex;
		justify-content: center;
		margin-top: 60px;
	}
	
	.header > a {
		margin-right: 150px; 
	}
	
	.header > a > img {		
		width: 200px;
		margin: 5%;
	}
	
	.divinput {
		border: 1px solid black;
		border-radius: 3em;
		width: 600px;
		height: 45px;
		margin: 10px;
	}
	
	.divinput > input {
		border: none;
		margin: 10px 20px;
		width: 500px;
	}
	
	.divinput > input:focus {
		outline: none;
	}
	
	.topimg {
		margin-left: 100px;
	}
	
	.topimg > img {
		margin: 10px 15px;
	}
	
	.topmenu {
		display: flex;
		justify-content: center;
	}
	
	.menu {
		margin: 0 20px;
	}
	
	.menu > a {
		text-decoration: none;
	}
	
	.items {
		width: 270px;
		display: inline-block;
		margin: 10px 0px;
	}
	
	.topmenu {
		margin: 5px 10px;
	}
	
	center {
		width: 1300px;
		margin: 10px;
		margin-left: 450px;
	}
	
	.leftimg {
		position: absolute;
		margin-left: 250px;
	}
	
	.detailtop {
		display: inline-flex;
	}

	.detailMenu {
		margin: 20px;
	}

	.detailProductName, .detailPrice, .detailScore, .detailButton {
		margin: 15px;	
	}
	
	.detailProductName {
		font-size: 30px;
		font-weight: bold;
	}
	
	.detailPrice {
		display: flex;
	}
	
	.priceTitle {
		font-size: 10px;
		color: rgb(153, 153, 153);
	}

	.price {
		font-size: 30px;
		font-weight: bold;
	}	

</style>
</head>
<body>

<div class="header">
	<a href="${cpath }/"><img src="${cpath }/resources/homeplus 메인.png"></a>
	<div class="divinput"><input type="text" placeholder="검색어를 입력하세요"></div>
	<div class="topimg">
		<img src="${cpath }/resources/로그인.png">
		<img src="${cpath }/resources/사용자.png">
		<img src="${cpath }/resources/장바구니.png">		
	</div>
</div>

<div class="topmenu">
	<div class="menu"><a href="${cpath }/allList">목록</a></div>
	<div class="menu"><a href="${cpath }/insert">추가</a></div>
	<div class="menu"><a href="${cpath }/listAsc">가격오름차순</a></div>
	<div class="menu"><a href="${cpath }/listDesc">가격내림차순</a></div>
</div>


<hr>







