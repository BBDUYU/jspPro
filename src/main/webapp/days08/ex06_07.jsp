<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 4:13:37</title>
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
  	1. 배열
  	2. Map
  </xmp>
  
  <%
      Map<String, String> map = new HashMap<>();
      map.put("id","admin");
      map.put("name","홍길동");
      map.put("age","20");
  %>
  
  <c:forEach items="<%=map %>" var="entry">
  	<li>${entry.key } : ${entry.value }</li>
  
  </c:forEach>
  
  <hr />
  
  <%
  	int m[] ={3,5,2,4,1};
  	request.setAttribute("m", m);
  %>
  <c:forEach items="${m }" var="i">
  	<li>${i }</li>
  </c:forEach>
</div>

<script>
  
</script>

</body>
</html>