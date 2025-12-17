<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 4:45:52</title>
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
  	ex06_10
  	날짜 -> 문자열 형식의 날짜변환 fmt:formatDate
  	문자열 날짜 -> 날짜 변환		fmt:parseDate
  </xmp>
  <%
  	String strNow = "2025년 12월 17일";
  %>
  <fmt:parseDate var="now" value="<%=strNow %>" pattern="yyyy년 MM월 dd일"></fmt:parseDate>
  now = ${now }
  <hr />
  <li><fmt:formatDate value="${now}"/></li>
  <li><fmt:formatDate value="${now}" type="date"/></li>
  <li><fmt:formatDate value="${now}" type="time"/></li>
  <li><fmt:formatDate value="${now}" type="both"/></li>
  
  <li><fmt:formatDate value="${now}" pattern="yyyy년 MM. dd a h:mm"/></li>
  
</div>

<script>
  
</script>

</body>
</html>