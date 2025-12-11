<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	ArrayList<DeptVO> list=(ArrayList<DeptVO>)request.getAttribute("list");
	Iterator<DeptVO> ir = null;
	DeptVO vo = null;
	int deptno;
	String dname;
	String loc;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오후 3:44:57</title>
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
  	ex08_dept_jstl
  </xmp>
  <select id="deptno" name="deptno">
    <option>부서 선택...</option>   
    <!-- <option value="10">ACCOUNTING</option> -->
    <c:forEach items="${ list }" var="vo">
    	<option value="${ vo.deptno }">${ vo.dname }</option> 
    </c:forEach>
    
  </select>
</div>

<script>
$("#deptno").on("change",function(){
	  let deptno=$(this).val();
	  if(!isNaN(deptno)){
		  location.href=`${pageContext.request.contextPath }/scott/emp?deptno=\${deptno}`;
	  }
})
</script>

</body>
</html>