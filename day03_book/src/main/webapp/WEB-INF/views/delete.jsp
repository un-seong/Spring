<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<table>
	<tr>
		<th>IDX</th>
		<th>제목</th>
		<th>가격</th>
		<th>출판사</th>
	</tr>
	
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.idx }</td>
		<td>${list.name }</td>
		<td>${list.price }</td>
		<td>${list.publisher }</td>
	</tr>
	</c:forEach>
</table>

<form method="POST">
	<input type="number" name="idx" placeholder="번호 입력">
	<input type="submit" value="삭제">
</form>

</body>
</html>