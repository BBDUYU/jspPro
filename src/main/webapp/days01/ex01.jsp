<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
   // 스크립트릿(Scriptlet)
   Date now = new Date();
   String pattern = "yyyy-MM-dd hh:mm:ss";
   SimpleDateFormat sdf = new SimpleDateFormat(pattern);
   String strNow = sdf.format(now);
   System.out.printf("> strNow : %s\n", strNow);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 4. 오후 4:42:28</title>
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
<div>
  <xmp class="code">
    ex01.jsp
  </xmp>
  <h3>ex01.jsp(동적 페이지) - <%= strNow %></h3>
  <h3>ex01.jsp(동적 페이지) - <% out.print(strNow); %></h3>
</div>
<script>
</script>  
</body>
</html>