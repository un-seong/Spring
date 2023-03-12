<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="POST">
	<input type="text" name="name" value="${ob1.name }">
	<input type="number" name="kor" value="${ob1.kor }">
	<input type="number" name="eng" value="${ob1.eng }">
	<input type="number" name="mat" value="${ob1.mat }">
	<input type="submit">
</form>

</body>
</html>