<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오전 11:38:24</title>
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
  </xmp>
  <%
  	String pName = request.getParameter("name");
  	String pGender = request.getParameter("gender");
  	
  %>
  > 이름(EL) : ${param.name }<br>
  > 이름 : <%=pName %> <br />
  
  > 성별 : <%=pGender.equals("m")?"남자":"여자" %> <br />
  <%
  	String petArr[] = request.getParameterValues("pet");
  %>
  > 좋아하는 동물 : <%= Arrays.toString(petArr) %> <br />
  
  <hr />
  <%
  	Enumeration<String> en =request.getParameterNames();
  	while(en.hasMoreElements()){
  		String paramName= en.nextElement();
  	
  %>
  > 파라미터 명 : <%=paramName %><br>
  <%
  	}
  %>
</div>


<script>

</script>

</body>
</html>