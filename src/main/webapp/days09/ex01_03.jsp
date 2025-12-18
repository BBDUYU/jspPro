<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- 
필터   com.filter.CharacterEncodingFilter

<%
   request.setCharacterEncoding("UTF-8");
%> 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 18. 오전 9:21:40</title>
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
  	ex01_03
  </xmp>
  <%
  	String name = request.getParameter("name");
  	String age = request.getParameter("age");
  %>
  표현식
  <hr />
  전달된 이름 : <%=name %> <br />
  전달된 나이 : <%=age %> <br />
  <br />
  <hr />
  EL
  <hr />
  전달된 이름 :${param.name } <br />
  전달된 나이 :${param.age } <br />
  <br />
  <hr />
 
  
</div>

<script>
  
</script>

</body>
</html>