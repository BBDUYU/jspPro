<%@page import="java.util.Date"%>
<%@page import="days06.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 3:17:49</title>
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
    ex08_04.jsp
  </xmp> 
  
  <%
       String id = request.getParameter("id");
       String name = request.getParameter("name");
       String password = request.getParameter("password");
       String email = request.getParameter("email");
       
       // jsp:userBean 액션 태그를 사용해서 수정...
       
  %>
  
  <jsp:useBean id="mi" class="days06.MemberInfo" scope="page"></jsp:useBean>
  <jsp:setProperty property="id" name="mi" value="<%= id %>"/>
  <jsp:setProperty property="name" name="mi" value="<%= name %>"/>
  <jsp:setProperty property="password" name="mi" value="<%= password %>"/>
  <jsp:setProperty property="email" name="mi" value="<%= email %>"/>
  <jsp:setProperty property="registerDate" name="mi" value="<%= new Date() %>"/>
  
  
  아이디 : <jsp:getProperty property="id" name="mi"><br>
  이름 : <jsp:getProperty property="name" name="mi"><br>
  비밀번호 : <%= mi.getPassword() %><br>  
  이메일 : <%= mi.getEmail() %><br>
  등록일 : <%= mi.getRegisterDate() %><br>
  
  
  <%-- 
  아이디 : <%= id %><br>
  이름 : <%= name %><br>
  비밀번호 : <%= password %><br>
  이메일 : <%= email %><br>
   --%>
</div>

<script>
  
</script>

</body>
</html>