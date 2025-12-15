<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String cookieName = request.getParameter("cookieName");
	String cookieValue = request.getParameter("cookieValue");
	
	//js	document.cookie
	//jsp	쿠키생성
	Cookie cookie= new Cookie(cookieName, URLEncoder.encode(cookieValue,"UTF-8"));
	cookie.setMaxAge(-1); //음수, 브라우저 닫으면 쿠키 자동 삭제
	
	response.addCookie(cookie);
	
	String location="ex09_03.jsp";
	response.sendRedirect(location);
%>