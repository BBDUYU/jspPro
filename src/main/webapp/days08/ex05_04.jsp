<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 2:04:26</title>
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
  	ex05_04
  	
  	EL 연산자
  	산술 + - * / (div) %(mod)
  	비교 == (eq) != (!eq)  <(lt) >(gt) <=(le) >=(ge)
  	논리 && || !
  	empty 연산자
  		ㄴ empty Map
  		ㄴ empty Collection
  		ㄴ empty 배열
  		그외는 false
  		
    삼항 연산자 ? :
    [문자열 연결 연산자]
    
    세미콜론 연산자
    
    EL <%-- ${표현식 } --%>
    js 벡틱연산자 <%-- ${변수명 } --%>
  </xmp>
  
  1		-	${x = 10 } <br />
  2		-	${x } <br />
  
  ${1+1;10+10 } <br />
  <hr />
  <%
  	String title="jsp 2.3";
  	request.setAttribute("title",title);
  	
  %>
  제목 : ${title} <br />
  ${"제목 : "+= title } <br />
  
  <hr />
  ${empty null } <br />
  ${empty "" } <br />
  ${empty 0 } <br />
  <hr />
  ${ture && false } / ${true and false } <br />
  <hr />
  ${"abc"=="abc" } <br />
  <hr />
  ${100==10 } / ${100 eq 10 } <br />
  ${100!=10 } / <%-- ${100 ne 10 } --%> <br />
  ${100>10 } / ${100 gt 10 } <br />
  ${100>10 } / ${100 lt 10 } <br />
  <hr />
  ${10+3 } <br />
  ${10-3 } <br />
  ${10*3 } <br />
  ${10/3 } <%-- == ${10 div 3 } --%><br />
  ${10%3 } == ${10 mod 3 }<br />
  <hr />
  ${"10"+1 } <br />
  <%-- ${"팔"+1 } --%> <br />
  ${null+1 } <br />
  
</div>

<script>
  
</script>

</body>
</html>