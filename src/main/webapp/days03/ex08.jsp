<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오후 3:27:55</title>
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
  	MVC 패턴 구현
  	[서블릿 + jsp 페이지 응답]
  	서블릿 : DB 연동 로직 담당(Model)
  	jsp페이지 : 화면 출력 담당(View)
  	
  	1) /jspPro/scott/dept
  	2) ScottDept.java
  	   System.out.println("> ScottDept.doGet()...");
  	
  	3) /jspPro/scott/emp
  	4) ScottEmp.java
  	   ex08_emp.jsp - 해당부서사원테이블 출력
  </xmp>
  <a href="${pageContext.request.contextPath }/scott/dept">/jspPro/scott/dept</a> <br />
  <a href="${pageContext.request.contextPath }/scott/emp">/jspPro/scott/emp</a> <br />
</div>

<script>
  
</script>

</body>
</html>