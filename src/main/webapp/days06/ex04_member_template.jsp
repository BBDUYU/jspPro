<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	String contextPath = request.getContextPath();
%> --%>
<%@include file="/WEB-INF/inc/include.jspf" %>
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
<jsp:include page="/layout/top.jsp" flush="false"></jsp:include>
<div>
  <xmp class="code"> 
    ex04_member_template.jsp
    	jsp:include 액션태그 - 페이지 모듈화
    	
    	top.jsp 등 : contextPath 변수 X
    		해결 : WEB-INF
    				ㄴ inc 폴더
    					ㄴ include.jspf
  </xmp>
  <table>
    <tr height="500px">
      <td>
        <jsp:include page="/days06/layout/left.jsp" flush="false"></jsp:include>
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
        <jsp:include page="/days06/layout/right.jsp" flush="false"></jsp:include>
      </td>
    </tr>
  </table>
</div>

<script>
  
</script>

</body>
<jsp:include page="/layout/bottom.jsp" flush="false">
	<jsp:param value="contextPath" name="cp"/>
</jsp:include>
</html>