<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String cookieName = "auth";
String logonId = null;

Cookies cookies = new Cookies(request);

if (cookies.exists(cookieName)) {
	//쿠키 삭제 - 만료시점 0
	logonId = cookies.getCookieValue(cookieName);
	Cookie cookie = Cookies.createCookie("auth", "x", "/", 0);
	response.addCookie(cookie);
}
%>
<script>
	alert("<%=logonId%>님 로그아웃 하셨습니다");
	location.href = "ex04_default.jsp";
</script>