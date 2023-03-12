<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<table>
	<tr>
		<th>IDX</th>
		<th>ID</th>
		<th>닉네임</th>
		<th>생일</th>
		<th>전화번호</th>
		<th>유의사항</th>
		<th>HASH</th>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.idx }</td>
		<td>${list.userid }</td>
		<td>${list.usernick }</td>
		<td>${list.birth }</td>
		<td>${list.phone }</td>
		<td>${list.memo }</td>
		<td>${list.hash }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>