<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<a href="${cpath }/add">직원 정보 등록</a>

<div><button onclick="location.href='${cpath}/download'">csv다운로드</button></div>

<table>
	<tr>
		<th>직원번호</th>
		<th>직급</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="dto" items="${dto}">
	<tr>
		<td>${dto.emp_idx }</td>
		<td>${dto.emp_position }</td>
		<td>${dto.emp_name }</td>
		<td>${dto.emp_phone }</td>
		<td>${dto.emp_email }</td>
		<td><a href="${cpath }/modify/${dto.emp_idx}"><button>수정</button></a></td>
		<td><a href="${cpath }/delete/${dto.emp_idx}"><button>삭제</button></a></td>
	</tr>
	</c:forEach>
</table>

    <div class="search">
         <form method="GET" action="${cpath }/search">
         		<select class="select" onchange="selectNum()">
         			<option>--------</option>
         			<option value="emp_idx">직원번호</option>
         			<option value="emp_name">이름</option>
         			<option value="emp_phone">전화번호</option>
         			<option value="emp_position">직급</option>
         			<option value="emp_email">이메일 주소</option>
         		</select>
               <input class="input" type="text" placeholder="검색할 항목을 입력하세요"/>
               <input type="submit" value="검색"/>
         </form>
      </div>


      <script>
        function selectNum(){
            const select = document.querySelector('.select')
            const option = Array.from(select.querySelectorAll('option'))
            option.map(e => e.removeAttribute('selected'))

            const value = select.options[document.querySelector('.select').selectedIndex].value

            const input = document.querySelector('.input')
            
            input.setAttribute("name", value)
            option.map(e => e.value == value)

            const result = option.filter(e => (e.value == value) == true)
            result[0].setAttribute('selected', '')
            
            const input1 = document.querySelector('.input1')

        }
      </script>




</body>
</html>