<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST" class="search">
	<input type="text" name="title" placeholder="제목 입력">
	<input type="submit" value="검색">
</form>

<table>
	<tr>
		<th>IDX</th>
		<th>글쓴이</th>
		<th>TITLE</th>
		<th>날짜</th>
		<th>IP</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.idx }</td>
		<td>${list.writer }</td>
		<td class="name">
			<a href="${cpath }/board/boardsee/${list.idx}">${list.title }</a>
			<c:if test="${list.uploadFile != null }">
				<span><img src="${cpath }/resources/img/빈파일.png" width="10px"></span>
			</c:if>
		</td>
		<td>${list.writeDate }</td>
		<td>${list.ipAddr }</td>
		<td>${list.viewCount }</td>
	</tr>
	</c:forEach>
</table>

<div class="listNumber">
	<a href="${cpath }/board/boardwrite"><button>글쓰기</button></a>
	
	<c:if test="${nowPage != 1}">
		<a href="${cpath }/board/boardlist?nowPage=${begin-5 }"><button>5개이전</button></a>
	</c:if>
	
	<c:if test="${nowPage != 1}">
		<a href="${cpath }/board/boardlist?nowPage=${nowPage-1 }"><button>이전</button></a>
	</c:if>
	
	<c:if test="${end != totalBoard }">
		<c:forEach var="i" begin="${begin }" end="${end }" >
			<a href="${cpath }/board/boardlist?nowPage=${i}" style="font-weight: ${i == nowPage ? 'bold' : ''}">[${i }]</a>
		</c:forEach>
	</c:if>
	
	<c:if test="${nowPage != page }">
		<a href="${cpath }/board/boardlist?nowPage=${nowPage+1 }"><button>다음</button></a>
	</c:if>
	
	<c:if test="${nowPage != page }">
		<a href="${cpath }/board/boardlist?nowPage=${begin+5 }"><button>5개다음</button></a>
	</c:if>
</div>





</body>
</html>