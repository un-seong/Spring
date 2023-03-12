<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="PassWord"></p>
	<p><input type="text" name="usernick" placeholder="NickName"></p>
	<p><input type="DATE" name="birth"></p>
	<p><input type="number" name="phone" placeholder="전화번호"><label> 번호만 입력하세요!</label></p>
	<p><textarea name="memo" cols="20" rows="20"></textarea></p>
	<p><input type="submit" value="추가"></p>
</form>

</body>
</html>