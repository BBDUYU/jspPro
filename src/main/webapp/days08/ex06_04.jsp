<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="days06.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 3:21:34</title>
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
  	//EL 에서 사용하려면 p,r,s,a 저장
  	String name="admin";
  	/* request.setAttribute("name", name);
  	session.setAttribute("name", name); */
  %>
  <c:set var="name1" value="<%=name %>"></c:set>
  > name : ${name1 } <br />
  
  <hr />
  <%
  	MemberInfo mi = new MemberInfo();
  	mi.setId("admin");
  	mi.setName("관리자");
  %>
  <c:set var="m" value="<%=mi %>">
  	
  </c:set>
  
  > id : <%=mi.getId() %> <br />
  > name : ${m.name } <br />
  <c:set target="${m}" property="email" value="admin@naver.com">
  </c:set>
  > email : ${m.email } <br />
  
  <hr />
  <%
  	Map<String,String> map = new HashMap<>();
  	map.put("id","admin");
  	map.put("password","1234");
  %>
  > id = <%=map.get("id") %> <br />
  <c:set var="map" value="<%=map %>"></c:set>
  > pwd = ${map.password }
  
</div>

<script>
  
</script>

</body>
</html>