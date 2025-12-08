<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//JSP 스크립트 3가지 중 [스크립트릿] 123p
	//http://localhost/jspPro/days01/ex02_ok.jsp?title=asd&author=sad&age=123		
	//jsp 기본 제공 객체 : [request 객체]
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	int age = Integer.parseInt(request.getParameter("age"));
	
	System.out.printf("> title:%s, author:%s, age:%d\n",title,author,age);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오전 10:04:34</title>
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
  <xmp class="code"> 
  	ex02.ok
  	<%-- jsp주석처리 ctrl+shift+/ --%>
  </xmp>
  <!-- JSP 스크립트 3가지중 [표현식]  125p -->
  > 책 제목 : <%=title %><br>
  > 저자 : <%=author %><br>
  > 나이 : <%=age %><br>
  <hr />
  <!-- JSP 내장 기본객체 : [out] 175p -->
  > 책 제목 : <%out.print(title); %><br>
  > 저자 : <%out.append(author); %><br>
  > 나이 : <%out.print(age); %><br>
  
  <br>
  <br>
  
  <a href="javascript:history.go(-1)">뒤로가기(history)</a><br /><br />
  <a href="ex02.jsp">뒤로가기(jsp)</a>
</div>

<script>
  let title='<%=title %>';
  let author='<%=author %>';
  let age='<%=age %>';
  alert(`   > 책 제목 :\${title}\n
  > 저자 : \${author}\n
  > 나이 : \${age}`);
</script>

</body>
</html>