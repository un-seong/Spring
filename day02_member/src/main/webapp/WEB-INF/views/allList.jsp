<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<table>
	<tr>
		<th>idx</th>
		<th>userid</th>
		<th>userpw</th>
		<th>username</th>
		<th>birth</th>
		<th>gender</th>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.idx }</td>
		<td>${list.userid }</td>
		<td>${list.userpw }</td>
		<td>${list.birth }</td>
		<td>${list.gender }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>