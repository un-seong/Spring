<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="home.jsp" %>

<table>
	<tr>
		<th>IDX</th>
		<th>USERID</th>
		<th>USERPW</th>
		<th>USERNAME</th>
		<th>BIRTH</th>
		<th>GENDER</th>
	</tr>
	<c:forEach var="dto" items="${dto }">
	<tr>
		<td>${dto.IDX }</td>
		<td>${dto.USERID }</td>
		<td>${dto.USERPW }</td>
		<td>${dto.USERNAME }</td>
		<td>${dto.BIRTH }</td>
		<td>${dto.GENDER }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>