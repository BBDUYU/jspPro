<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 12:07:45</title>
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
  	ex05_02
  </xmp>
  <%
  	String name = "admin";
  	//EL - jsp 4가지 영역에 존재하는 속성 사용
  	request.setAttribute("name", name);
  	int age=20;
  	session.setAttribute("age", age);
  %>
  <!-- 표현식 -->
  name : <%=name %> <br />
<%--   EL name : ${requestScope.name } <br />
  EL age : ${sessionScope.age } <br />
 --%>  
  EL name : ${name } <br />
  EL age : ${age } <br />
  <hr />
  code : <%=request.getParameter("code") %> <br />
  code : ${param.code} <br />
  
  
</div>

<script>
  
</script>

</body>
</html>