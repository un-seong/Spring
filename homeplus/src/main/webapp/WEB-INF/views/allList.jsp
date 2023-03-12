<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="leftimg"><img src="${cpath }/resources/왼쪽 귀찮아서.png" width="300px"></div>

<center>
	<c:forEach var="list" items="${list }">
	<div class="items">
		<div><a href="${cpath }/detail/${list.idx }"><img src="${cpath }/upload/${list.thumbNail }" width="200px"></a></div>
		<div>${list.productName }</div>
		<div>${list.price } 원</div>
		<div>${list.score }</div>
	</div>
	</c:forEach>
</center>


</body>
</html>