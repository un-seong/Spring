<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<fieldset>
	<legend>정보수정</legend>
<form method="POST">	
	<p><input type="text" name="userid" value="${dto.userid }" readonly></p>
	<p><input type="password" name="userpw" value="${dto.userpw }" required autofocus></p>
	<p><input type="text" name="username" value="${dto.username }"></p>
	<p><input type="date" name="birth" value="${dto.birth }" required></p>
	<p>
		<label><input type="radio" name="gender" value="남성" ${dto.gender == '남성' ? 'checked' : '' }>남성</label>
		<label><input type="radio" name="gender" value="여성" ${dto.gender == '여성' ? 'checked' : '' }>여성</label>
	</p>
	<p><input type="submit" value="수정"></p>
</form>	
</fieldset>


</body>
</html>