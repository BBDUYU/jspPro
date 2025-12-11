<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 11. 오전 11:07:03</title>
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
  	ex03_02_02
  	dom
  </xmp>
  <%
  	String name = request.getParameter("name");
  	String age = request.getParameter("age");

  %>
  <form action="ex03_03.jsp">
  	address : <input type="text" name="address" value="서울"/> <br />
  	tel : <input type="text" name="tel" value="010"/> <br />

  	
  	<input type="button" value="Prev" onclick="history.back();"/>
  	<input type="submit" value="Next"/>
  </form>
</div>

<script>
	let hiddenElement;
	<%
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String paramName = en.nextElement();
			String paramValue = request.getParameter(paramName);
	%>
	hiddenElement=`<input type="hidden" name="<%=paramName%>" value="<%=paramValue%>" >`
		$("form").append(hiddenElement);
	
	<%
		}
	%>  
</script>

</body>
</html>