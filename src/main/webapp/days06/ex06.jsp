<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 2:06:05</title>
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
  	ex06
  	
  	모든 jsp페이지는 하나의 application객체를 공유
  	application 객체를 초기화할때 사용하는 설정 정보
  		ㄴ web.xml 파일
  			ㄴ context-param 태그를 사용해서 설정을 선언
  		ㄴ getInitParameter(name)
  		   en = getInitParameterNames()
  </xmp>
  <c:forEach items="${initParam }" var="entry">
  	paramName = ${entry.key },paramValue=${entry.value } <br />
  </c:forEach>
  <hr />
  <% Enumeration<String> en = application.getInitParameterNames(); //열거형
  	while(en.hasMoreElements()){
  		String paramName = en.nextElement();
  		String paramValue = application.getInitParameter(paramName);
  		%>
  		> paramName=<%=paramName %>, paramValue=<%=paramValue %>
  		<% 
  	}
  %>
  <hr />
  <%
  	String name = application.getInitParameter("user");
  %>
  > name = <%=name %> <br />
  
</div>

<script>
  
</script>

</body>
</html>