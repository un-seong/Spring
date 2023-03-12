<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<ul>
	<li><a href="${cpath }/ex01">ex01 - 기본 파라미터 처리하기</a></li>
	<li><a href="${cpath }/ex02">ex02 - 똑같이 따라함</a></li>
	<li><a href="${cpath }/ex03">ex03 - ex02보다 더 줄임</a></li>
	<li><a href="${cpath }/ex04">ex04 - ex03보다 더 줄임</a></li>
	<li><a href="${cpath }/ex05">ex05 - @RequestParam > 해쉬맵으로 받으면 생략 불가</a></li>
</ul>

<p>
	<a href="${cpath }/updown"><button>업다운 게임 시작</button></a>
</p>


<%--
		<태그 속성="값" 속성="값"></태그>
--%>