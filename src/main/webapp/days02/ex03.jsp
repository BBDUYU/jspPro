<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 9. 오후 12:20:58</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Zerozhu HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   context path
  </xmp>
  
  <!-- 상대 경로 (쓰지마라) -->
  <img alt="" src="../images/img_chania.jpg">
  <!-- 절대 경로 (쓰지마라) -->
  <img alt="" src="http://localhost/jspPro/images/img_chania.jpg">
  
  <!-- context path 사용해서 이미지 등등 경로 -->
  <%
     String contextPath = request.getContextPath();
     System.out.printf("contextPath : %s\n", contextPath);
  %>
  <img alt="" src="<%= contextPath %>/images/img_chania.jpg">
  <!-- EL로 context path 표현 -->
  <img alt="" src="${pageContext.request.contextPath}/images/img_chania.jpg">
  
</div>
<script>
</script>
</body>
</html>