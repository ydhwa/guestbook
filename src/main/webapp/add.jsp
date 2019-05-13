<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cafe24.guestbook.dao.GuestbookDao" %>
<%@ page import="com.cafe24.guestbook.vo.GuestbookVo" %>
<%
	request.setCharacterEncoding("utf-8");

	// 웹 통신은 전부 String 타입으로 옴
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String contents = request.getParameter("contents");
	
	GuestbookVo vo = new GuestbookVo();
	vo.setName(name);
	vo.setPassword(password);
	vo.setContents(contents);
	
	new GuestbookDao().insert(vo);
	response.sendRedirect("/guestbook");
%>