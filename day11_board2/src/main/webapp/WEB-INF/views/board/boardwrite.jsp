<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<fieldset>
	<legend>글쓰기</legend>
		<form method="POST" enctype="multipart/form-data">
			<p><input type="hidden" name="writer" value="${loginComplete.userid }"></p>
			<p><input type="text" name="title" placeholder="제목을 입력하세요"></p>
			<p><textarea rows="15" cols="30" name="content" placeholder="본문 입력하세요" style="resize: none;"></textarea></p>
			<p><input type="file" name="file"></p>
			<p><input type="submit" value="작성"></p>
		</form>
		
<button onclick="history.back()" class="back">이전으로</button>		
</fieldset>

</body>
</html>