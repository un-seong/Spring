<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<table>
	<tr>
		<th>기능 목록</th>
		<th>url</th>
		<th>method</th>
		<th>Controller</th>
		<th>Controller Method</th>
		<th>Service</th>
		<th>DAO</th>
		<th>forward</th>
		<th>redirect</th>
	</tr>

    <tr>
		<td>대문페이지</td>
		<td>/</td>
		<td>GET</td>
		<td>HomeController</td>
		<td>public void home()</td>
		<td></td>
		<td></td>
		<td>home.jsp</td>
		<td></td>
	</tr>

    <tr>
        <td>회원리스트</td>
        <td>/userlist</td>
        <td>GET</td>
        <td>MemberController</td>
        <td>public ModelAndView userlist() </td>
        <td></td>
        <td>select * from 테이블명 order by idx</td>
        <td>userlist.jsp</td>
        <td></td>
    </tr>

	<tr>
		<td>가입</td>
		<td>/signup</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public void signup()</td>
		<td></td>
		<td></td>
		<td>signup.jsp</td>
		<td></td>
	</tr>
	
    <tr>
		<td>가입</td>
		<td>/signup</td>
		<td>POST</td>
		<td>MemberController</td>
		<td>public ModelAndView signup(MemberDTO dto)</td>
		<td></td>
		<td>insert into Table명 values(....)</td>
		<td></td>
		<td>userlist.jsp</td>
	</tr>

    <tr>
		<td>로그인</td>
		<td>/login</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public void login()</td>
		<td></td>
		<td></td>
		<td>login.jsp</td>
		<td></td>
	</tr>

    <tr>
		<td>로그인</td>
		<td>/login</td>
		<td>POST</td>
		<td>MemberController</td>
		<td>public String signup(MemberDTO user, String url, HttpSession session)</td>
		<td></td>
		<td>select * from 테이블명 where userid=(userid) and userpw=(userpw)</td>
		<td></td>
		<td>redirect:+(url ==null ? "/" : url)</td>
	</tr>
	
	<tr>
		<td>로그아웃</td>
		<td>/logout</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public String logout(HttpSession session)</td>
		<td></td>
		<td></td>
		<td></td>
		<td>home.jsp</td>
	</tr>

    <tr>
		<td>마이페이지</td>
		<td>/mypage</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public String mypage()</td>
		<td></td>
		<td></td>
		<td>login.jsp</td>
		<td></td>
	</tr>
	
	<tr>
		<td>마이페이지</td>
		<td>/mypage/idx</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public ModelAndView mypage(@PathVariable("idx") int idx)</td>
		<td></td>
		<td></td>
		<td>mypage.jsp</td>
		<td></td>
	</tr>
	
	<tr>
		<td>수정</td>
		<td>/modify/idx</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public ModelAndView modify(@PathVariable("idx") int idx)</td>
		<td></td>
		<td></td>
		<td>modify.jsp</td>
		<td></td>
	</tr>
	
	<tr>
		<td>수정</td>
		<td>/modify/idx</td>
		<td>POST</td>
		<td>MemberController</td>
		<td>public String modify(MemberDTO dto, HttpSession session)</td>
		<td></td>
		<td></td>
		<td>userlist.jsp or home.jsp</td>
		<td></td>
	</tr>
	
    <tr>
		<td>회원탈퇴</td>
		<td>/withdrawal</td>
		<td>GET</td>
		<td>MemberController</td>
		<td>public String withdrawal()</td>
		<td></td>
		<td></td>
		<td>withdrawal.jsp</td>
		<td></td>
	</tr>

    <tr>
		<td>회원탈퇴</td>
		<td>/withdrawal</td>
		<td>POST</td>
		<td>MemberController</td>
		<td>public String withdrawal(@RequestParam HashMap(String, Object) result, String userpw, @PathVariable("idx") int idx, HttpSession session)</td>
		<td></td>
		<td>delete from 테이블명 where userid=(userid) and idx=(idx)</td>
		<td></td>
		<td>userlist.jsp or error</td>
	</tr>
</table>


<table>
	<tr>
		<th>기능 목록</th>
		<th>url</th>
		<th>method</th>
		<th>Controller</th>
		<th>Controller Method</th>
		<th>Service</th>
		<th>DAO</th>
		<th>forward</th>
		<th>redirect</th>
	</tr>

	<tr>
		<td>글목록</td>
		<td>/boardlist</td>
		<td>GET</td>
		<td>BoardController</td>
		<td>public ModelAndView boardlist()</td>
		<td></td>
		<td>select * from 테이블명</td>
		<td>boardlist.jsp</td>
		<td></td>
	</tr>
	
	<tr>
		<td>검색</td>
		<td>/boardlist</td>
		<td>POST</td>
		<td>BoardController</td>
		<td>public ModelAndView boardlist(String title)</td>
		<td></td>
		<td>select * from board where title like (title) order by idx</td>
		<td>boardlist.jsp</td>
		<td></td>
	</tr>

    <tr>
		<td>글쓰기</td>
		<td>/boardwrite</td>
		<td>GET</td>
		<td>BoardController</td>
		<td>public void boardwrite()</td>
		<td></td>
		<td></td>
		<td>boardwrite.jsp</td>
		<td></td>
	</tr>

    <tr>
		<td>글쓰기</td>
		<td>/boardwrite</td>
		<td>POST</td>
		<td>BoardController</td>
		<td>public String boardwrite(BoardDTO dto)</td>
		<td></td>
		<td>insert into 테이블명 values (dto...)</td>
		<td></td>
		<td>boardlist.jsp or boardwrite</td>
	</tr>

    <tr>
		<td>글읽기</td>
		<td>/boardsee/(idx)</td>
		<td>GET</td>
		<td>BoardController</td>
		<td>public ModelAndView boardsee(@PathVariable("idx") int idx)</td>
		<td></td>
		<td>select * from 테이블명 where idx={idx}</td>
		<td>boardsee.jsp</td>
		<td></td>
	</tr>

    <tr>
		<td>글수정</td>
		<td>/boardupdate/(idx)</td>
		<td>GET</td>
		<td>BoardController</td>
		<td>public ModelAndView boardupdate(@PathVariable("idx") int idx)</td>
		<td></td>
		<td>select * from 테이블명 where idx={idx}</td>
		<td>boardupdate.jsp</td>
		<td></td>
	</tr>

    <tr>
		<td>글수정</td>
		<td>/boardupdate/(idx)</td>
		<td>POST</td>
		<td>BoardController</td>
		<td>public String boardupdate(BoardDTO dto)</td>
		<td></td>
		<td>update set 입력된 값 where idx = {idx}</td>
		<td></td>
		<td>boardlist.jsp or boardsee/(idx)</td>
	</tr>

    <tr>
		<td>글삭제</td>
		<td>/boarddelete/(idx)</td>
		<td>GET</td>
		<td>BoardController</td>
		<td>public String boarddelete(@PathVariable("idx") int idx)</td>
		<td></td>
		<td></td>
		<td>boardlist.jsp</td>
		<td></td>
	</tr>
</table>
 
</body>
</html>