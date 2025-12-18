<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 18. 오전 10:07:20</title>
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
    <!-- <li><a href="#">로그인</a></li> -->
    <c:choose>
    	<c:when test="${empty auth }">
    		<li><a href="${pageContext.request.contextPath }/days09/member/logon.jsp">로그인</a></li>
    	</c:when>
    	<c:otherwise>
    		<li>[${auth }]<a href="${pageContext.request.contextPath }/days09/member/logout.jsp">로그아웃</a></li>
    	</c:otherwise>
    </c:choose>
    <li><a href="${pageContext.request.contextPath }/days09/member/addmember.jsp">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
  	ex02
  	days09
  		ㄴ admin - 관리자 인증
  			ㄴ 회원관리페이지(membermanage.jsp)
  			ㄴ 급여관리페이지(paymanage.jsp)
  		ㄴ board - 게시판
  			ㄴ 글목록페이지(list.jsp) - 인증 x
  			ㄴ 글쓰기페이지(write.jsp) - 인증 x
  			ㄴ 글삭제페이지(delete.jsp) -인증 o
  		ㄴ member - 일반회원
  			ㄴ 회원가입페이지(addmember.jsp)
  			ㄴ 로그인페이지(logon.jsp) + logon_ok.jsp
  			ㄴ 로그아웃페이지(logout.jsp)
  			
  	필터
  	세션ID "auth" admin/
  	
  	@WebFilter(
    filterName = "characterEncodingFilter",
    urlPatterns = "/*",
    dispatcherTypes = DispatcherType.REQUEST,
    initParams = {
        	@WebInitParam(name = "encoding", value = "UTF-8")
    	}
	)
  </xmp>
  <ul>
  	<li><a href="${pageContext.request.contextPath }/days09/board/list.jsp">게시판 목록</a></li>
  	<li><a href="${pageContext.request.contextPath }/days09/board/write.jsp">게시판 작성</a></li>
  	<li><a href="${pageContext.request.contextPath }/days09/admin/membermanage.jsp">회원관리</a></li>
  </ul>
</div>

<script>
  
</script>

</body>
</html>