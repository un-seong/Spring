<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dto }" />



<div class="detailtop">	
		<div><img src="${cpath }/upload/${dto.thumbNail}" width="500px;"></div>
		<div class="detailMenu">
			<div class="detailProductName">${dto.productName }</div>
			<div class="detailPrice">
				<div class="priceTitle">판매가</div>
				<div class="price">${dto.price }</div>원
			</div>
			<div class="detailScore">${dto.score }</div>
			<div class="detailButton"><a href="${cpath }/update/${dto.idx}"><button>수정하기(사진포함)</button></a></div>
			<div class="detailButton"><a href="${cpath }/updatesome/${dto.idx}"><button>수정(사진미포함)</button></a></div>
			<div class="detailButton"><a href="${cpath }/delete/${dto.idx}"><button>삭제</button></a></div>
		</div>
</div>

<div class="item">
	<div><img src="${cpath }/upload/${dto.reviewImage }" width="200px"></div>
</div>

</body>
</html>