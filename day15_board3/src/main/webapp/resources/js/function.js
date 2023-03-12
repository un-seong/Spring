function deleteHandler(event) {
	
	const replyWriter = event.target.parentNode.parentNode.querySelector('.writer')
	console.log(login_userid, replyWriter.innerText)	// 현재 로그인 사용자, 댓글 작성자
	
	if(login_userid != replyWriter.innerText) {
		alert('본인이 작성한 댓글만 삭제할 수 있습니다')
		return
	}	
	else {
		const flag = confirm('정말 삭제하시겠습니까?')
		if(flag) {
			// 삭제하는 내용을 fetch로 전송
			const idx = replyWriter.parentNode.parentNode.parentNode.getAttribute('idx')
			const url = `${cpath}/board/reply/${board_idx}/${idx}`
			const opt = {
				method: 'DELETE'
			}
			fetch(url, opt)
		}
	}
	
}

//
//async function replyLoadHandler() {
//	const replyDiv = document.getElementById('reply')
//	const url = cpath + '/board/reply/' + board_idx
//	
//	// 특정 작업이 끝난 이후 진행을 하고 싶다면...await
//	// await는 async 함수 안에서만 가능
//	
//	awiat fetch(url)
//	.then(resp => resp.json())
//	.then(json => {
//		const arr = json
//		replyDiv.innerHTML = ''
//		
//		arr.forEach(dto => {
//			const html = convertHTMLformJSON(dto)
//			replyDiv.innerHTML += html
//		})
//	})
//	const deleteBtnList = document.querySelectorAll('button.delete')
//	console.log(deleteBtnList)
//	deleteBtnList.forEach(btn => btn.onclick = deleteHandler)
//	
//	
//}


function replyWriteHandler(event) {
	event.preventDefault()
	const content = document.querySelector('#replyWriteForm textarea')
	// 게시글 번호, 작성자, 내용
	const ob = {
		board_idx: board_idx,
		writer: login_userid,
		content: content.value
	}
	console.log(ob)
	
	const url = cpath + '/board/reply/' + board_idx
	const opt = {
		method: 'POST',
		body: JSON.stringify(ob),
		headers: {
			'Context-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			alert('작성 성공!!')
			replyWriteHandler()
		}
	})
}