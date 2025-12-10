<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pError = request.getParameter("error"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오후 12:14:56</title>
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
  	로그인 페이지
  		ㄴ 어떤경우에는 로그인을 실패하고 오는경우
  	아이디
  	비밀번호
  	[로그인] -> ex06_ok.jsp
  				ㄴ 인증작업
  					ㄴ 성공 -> ex06_main.jsp
  					ㄴ 실패 -> ex06.jsp
  </xmp>
    <form action="ex06_ok.jsp" method="get">
    아이디 : <input type="text" name="id" value="admin"> <br>
    비밀번호 :  <input type="password" name="passwd" value="1234"> <br>
    <input type="submit"> 
    <input type="reset"> 
    <br />
    <span>
    	
    </span>
  </form>
</div>

<script>
  <%
  	if(pError != null&&pError.equals("1001")){
  		%>
  		alert("로그인 실패 - 아이디가 존재하지 않음");
  	<%}else if(pError != null&&pError.equals("1002")){%>
  		alert("로그인 실패 - 비밀번호 오류");
  	<%}%>
  
</script>

</body>
</html>