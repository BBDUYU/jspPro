<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오전 11:19:31</title>
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
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
  	페이지 모듈화와 요청 흐름제어
  	하나의 웹사이트를 구성하는 페이지
  		ㄴ 상단 - 전체 공통부분
  			ㄴ 주문
  				- 왼쪽	- 주문 공통부분
  				- 오른쪽 	- 주문 공통부분
  		ㄴ 하단 - 전체 공통부분
  			
  	- 공통 부분을 모듈화 - 중복제거, 생산성 향상, 유지보수
  					  확장성 용이
  					  
  	- <%-- <jsp:include> --%> 액션태그
  	- include 지시자
  	
  	예) 모든 페이지의 공통 부분
  		webapp
  			ㄴ layout 폴더
		  		ㄴ top.jsp
		  		ㄴ bottom.jsp
  	
  		ex04_member_template.jsp
  		ex04_member_template_02.jsp
  </xmp>
  
</div>

<script>
  
</script>

</body>
</html>