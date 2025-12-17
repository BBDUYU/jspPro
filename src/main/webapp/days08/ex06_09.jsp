<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 17. 오후 4:36:51</title>
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
  	long price = 22345;
  	String strPrice2="12,345.98";
  	
  %>
  strPrice2=<%=strPrice2 %> <br />
  <fmt:parseNumber var="price2" value="<%=strPrice2 %>"
  pattern="00,000.00"></fmt:parseNumber>
  price2 = ${price2 } 
  <hr />
  price =<%=price %> <br />
  <fmt:formatNumber var="strPrice" value="<%=price %>" type="number" pattern="##,###.00"></fmt:formatNumber>
  strPrice = ${strPrice }
</div>

<script>
  
</script>

</body>
</html>