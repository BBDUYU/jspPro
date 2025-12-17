<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	//초
	session.setMaxInactiveInterval(50*60); //50분
%>
<%
   String contextPath = request.getContextPath();

   String sessionName = "auth";
   String logonId = (String)session.getAttribute(sessionName); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오전 9:02:20</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Hanle Home</a></h1>
  <ul>
  	<c:if test="${empty sessionScope.auth }">
	    <li><a href="<%=contextPath %>/days08/ex04_default.jsp">로그인</a></li>  	
  	</c:if>
  	<c:if test="${!empty sessionScope.auth }">
	    <li>[<%= logonId %>(EL:${ sessionScope.auth })]님 로그인하셨습니다.
	    <a href="<%=contextPath %>/days08/ex04_logout.jsp">로그아웃</a></li>  	
  	</c:if>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
	ex01
	1. 세션
		- 상태관리
		- 쿠키와 차이점 : 세션은 서버에 값을 저장
		- 로그인한 사용자 정보를 유지하기위한 목적 
		
	2. 세션 생성
		- session.setAttribute("이름","값");
		- session.getAttribute("이름","값");
		
		- getId() - 세션 고유 id
		- getCreationTime() - 세션 생성된 시간
		- getLastAccessedTime() - 세션
		
	3. 세션 종료
		- 자동종료
			ㄴ 현재브라우저닫음
		- 강제종료
			ㄴ session.invalidate()
				ㄴ 세션 기본객체를 삭제 + 저장된 값들도 모두 삭제
	
	4. 세션유효시간 : 20분
		ㄴ 최근 세션에 접근한 시간 + 20분 - 자동 세션 종료
		ㄴ 세션 유지시간을 설정하는 방법
	
	EL
	JSTL
	필터
	js Ajax  	
  </xmp>
  
</div>

<script>
  
</script>

</body>
</html>