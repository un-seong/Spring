<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<input type="text" name="title" placeholder="제목 입력">
	<input type="submit" value="검색">
</form>

<table>
	<tr>
		<th>IDX</th>
		<th>글쓴이</th>
		<th>TITLE</th>
		<th>날짜</th>	
		<th>조회수</th>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.idx }</td>
		<td>${list.writer }</td>
		<td><a href="${cpath }/boardsee/${list.idx}">${list.title }</a></td>
		<td>${list.today }</td>
		<td>${list.count }</td>
	</tr>
	</c:forEach>
</table>

<a href="${cpath }/boardwrite"><button>글쓰기</button></a>


</body>
</html>