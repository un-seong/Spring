<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
<style>

	.item {
		margin: 5px 0px;
	}
	
</style>
</head>
<body>

<!-- <h1>ex03 - CORS 정책에 의해 자바스크립트에서 호출할 수 없을 경우</h1> -->
<!-- <hr> -->

<!-- <div id="root"> -->
<!-- 	<div> -->
<!-- 		<div>날짜</div> -->
<!-- 		<div>온도</div> -->
<!-- 	</div> -->
<!-- 	<div id="items"></div> -->
	
<!-- </div> -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<h1>23_chart - 간단 데이터 차트로 나타내기</h1>
    <hr>

    <div id="root">
        <canvas id="myChart"></canvas>
    </div>


<script>
	// 실제로는 fetch 호출이 가능하지만, 연습을 위해 CORS로 막혔다고 가정하고 진행
// 	const url = 'https://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=NF4PcvbcGdvV5LBAJYPe6rHR%2FtWrtagpUSWWF42i%2FIukW2Dk0oifS%2BCfubThpV%2B8m7aSfGT8ymPr8azMqhyC2Q%3D%3D&pageNo=1&numOfRows=10&dataType=JSON&regId=11H20201&tmFc=202301270600'
// 	const url = '${cpath}/getMidFcst'
// 	fetch(url)
// 	.then(resp => resp.json())
// 	.then(json => {
// 		const data = json.response.body.items.item[0]
// 		for(let key in data) {
// 			if(key.includes('High') || key.includes('Low')) {
// 				delete data[key]
// 			}
// 		}
// 		console.log(data)
		
// 		const item = document.createElement('div')
// 		item.className = 'item'
		
// 		for(let key in data) {
// 			const div = document.createElement('div')
// 			console.log(key)
// 			console.log(data[key])
// 			div.className = key
// 			const bar = document.createElement('div')
// 			const bar1 = document.createElement('div')
// 			div.style.display = 'flex'
// 			bar.style.height = 20 + 'px'
// 			bar1.style.height = 20 + 'px'
						
// 			if(key.includes('Min')) {
// 				if(data[key] < 0) {
// 					bar.style.width = data[key] * -10 + 'px'
// 					bar.style.backgroundColor = 'blue'					
// 				}
// 				else {
// 					bar1.style.width = data[key] * 10 + 'px'
// 					bar1.style.backgroundColor = 'blue'
// 				}
// 			}
// 			else {
// 				bar1.style.width = data[key]* 10 +'px'
// 				bar1.style.backgroundColor = 'red'	
// 			}
			
// 			div.innerText = key + ' : '
// 			bar.className = 'bar'
// 			bar1.className = 'bar1'
			
// 			const temperature = document.createElement('span')
// 			temperature.innerText = data[key] + "도"
// 			temperature.className = 'temperature'
// 			div.appendChild(bar)
// 			div.appendChild(bar1)
// 			div.appendChild(temperature)
// 			item.appendChild(div)	
// 		}
// 		root.appendChild(item)
// 	})
</script>

<script>
// const url = '${cpath}/getMidFcst'
// 	fetch(url)
// 	.then(resp => resp.json())
// 	.then(json => {
// 		const data = json.response.body.items.item[0]
// 		for(let key in data) {
// 			if(key.includes('High') || key.includes('Low')) {
// 				delete data[key]
// 			}
// 		}
// 		console.log(data)
		
	
// 		for(let key in data) {
// 			console.log(data[key])
// 		}
		
// 		let min = []
// 		for(let key in data) {
// 			if(key.includes('Min')) {
// 				min.push(data[key])
// 			}
// 		}
// 		console.log(min)
		
// 		let max = []
// 		for(let key in data) {
// 			if(key.includes('Max')) {
// 				max.push(data[key])
// 			}
// 		}
// 		console.log(max)
		
// 		for(let i = 0; i < max.length; i++) {
// 			const item = document.createElement('div')
// 			item.className = 'item'
			
// 			const div = document.createElement('div')
// 			const div1 = document.createElement('div')
// 			div1.className = 'day'
// 			div1.innerText = '날짜'
			
// 			div.className = 'temp'
// 			console.log(min[i] + '~' + max[i])
// 			div.innerText = min[i] + ' ~ ' + max[i]
			
// 			item.appendChild(div1)
// 			item.appendChild(div)
// 			items.appendChild(item)
// 		}
		
// 	})

</script>


<script>

	// 1) context 객체 생성
	const context = document.getElementById('myChart').getContext('2d')
	
	const url = '${cpath}/getMidFcst'
	fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const data = json.response.body.items.item[0]
		for(let key in data) {
			if(key.includes('High') || key.includes('Low')) {
				delete data[key]
			}
		}
		console.log(data)
		
		const arr = []
		const date = new Date()
				
		
		for(let i = 3; i<11; i++) {
			const d = new Date(date.getFullYear(), date.getMonth(), date.getDate() + i)
			arr.push({
				index: i,
				label: getYYYYMMDD(d),
				taMin: data['taMin'+i],
				taMax: data['taMax'+i],
			})
		}
		
		function getYYYYMMDD(date) {
			const yyyy = date.getFullYear()
			let mm = date.getMonth() + 1
			let dd = date.getDate()
			
			mm = mm < 10 ? '0' + mm : mm
			dd = dd < 10 ? '0' + dd : dd
			
			const ret = yyyy +'-' + mm + '-' +dd
			return ret
		}
		
		console.log(arr)	
		
		// 1) context 객체 생성
        const context = document.getElementById('myChart').getContext('2d')

      
        // 2) labels -> data -> config -> chart
        const labels = arr.map(e => e.label)

        const data1 = {
            labels : labels,
            datasets: [
                {
                    label: '최저온도',
                    data: arr.map(e => e.taMin)
                },
                {
                    label: '최고온도',
                    data: arr.map(e => e.taMax)
                }
            ]
        }

        const config = {
            type: 'bar',
            data: data1,
            options: {}
        }

        const myChart = new Chart(context, config)		
		})
	
	
</script>



</body>
</html>