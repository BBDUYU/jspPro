<%@page import="java.util.Date"%>
<%@page import="days06.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 3:17:33</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">CHacha's Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
  ex08_05.jsp
  </xmp>
  
  <jsp:useBean id="mi" class="days06.MemberInfo" scope="page"></jsp:useBean>
  <jsp:setProperty property="*" name="mi"/>
  <jsp:setProperty property="registerDate" name="mi" value="<%= new Date() %>"/>
  
  
  아이디 : <jsp:getProperty property="id" name="mi"/><br>
  이름 : <jsp:getProperty property="name" name="mi"/><br>
  비밀번호 : <%= mi.getPasswd() %><br>
  이메일 : <%= mi.getEmail() %><br>
  등록일 : <%= mi.getRegisterDate() %><br>
  
  <%-- 
  아이디 : <%= id %><br>
  이름 : <%= name %><br>
  비밀번호 : <%= passwd %><br>
  이메일 : <%= email %><br>
   --%>
</div>

<script>
  
</script>

</body>
</html>