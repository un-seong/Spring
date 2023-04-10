<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin: 0px;
		padding: 0px;
	}

	table {
		border-collapse: collapse;
	}
	th {
		background-color: black;
		color: white;
	}
	
	th, td {
		border: 1px solid black;
		padding: 5px 10px;
	}

</style>


</head>
<body>

<a href="${cpath }/"><h3>Employee_list</h3></a>
<hr>


