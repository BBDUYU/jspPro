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
<title>2025. 12. 11. 오후 4:11:19</title>
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
  	view.jsp
  </xmp>
  <h2>글 내용 보기</h2>
  <table>
  	<tbody>
  		<tr>
  			<td>이름</td>
  			<td>${dto.writer }</td>
  			<td>등록일</td>
  			<td>${dto.writedate }</td>
  		</tr>
  		<tr>
  			<td>이메일</td>
  			<td>${dto.email }</td>
  			<td>조회수</td>
  			<td>${dto.readed }</td>
  		</tr>
  		<tr>
  			<td>제목</td>
  			<td colspan="3">${dto.title }</td>
  		</tr>
  		<tr>
  			<td>내용</td>
  			<td colspan="3" class="full" style="height:200px;vertical-align: top">${dto.content }</td>
  		</tr>
  	</tbody>
  	<tfoot>
  		<tr>
  			<td colspan="4" align="center">
  				<a href="<%=contextPath%>/cstvsboard/edit.htm?seq=${dto.seq}">수정</a>
  				<a href="<%=contextPath%>/cstvsboard/delete.htm?seq=${dto.seq}">삭제</a>
  				<a href="<%=contextPath%>/cstvsboard/list.htm">Home</a>
  			</td>
  		</tr>
  	</tfoot>
  </table>
</div>

<script>
  
</script>

</body>
</html>