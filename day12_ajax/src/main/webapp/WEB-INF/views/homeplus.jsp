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
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${cpath }/resources/css/style.css" />

</head>
<body>

<h1>homeplus 상품 목록</h1>
<hr>

<div id="root">
	<div id="column">
		<div class="idx">상품번호</div>
		<div class="category">카테고리</div>
		<div class="productName">상품명</div>
		<div class="price">가격</div>
		<div class="score">점수</div>
		<div class="registDate">등록날짜</div>
	</div>
	<div id="items">
		<img class="loading" src="${cpath }/resources/img/loading.png">
	</div>
</div>


<script src="${cpath }/resources/js/function.js"></script>

<script>
	const cpath = '${cpath}'
	const items = document.getElementById('items')
	function loadHandler() {
		const url = cpath + '/homeplus/product'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			console.log(text)
			const arr = JSON.parse(text)			// JSON형식의 문자열을 객체로 변환
			console.log(arr)
			const jsonString = JSON.stringify(arr)	// JS객체를 JSON문자열로 변환
			console.log(jsonString)
			
			items.innerHTML = ''
			arr.forEach(dto => items.innerHTML += jsonToHTML(dto))
		})
		
	}

	document.body.onload = loadHandler
</script>


</body>
</html>