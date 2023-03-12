<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day17 - 스크롤 로딩을 활용한 게시판</title>
<style>
	#root {
		width: 600px;
		height: 600px;
		margin: auto;
		border: 2px solid black;
		overflow-y: scroll;
		background-color: #eee;
	}
	.item {
		width: 400px;
		margin: auto;
		border: 1px solid black;
		padding: 10px;
		box-sizing: border-box;
	}
	.item > .title {
		padding: 10px;
		width: 80%;
		margin: auto;
	}
	.item > .content {
		background-color: white;
		padding: 10px;
		width: 80%;
		margin: auto;
		font-size: 16px;
	}
</style>
</head>
<body>

<h1>day17 - 스크롤 로딩을 활용한 게시판</h1>
<hr>
	
<div id="root" offset="0"></div>


<script>
	function loadHandler(event) {
		const root = document.getElementById('root')
		const offset = +root.getAttribute('offset')
		
		const cur = root.scrollTop + root.clientHeight
		const flag = root.scrollHeight * 0.97 <= cur && cur <= root.scrollHeight * 1.03
		
		if(flag) {
			fetch('${cpath}/getBoardList/' + offset)
			.then(resp => resp.json())
			.then(json => {
				json.forEach(dto => {
					let tag = ''
					tag += '<div class="item" idx="' + dto.idx + '">'
					tag += '	<div class="title">' + dto.title + '</div>'
					tag += '	<div class="content"><pre>' + dto.content + '</pre></div>'
					tag += '</div>'
					root.innerHTML += tag
					root.setAttribute('offset', offset + 5)
				})
			})			
		}
	}		
	window.onload = loadHandler
	root.onscroll = loadHandler
</script>

</body>
</html>