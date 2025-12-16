<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 11. 오후 2:50:34</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    MVC delete.jsp     
  </xmp> 
  
  <h2>삭제하기</h2>
  
  <form method="post">
    <table>
      <tr>
        <td colspan="2" align="center">
          <b>글을 삭제합니다.</b>
        </td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td>
         <input type="password" name="pwd" size="15" autofocus="autofocus">
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="삭제">
          &nbsp;&nbsp;
          <!-- <input type="button" value="취소" id="cancel" onclick="history.back();"> -->
          <input type="button" value="취소" id="cancel" onclick="location.href='view.do?seq=${param.seq}'">
        </td>
      </tr>
    </table>
  </form>
  
</div>
<script>
   // delete.htm?seq=157&delete=fail
   if('<%= request.getParameter("delete") %>' == 'fail'){
	   alert('<%= request.getParameter("seq") %>의 비밀번호가 틀립니다!!!');
   } // if		   
</script>  
</body>
</html>







