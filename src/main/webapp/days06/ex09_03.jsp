<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 4:10:24</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div id="content">
  <xmp class="code">
   ex09_03.jsp
   모든 쿠키값을 출력
   수정, 삭제, 생성
  </xmp>
  
  <form action="">
     <%
        // 모든 쿠키값을 체크박스를 사용해서 출력
        Cookie [] cookieArr = request.getCookies();
        for( Cookie cookie : cookieArr){
           String cookieName = cookie.getName();
           String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
   %>
   <input type="checkbox" name= "ckbCookie" value="<%= cookieName %>">
   <%= cookieName %> - <%= cookieValue %>
   <br>
     <%
        } // for
     %>
  </form>
   <a href="ex09.jsp">쿠키 Home</a><br>
   <a href="ex09_02.jsp">쿠키 생성</a><br>
   
   수정, 삭제할 쿠키를 체크 한 후 쿠키 수정, 삭제 <br>
   
   <a href="ex09_04.jsp">쿠키 삭제</a><br>
   <a href="ex09_05.jsp">쿠키 수정</a><br>
   

</div>
<script>
// 삭제 a 링크
$("div a").eq(2).on("click", function(){
   event.preventDefault();
   let href = $(this).attr("href"); // "ex09_04.jsp"
   $("form")
      .attr("action", "ex09_04.jsp")
      .submit();
})
// 수정 a링크
$("div a").last().on("click", function(){
	 event.preventDefault();
	   let url = $(this).attr("href"); // "ex09_05.jsp"
	   $("form")
	      .attr("action", url)
	      .submit();
})

</script>

</body>
</html>