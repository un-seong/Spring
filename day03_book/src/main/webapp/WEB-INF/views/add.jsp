<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST">
	<p><input type="text" name="name" placeholder="제목" required autofocus></p>
	<p><input type="text" name="author" placeholder="저자"></p>
	<p><input type="text" name="publisher" placeholder="출판사"></p>
	<p><input type="Date" name="publishDate"></p>
	<p><input type="number" name="price" placeholder="가격"></p>
	<p><textarea name="memo" cols="40" rows="5"></textarea></p>
	<p><input type="number" name="score" step="0.1" placeholder="별점"></p>
	<p><input type="submit" value="추가"></p>
</form>

</body>
</html>