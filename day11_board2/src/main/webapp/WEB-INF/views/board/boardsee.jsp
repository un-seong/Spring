<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="board" value="${board }" />

<fieldset class="detail">
	<legend>자유게시판</legend>
		<p>제목 : ${board.title }</p>
		<p>글쓴이 : ${board.writer }</p>
		<p>본문 :</p><pre>${board.content }</pre>
		<p>날짜 : ${board.writeDate }</p>
		<p>IP : ${board.ipAddr }</p>
		<c:if test="${board.uploadFile != null }">
			<p><img src="${cpath }/upload/${board.uploadFile }" width="200px;"></p>
		</c:if>
		<p>조회수 : ${board.viewCount }</p>
</fieldset>

<div class="detailMenu">
	<c:if test="${loginComplete.userid == board.writer }">
		<a href="${cpath }/board/boardupdate/${board.idx}"><button>수정</button></a>
		<a href="${cpath }/board/boarddelete/${board.idx}"><button>삭제</button></a>
		<a href="${cpath }/board/boardlist"><button>목록으로</button></a>
	</c:if>
</div>

<form method="POST" class="writeReply">
	<p><input type="hidden" name="idx" value="${board.idx }"></p>
	<p><input type="hidden" name="writer" value="${loginComplete.userid }"><p>
	<p><textarea cols="30" rows="2" name="memo" placeholder="간단하게 할 말~♡" style="resize: none"></textarea></p>
	<p><input type="submit" value="등록"></p>
</form>

<c:forEach var="reply" items="${reply }">
<fieldset class="reply">
	<legend>댓글</legend>
	<p>아이디 : ${reply.writer } </p>
	<p>남긴말 : ${reply.memo }</p>
	<p><a href="${cpath }/board/ilike/${reply.replyIdx}/${board.idx}"><button>좋아요</button></a>: ${reply.ilike }</p>
	<p><a href="${cpath }/board/dislike/${reply.replyIdx}/${board.idx}"><button>싫어요</button></a>: ${reply.dislike }</p>
</fieldset>
</c:forEach>




<%-- <a style="visibility: ${loginComplete.userid == board.writer ? 'visibility' : 'hidden' }" href="${cpath }/board/boardupdate/${board.idx}"><button>수정</button></a> --%>
<%-- <a style="visibility: ${loginComplete.userid == board.writer ? 'visibility' : 'hidden' }" href="${cpath }/board/boarddelete/${board.idx}"><button>삭제</button></a> --%>


</body>
</html>