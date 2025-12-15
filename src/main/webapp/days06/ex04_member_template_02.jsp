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
<title>2025. 12. 15. 오전 11:35:52</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
        <%@ include file="/layout/top.jsp" %>
<div>
  <xmp class="code"> 
    ex04_member_template_02.jsp
    	include 지시자를 사용해서 페이지 모듈화
  </xmp>
  
  <table>
    <tr height="500px">
      <td>
        <%@ include file="/days06/layout/left.jsp" %>
      </td>
      <td>
        회원 관리와 관련된 CONTENT<br>
        회원 관리와 관련된 CONTENT<br>
        회원 관리와 관련된 CONTENT<br>
        회원 관리와 관련된 CONTENT<br>
        회원 관리와 관련된 CONTENT<br>
        회원 관리와 관련된 CONTENT<br>
      </td>
      <td>
        <%@ include file="/days06/layout/right.jsp" %>
      </td>
    </tr>
  </table>
</div>

<script>
  
</script>

</body>
        <%@ include file="/layout/bottom.jsp" %>
</html>