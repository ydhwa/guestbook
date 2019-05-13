<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cafe24.guestbook.dao.GuestbookDao" %>
<%@ page import="com.cafe24.guestbook.vo.GuestbookVo" %>
<%
	String no = request.getParameter("no");
	String password = request.getParameter("password");
	
	GuestbookVo vo = new GuestbookVo();
	vo.setNo(Long.parseLong(no));
	vo.setPassword(password);
	
	new GuestbookDao().delete(vo);
	response.sendRedirect("/guestbook");
%>