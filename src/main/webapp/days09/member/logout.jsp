<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String sessionName = "auth";
	String logonId = null;
	logonId=(String)session.getAttribute(sessionName);
	
	session.invalidate();
%>
<script>
	alert("<%=logonId%>님 로그아웃");
	location.href="/jspPro/days09/ex02.jsp";
	
</script>