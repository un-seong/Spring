<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<fieldset>
	<legend>로그인</legend>
<form method="POST">
	<p><input type="text" name="userid" placeholder="아이디를 입력하세요" required></p>
	<p><input type="password" name="userpw" placeholder="비밀번호를 입력하세요" required></p>
	<p><input type="submit" value="로그인"></p>	
</form>
</fieldset>
</body>
</html>