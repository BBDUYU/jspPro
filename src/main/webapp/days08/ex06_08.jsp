<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 4:29:06</title>
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
  	ex06_08
  	JSTL이 제공하는 EL 함수
  </xmp>
  <%
  	String message = "<h3>Hello World</h3>";
  %>
  <c:set var="msg" value="<%=message %>"></c:set>
  <li>${msg }</li>
  <li>${fn:escapeXml (msg) }</li>
  <li>${fn:length(msg) }</li>
  <li>${fn:toUpperCase(msg) }</li>
  <li>${fn:contains(msg,"llo") }</li>
  <li>${fn:substring(msg,1,4) }</li>
</div>

<script>
  
</script>

</body>
</html>