<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<table>
	<tr>
		<th>IDX</th>
		<th>ID</th>
		<th>PW</th>
		<th>NAME</th>
		<th>생일</th>
		<th>성별</th>	
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.idx }</td>
		<td>${dto.userid }</td>
		<td>${dto.userpw }</td>
		<td>${dto.username }</td>
		<td>${dto.birth }</td>
		<td>${dto.gender }</td>		
	</tr>			
	</c:forEach>
</table>

</body>
</html>
