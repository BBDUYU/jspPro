<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오전 11:16:02</title>
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
  	ex02
  	jsp 스크립트
  	1)	스크립트릿 %
  	2)	표현식	%=
  	3)	선언문	%!
  </xmp>
<%
    String name = "홍길동";
    int age = 20;
  %>

  <% for(int i = 1; i <= 10; i++) { %>
    i = <%= i %><br>
  <% } %>

  <br>
  이름 : <%= name %><br>
  나이 : <%= age %><br>
  성별 : <%= gender ? "남자" : "여자" %><br>
  getMessage() 호출 : <%= getMessage("admin") %><br>

  <%! 
  	//jsp 스크립트중 선언문 - 변수, 메서드 선언
    boolean gender = true;
    public String getMessage(String msg) {
      return "안녕 - " + msg;
    }
  %>
</div>

<script>
  
</script>

</body>
</html>