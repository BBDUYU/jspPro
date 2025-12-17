<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 3:34:55</title>
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
  ex06_05.jsp
  
  c:if
  c:choose
  c:forEach문
  </xmp>
<c:set var="sum" value="0"></c:set>
 <c:forEach begin="1" end="10" step="1" var="i" varStatus="is">
	<%-- ${i}<c:if test="${not is.last }">+</c:if> --%>
	${i+=(is.last?"":"+") }
	<!-- sum += i; -->
	<c:set var="sum" value="${sum+i }"></c:set>
</c:forEach>
=${sum }
<hr />
<%--   
  <c:forEach items="컬렉션, Map, 배열" var="변수">
  </c:forEach>
 --%>
 
 <!-- 1+2+3+4+....+9+10=55 -->
 <!-- varStatus 변수 i 상태 정보를 담고 있는 객체 -->
 <c:forEach begin="1" end="10" step="1" var="i" varStatus="is">
   ${ i } / ${ is.index } / ${ is.count } / ${ is.first } / ${is.last }<br>
 </c:forEach>
</div>

<script>
  
</script>

</body>
</html>