<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>게시판 목록</h3>

<div class="wrap">
	<table id="boardList">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>IP</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td><a href="${cpath }/board/view/${dto.idx}">${dto.title }</a></td>
			<td>${dto.writer }</td>
			<td><fmt:formatDate value="${dto.writeDate }" /></td>
			<td>${dto.ipaddr }</td>
			<td>${dto.viewCount }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="pageNumber">
		<c:if test="${paging.prev }">
			<a href="${cpath }/board/list?page=${paging.begin - 1}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a class="${paging.page == i ? 'bold' : '' }" 
			   href="${cpath }/board/list?page=${i}">[${i }]</a>
		</c:forEach>
		
		<c:if test="${paging.next }">
			<a href="${cpath }/board/list?page=${paging.end + 1}">[다음]</a>
		</c:if>
	</div>
	
	<div class="sb">
		<div>
			<form>
				<p>
					<input type="search" name="keyword" placeholder="검색어를 입력하세요">
					<input type="submit" value="검색">
				</p>
			</form>
		</div>
		<div>
			<a href="${cpath }/board/write"><button>작성</button></a>
		</div>
	</div>
</div>







</body>
</html>