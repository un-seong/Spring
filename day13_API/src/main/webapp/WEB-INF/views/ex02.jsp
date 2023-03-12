<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">


<style>
	
	body {
		font-family: 함초롱체;
		font-size: 15px;		
	}
	
	.item {
		padding : 10px;
		margin: 10px 0;
		width: 220px;
	}
	
/* 	.item:hover > .detail {  */
/* 		display: block;  */
/* 	}  */
	
	.detail {
		border: 1px solid black;
		width: 1500px;
		padding : 10px;
		margin: 10px 0;
		display: none;
		position: fixed;
		top: 10px;
		right: 10px;
		background-color: white;
	}
	
	.detail.selected {
		display: flex;
		flex-direction: column;
	}
	
	.UC_SEQ, .LAT, .LNG, .MAIN_IMG_THUMB, .place {
		display: none;
	}

	.MAIN_IMG_NORMAL {
		position: absolute;
		top: 10px;
		right: 10px;
		background-position: center center;
		background-size: auto 100%;
		width: 390px;
		height: 180px;
	}
	
	

</style>

</head>
<body>

<div id="root">

</div>

<script>
	const url = 'https://apis.data.go.kr/6260000/FestivalService/getFestivalKr?serviceKey=NF4PcvbcGdvV5LBAJYPe6rHR%2FtWrtagpUSWWF42i%2FIukW2Dk0oifS%2BCfubThpV%2B8m7aSfGT8ymPr8azMqhyC2Q%3D%3D&pageNo=1&numOfRows=20&resultType=json'
	fetch(url)
	.then(resp => resp.json())
	.then(json => {	
		const arr = json.getFestivalKr.item
		console.log(arr)
		
		const root = document.getElementById('root')
		
		arr.forEach(dto => {
			const item = document.createElement('div')
			item.className = 'item'
			
			const detail = document.createElement('div')
			detail.className = 'detail'
			
			for(let key in dto) {
				const div = document.createElement('div')
				div.className = key
				div.innerText = dto[key]
					if(key == 'MAIN_TITLE') {
						console.log(div.innerText.split('(', 1))
						div.innerText = div.innerText.split('(', 1)
						item.appendChild(div)
					}
					else {
						detail.appendChild(div)
					}
			}

			const imgMain = detail.querySelector('.MAIN_IMG_NORMAL')
			imgMain.style.backgroundImage = 'url('+ imgMain.innerText +')'
			imgMain.innerText = ''
			
 			root.appendChild(item)
			item.appendChild(detail)
		})
	const items = Array.from(document.querySelectorAll('.item > .MAIN_TITLE')) 
	const contentList = Array.from(document.querySelectorAll('.item > .detail'))
	console.log(items)
	console.log(contentList)
	
	function handler(event) {
		console.log(event.target)
		const i = items.indexOf(event.target)
		console.log(i)
		
		const content = contentList[i]
		console.log(content)
		
		contentList.forEach(e => e.classList.remove('selected'))
		
		content.classList.add('selected')							
	}
	
	items.forEach(e => e.onclick = handler)
	})
		
</script>

</body>
</html>