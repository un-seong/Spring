<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST" enctype="multipart/form-data">
	<select name="category">
		<option value="">== 종류 ==</option>
		<option value="사과">사과</option>
		<option value="배">배</option>
	</select>
	<p><input type="text" name="productName" placeholder="제목"></p>
	<p><input type="number" name="price" placeholder="가격"></p>
	<p><input type="number" name="score" min="0" max="5" step="0.1" placeholder="별점"></p>
	<p><input type="file" name="thumbNailFile"></p>
	<p><input type="file" name="reviewFile"></p>
	<p><input type="date" name="registDate" placeholder="등록일" checked="checked"></p>
	<p><input type="submit"></p>
</form>

</body>
</html>