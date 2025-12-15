<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오전 10:27:06</title>
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
  	ex02_03
  		[응답 상태 코드]
  		404 : 요청 URL을 처리하기 위한 자원 존재 X
        500 : 서버 내부 에러 ( 자바 코딩 X )
        200 : 요청을 정상적으로 처리
        401 : 접근 허용 X
        403 : get/post 요청 방식,   PUT 요청 X
        400 : 클라이언트의 요청이 잘못된 구문으로 구성.
  		
  		응답 코드별로 에러 페이지를 지정해서 처리
  		web.xml 설정 추가
  		
  	[ 예외타입별로 에러 페이지 지정 ]
  	1. page 지시자 errorPage 속성지정 -> 에러페이지 보여주기
  	2. web.xml error-code 404/500 ->		//
  	3. web.xml exception-type -> 		//
  	4. 아무것도 해당되지않는 경우에은 톰캣이 제공하는 기본 에러페이지
  </xmp>
  <br /><br />
  <a href="ex1000.jsp">ex1000</a>
</div>

<script>
  
</script>

</body>
</html>