function jsonToHTML(json) {
	const tag = `
	<div id="item">
		<div class="idx">${json.idx}</div>
		<div class="category">${json.category}</div>
		<div class="productName">${json.productName}</div>
		<div class="price">${json.price}</div>
		<div class="score">${json.score}</div>
		<div class="registDate">${dateFormat(json.registDate)}</div>
	</div>	
	`
	return tag
}

function dateFormat(date) {
	const d = new Date(date)
	
	const yyyy = d.getFullYear()
	let mm = d.getMonth() +1
	let dd = d.getDate()
	mm = mm < 10 ? '0' + mm : mm
	dd = dd < 10 ? '0' + dd : dd
	
	
	console.log(yyyy, mm, dd)
	return `${yyyy}-${mm}-${dd}`
	
}
