<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dto }" />

<form method="POST">
	<p><input type="number" name="emp_idx" value="${dto.emp_idx }" min="0" max="999" step="1" required></p>
	<p><input type="text" name="emp_name" value="${dto.emp_name }" required></p>
	<p><input type="text" name="emp_phone" value="${dto.emp_phone }" required></p>
	<p><input type="text" name="emp_position" value="${dto.emp_position }" required></p>
	<p><input type="text" name="emp_email" value="${dto.emp_email }" required></p>
	<p><input type="submit" value="수정하기"></p>
</form>


</body>
</html>