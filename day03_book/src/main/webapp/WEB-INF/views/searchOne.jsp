<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<form method="POST">
	<input type="text" name="name" placeholder="제목을 정확히 입력하세요!">
	<input type="submit" value="찾기">
</form>

<c:set var="listOne" value="${listOne }" />

<table style="visibility: ${listOne == null ? 'hidden' : ''}">
	<tr>
		<th>IDX</th>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>출판일</th>
		<th>가격</th>
		<th>메모</th>
		<th>별점</th>		
	</tr>	
	<tr>
		<td>${listOne.idx }</td>
		<td>${listOne.name }</td>
		<td>${listOne.author }</td>
		<td>${listOne.publisher }</td>
		<td>${listOne.publishDate }</td>
		<td>${listOne.price }</td>
		<td>${listOne.memo }</td>
		<td>${listOne.score }</td>
	</tr>
</table>

<a href="${cpath }/update?idx=${listOne.idx }" style="visibility: ${listOne == null ? 'hidden' : ''}"><button>수정!</button></a>	

</body>
</html>