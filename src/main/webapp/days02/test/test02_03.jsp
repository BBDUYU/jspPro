<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 9. 오전 11:28:29</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/webPro/images/SiSt.ico">
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
  <xmp class="code"> </xmp>
  <p id="demo">
  <ul>
  <%
  	String empnoArr[]=request.getParameterValues("empno");
  	for(int i=0;i<empnoArr.length;i++){
  		String empno = empnoArr[i];
  		%><li><%=empno %></li><%
  	}
  %>
  </ul>
  
  </p>
  <a href="test02.jsp">HOME</a>
</div>

<script>
  
</script>

</body>
</html>