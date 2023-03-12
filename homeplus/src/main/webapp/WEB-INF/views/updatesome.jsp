<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<form method="POST">
	<select name="category">
		<option value="">== 종류 ==</option>
		<option value="사과" ${dto.category == '사과' ? 'selected' : '' }>사과</option>
		<option value="배" ${dto.category == '배' ? 'selected' : '' }>배</option>
	</select>
	<p><input type="text" name="productName" value="${dto.productName }"></p>
	<p><input type="number" name="price" value="${dto.price }"></p>
	<p><input type="number" name="score" value="${dto.score }" min="0" max="5" step="0.1"></p>
	<p><input type="submit" value="수정하기(사진없음)"></p>
</form>

</body>
</html>