<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String cookieName = "auth";
String logonId  = null;

Cookies cookies = new Cookies(request);
logonId = cookies.getCookieValue(cookieName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 16. 오후 4:36:40</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Hanle Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> ex04_default </xmp>
		<c:choose>
			<c:when test="<%=logonId == null %>">
				<div id="logon">
					<form action="ex04_logon.jsp" method="get">
						아이디 : <input type="text" name="id" value="admin"> <br>
						비밀번호 : <input type="password" name="passwd" value="1234">
						<br> <input type="submit"> <input type="reset">
						<span style="color: red; display: none">로그인 실패했습니다.</span>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div id="logout">
					[<%=logonId %>]님 로그인하셨습니다.<br> <a href="ex04_logout.jsp">로그아웃</a>
				</div>
				<br />
				<br />
				<a href="ex04_board.jsp">게시판</a>				
			</c:otherwise>

		</c:choose>


	</div>

	<script>
	    if(${ param.logon  eq "fail" }){
	        $("#logon span")
	           .fadeIn()
	           .fadeOut(3000);
	     }
	</script>

</body>
</html>