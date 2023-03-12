<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<fieldset>
	<legend>글쓰기</legend>
<form method="POST">
	<p><input type="text" name="title" placeholder="제목을 입력하세요"></p>
	<p><textarea rows="20" cols="30" name="content" placeholder="본문 입력하세요" style="resize: none;"></textarea></p>
	<p><input type="hidden" name="writer" value="${loginComplete.userid }"></p>
	<p><input type="hidden" name="count" value="0"></p>
	<p><input type="submit" value="작성"></p>
</form>
</fieldset>

</body>
</html>