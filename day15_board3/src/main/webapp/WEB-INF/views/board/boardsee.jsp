<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script>
	// JSP의 요소를 자바스크립트로 넘겨야 할 때 사용할 변수들
	const cpath = '${cpath}'
	const board_idx = '${dto.idx}'
	const login_userid = '${loginComplete.userid}'
</script>
<script src="${cpath }/resources/js/function.js"></script>

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

<!-- <form method="POST" class="writeReply"> -->
<%-- 	<p><input type="hidden" name="idx" value="${board.idx }"></p> --%>
<%-- 	<p><input type="hidden" name="writer" value="${loginComplete.userid }"><p> --%>
<!-- 	<p><textarea cols="30" rows="2" name="memo" placeholder="간단하게 할 말~♡" style="resize: none"></textarea></p> -->
<!-- 	<p><input type="submit" value="등록"></p> -->
<!-- </form> -->

<c:forEach var="reply" items="${reply }">
<fieldset class="reply">
	<legend>댓글</legend>
	<p>아이디 : ${reply.writer } </p>
	<p>남긴말 : ${reply.memo }</p>
	<p><a href="${cpath }/board/ilike/${reply.replyIdx}/${board.idx}"><button>좋아요</button></a>: ${reply.ilike }</p>
	<p><a href="${cpath }/board/dislike/${reply.replyIdx}/${board.idx}"><button>싫어요</button></a>: ${reply.dislike }</p>
</fieldset>
</c:forEach>


<form id="replyWriteForm">
	<p>
		<textarea name="content"
				placeholder="${empty loginComplete ? '로그인 이후 작성 가능합니다' : '바르고 고운 말을 사용 합니다' }"
				${empty loginComplete ? 'readonly' : '' }></textarea>
		<button>작성</button>
	</p>
</form>


<tr>
	<th colspan="2">
		
			
		<div id="reply1"></div>
	</th>
</tr>


<script>
	const replyWriteFome = document.getElementById('replyWirteFome')

	// textarea에 포커스가 잡히면 실행하는 함수
	document.querySelector('textarea').onfocus = function(event) {
		console.log(event.target.getAttribute('readonly'))
		if(login_userid == '') {		// 로그인이 안되어 있으면
			const move = confirm('댓글을 쓰려면 로그인 해야 합니다. 로그인 하시겠습니까?') // 물어보고
			event.target.blur()
			if(move) {	// 이동하겠다라고 하면 이동시킨다
				const url = cpath + '/member/login?url=' + location.href
				location.href = url
			}
		}
	}
	
// 	replyWriteFome.onload = replyWriteHandler
</script>

<script>
	const replyDiv = document.getElementById('reply1')
	const url = '${cpath}/reply1/${board.idx}'
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const arr = []
		
		for(let i = 0; i < json.length; i++) {
			arr.push({
				idx: json[i].idx,
				writer: json[i].writer,
				content: json[i].content,
				writeDate: getYMD(json[i].writeDate)
			})
			
		}
		console.log(arr)
		
		function getYMD(date) {				// 1675298767000
			const d = new Date(date)		// js 날짜 객체
			const yyyy = d.getFullYear()	// 4자리 연도
			let mm = d.getMonth() +1		// 월
			let dd = d.getDate()			// 일
			
			mm = mm < 10 ? '0'+mm : mm		// 월이 한자리면 0을 붙임
			dd = dd < 10 ? '0'+dd : dd		// 일이 한자리면 0을 붙임
					
			const ret = yyyy + '-' + mm + '-' + dd // 형식을 맞춤
			return ret							   // 형식에 맞춰 반환
		}
		
		console.log(arr.map(e => getYMD(e.writeDate)))
		

// 		arr.map(e => {
// 			const span1 = document.createElement('div')
// 			span1.innerText = e.idx
// 			const span2 = document.createElement('span')
// 			span2.innerText = e.writer
// 			span2.innerText += e.content
// 			const span4 = document.createElement('span')
// 			span4.innerText = e.writeDate
			
// 			replyDiv.appendChild(span1)
// 			replyDiv.appendChild(span2)
// 			replyDiv.appendChild(span4)
// 		})

		arr.map(e => {
			const fieldset = document.createElement('fieldset')
			fieldset.className = 'reply1'
			const legend = document.createElement('legend')
			legend.innerText = e.idx
			const span2 = document.createElement('span')
			span2.innerText = e.writer
			const span3 = document.createElement('span')
			span3.innerText = e.content
			const span4 = document.createElement('span')
			span4.innerText = e.writeDate
			const button = document.createElement('button')
			button.innerText = '수정'
			button.className = 'modify'
			const button1 = document.createElement('button')
			button1.innerText = '삭제'
			button1.className = 'delete'
			
			fieldset.appendChild(legend)
			fieldset.appendChild(span2)
			fieldset.appendChild(span3)
			fieldset.appendChild(span4)
			fieldset.appendChild(button)
			fieldset.appendChild(button1)
			replyDiv.appendChild(fieldset)
		})
		
		
				
// 		replyDiv.innerText = '여기에 댓글을 불러옵니다'		
	})
</script>



<%-- <a style="visibility: ${loginComplete.userid == board.writer ? 'visibility' : 'hidden' }" href="${cpath }/board/boardupdate/${board.idx}"><button>수정</button></a> --%>
<%-- <a style="visibility: ${loginComplete.userid == board.writer ? 'visibility' : 'hidden' }" href="${cpath }/board/boarddelete/${board.idx}"><button>삭제</button></a> --%>


</body>
</html>