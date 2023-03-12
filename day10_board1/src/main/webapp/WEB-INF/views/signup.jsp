<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<fieldset>
	<legend>회원가입</legend>
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID입력하세요"></p>
	<p><input type="password" name="userpw" placeholder="비밀번호 입력하세요"></p>
	<p><input type="text" name="username" placeholder="이름을 입력하세요"></p>
	<p><input type="date" name="birth"></p>
	<p>
		<label><input type="radio" name="gender" value="남성">남성</label>
		<label><input type="radio" name="gender" value="여성">여성</label>	
	</p>
	<p><input type="submit" value="가입하기"></p>
</form>
</fieldset>


</body>
</html>
