<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="board" value="${board }" />

<fieldset>
	<legend>자유게시판</legend>
		<p>제목 : ${board.title }</p>
		<p>글쓴이 : ${board.writer }</p>
		<p>본문 :</p><pre>${board.content }</pre>
		<p>날짜 : ${board.today }</p>
		<p>조회수 : ${board.count }</p>
</fieldset>


<a style="visibility: ${loginComplete.userid == board.writer ? 'visibility' : 'hidden' }" href="${cpath }/boardupdate/${board.idx}"><button>수정</button></a>
<a style="visibility: ${loginComplete.userid == board.writer ? 'visibility' : 'hidden' }" href="${cpath }/boarddelete/${board.idx}"><button>삭제</button></a>


</body>
</html>