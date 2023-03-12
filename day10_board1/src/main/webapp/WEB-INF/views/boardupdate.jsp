<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dto }" />

<fieldset>
	<legend>글 수정</legend>
<form method="POST">
	<p><input type="text" name="title" value="${dto.title }"></p>
	<p><textarea rows="20" cols="30" name="content" style="resize: none;">${dto.content }</textarea></p>
	<p><input type="submit" value="작성"></p>
</form>
</fieldset>

</body>
</html>