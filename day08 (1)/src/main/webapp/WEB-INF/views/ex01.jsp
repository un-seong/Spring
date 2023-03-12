<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<table>
	<tr>
		<th>IDX</th>
		<th>ID</th>
		<th>PW</th>
		<th>이름</th>
		<th>생일</th>
		<th>성별</th>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.idx }</td>
		<td>${list.userid }</td>
		<td>${list.userpw }</td>
		<td>${list.username }</td>
		<td>${list.birth }</td>
		<td>${list.gender }</td>	
	</tr>	
	</c:forEach>
</table>

<fieldset>
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" autofocus></p>
	<p><input type="text" name="userpw" placeholder="PassWord"></p>
	<p><input type="text" name="username" placeholder="Name"></p>
	<p><input type="date" name="birth" placeholder="생일"></p>
	<p>
		<input type="radio" name="gender" value="남성">남성
		<input type="radio" name="gender" value="여성">여성
	</p>
	<p><input type="submit" value="가입"></p>
</form>
</fieldset>
</body>
</html>