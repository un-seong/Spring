<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:set var="dto" value="${dto }" />
<form method="POST">
	<p><input type="text" name="name" value="${dto.name }" required autofocus></p>
	<p><input type="text" name="author" value="${dto.author }"></p>
	<p><input type="text" name="publisher" value="${dto.publisher }"></p>
	<p><input type="Date" name="publishDate" value="${dto.publishDate }"></p>
	<p><input type="number" name="price" value="${dto.price }"></p>
	<p><textarea name="memo" cols="40" rows="5">"${dto.memo }"</textarea></p>
	<p><input type="number" name="score" value="${dto.score }" step="0.1"></p>
	<p><input type="submit" value="수정"></p>
</form>


</body>
</html>