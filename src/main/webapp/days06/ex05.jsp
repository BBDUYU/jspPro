<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 12:26:53</title>
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
  	[ JSP 기본 내장 객체 정리 ]
  	1. request - HttpServeltRequest : 클라이언트의 요청정보를 저장
  	2. response - HttpServletResponse : 응답정보를 저장
  	3. pageContext - PageContext : JSP 페이지에 대한 정보저장
  	4. session - HttpSession : HTTP 세션정보 저장
  	5. application - ServletContext : 웹 어플리케이션 정보 저장
  	6. out - JspWriter : JSP페이지가 생성하는 결과를 출력할때 사용하는 출력 스트림
  	7. config - ServeltConfig : JSP 페이지에 대한 설정정보 저장
  	8. page - Object : JSP 페이지를 구현한 자바 클래스 인스턴스
  	9. exception : 익셉션 객체, 에러페이지에서만 사용
  </xmp>
  
</div>

<script>
  
</script>

</body>
</html>