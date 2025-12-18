<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 18. 오후 12:26:50</title>
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
  	ex03
  	
  	AJAX
  	- 서버와 데이터를 교환하는 기능
  	- 웹 페이지 전체를 새로 고침하지 않음
  	- Asynchronous Javascript And Xml
  	
  	- js ajax 처리순서(과정)
  		(1) 웹 페이지에서 js 이벤트 발생
  		(2) XMLHttpRequest 객체 생성
  		(3) XMLHttpRequest 객체 + 설정
  			open()
  		(4) 비동기적으로 요청
  			send() -> callback 함수 호출 (응답 데이터 처리)
  		     
  		   	A) get 방식
              XMLHttpRequest객체.open("GET", "/test.jsp?id=admin", true);
              XMLHttpRequest객체.send();
     		B) post 방식
              XMLHttpRequest객체.open("POST", "/test.jsp", true);
              XMLHttpRequest객체.send("id=admin");
              
              ㄴ. XMLHttpRequest 객체 - on readystatechange 이벤트 속성  
               if( state = 200 + readState == 4 ) 
                   // 응답 데이터
                   1) 텍스트(JSON) - responseText 속성
                   2) xml          - responseXML 속성   
         
         ex04.jsp
         ex04_02.jsp
         ex04_ajax_info.txt
                   
  	- jquery ajax method
  	- fetch api
  	
  </xmp>
  
</div>

<script>
  
</script>

</body>
</html>