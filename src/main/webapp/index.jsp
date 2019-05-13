<!-- Tomcat: JSP를 servlet으로 바꿔주는 일을 함
	 프로젝트 설정에서 target runtime을 tomcat으로 지정해주면 오류가 사라짐 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cafe24.guestbook.dao.GuestbookDao" %>
<%@ page import="com.cafe24.guestbook.vo.GuestbookVo" %>
<%
	GuestbookDao dao = new GuestbookDao();
	List<GuestbookVo> list = dao.getList();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook/add.jsp" method="get">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="contents" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	
	<table width=510 border=1>
	
	<%
		int count = 0;
		for(GuestbookVo vo: list) {
			count++;
	%>
	
	<br>
		<tr>
			<td>[<%= count %>]</td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><a href="/guestbook/deleteform.jsp?no=<%= vo.getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%= vo.getContents().replaceAll("\n", "<br>") %></td>
		</tr>
	
	<%
		}
	%>
	</table>
</body>
</html>