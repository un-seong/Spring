<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
<form method="POST">
	<p><input type="number" name="emp_idx" placeholder="직원번호" min="0" max="999" step="1" required></p>
	<p><input type="text" name="emp_name" placeholder="이름" required></p>
	<p><input type="text" name="emp_phone" placeholder="전화번호" required></p>
	<span class="phoneM"></span>
	<p><input type="text" name="emp_position" placeholder="직급" required></p>
	<p><input type="text" name="emp_email" placeholder="이메일" required></p>
	<span class="emailM"></span>
	<p><input type="submit" value="등록하기" placeholder="이름" required></p>
	
</form>


<script>
	const emp_phone = document.querySelector('input[name="emp_phone"]')
	const phoneM = document.querySelector('span.phoneM')
	
	
	emp_phone.onkeyup = function(event) {
	    const value = event.target.value   
	    const exp = /^[0-9]{11}$/       
	    console.log(value.match(exp))      
	
	    if(value.match(exp) == null) {
	    	phoneM.innerText = '번호만 입력해주세요'
	    	phoneM.style.color = 'red'
	    }
	
	    else {
	    	phoneM.innerText = '사용가능합니다.'
	    	phoneM.style.color = 'blue'
	    }
	}

</script>


<script>
	const emp_email = document.querySelector('input[name="emp_email"]')
	const emailM = document.querySelector('span.emailM')
	
	
	emp_email.onkeyup = function(event) {
	    const value = event.target.value   
	    const exp = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/       
	    console.log(value.match(exp))      
	
	    if(value.match(exp) == null) {
	    	emailM.innerText = '올바른 이메일 형식을 입력해주세요'
	    	emailM.style.color = 'red'
	    }
	
	    else {
	    	emailM.innerText = '사용가능합니다.'
	    	emailM.style.color = 'blue'
	    }
	}

</script>

</body>
</html>