<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<details>
	<summary>member5 테이블 SQL</summary>
	<fieldset>
		<pre>
			create sequence member5_seq
			    start with 1
			    maxvalue 99999999
			    increment by 1
			    nocache
			    nocycle;
			
			
			create table member5 (
			    idx         number      default member5_seq.nextval primary key,
			    userid      varchar2(100)   unique not null,
			    userpw      varchar2(155)   not null,
			    username    varchar2(100)   not null,
			    birth       date            not null,
			    gender      varchar2(20)    check(gender in ('남성', '여성'))
			);
		</pre>
	</fieldset>
</details>

<ul>
	<li><a href="${cpath }/allList">멤버 전체 조회</a></li>

</ul>
</body>
</html>