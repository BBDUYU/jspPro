<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 19. 오후 2:06:40</title>
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
  	ex06
  	
  	POST
  	method="post" 스트림 기반의 전송 방식
  	enctype="multipart/form-data" 설정했을 경우 - request 기본 객체로 전송되어져 오는 파라미터를 얻어올 수 없다
  	-> 전송되어져 오는 파라미터를 직접 개발자가 스트림으로부터 코딩해서 얻어와야함
  		1) 개발자 직접 구현  ex06_ok_02.jsp X
  		   스트림 + 확인( 파라미터 )
  		2) 외부에서 업로드 컴포넌트를 제공(외부 라이브러리 사용)
  		   ㄱ. http://www.servlets.com
  		   cos-22.05
  		   lib 폴더에 cos.jar 추가
  		   ㄴ days10 > upload 폴더생성
  		   
  		   MultipartRequest mrequest = new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ);  
		       ㄱ - JSP의 request 객체    
		       ㄴ - 서버에 저장될 위치(업로드 경로) 
		       ㄷ - 최대 파일 크기
		       ㄹ - 파일의 인코딩 방식
		       ㅁ - 파일 중복 처리위한 인자(클래스  제공)
		       
		       MultipartRequest 에러가 없이 객체 생성이 되면 ㄴ 경로에 파일은 저장되어있는상태
		       
		       ex07.jsp
		       ex07_ok.jsp
		       
  		   
  		3) 서블릿 3 - 라이브러리 제공
  			ㄱ. HttpServletRequest의 getPart() 메서드를 이용하면 업로드된 데이터 접근
  			ㄴ. 서블릿이 multipart 데이터를 처리할 수 있도록 설정이 필요
  				(1) web.xml <multipart-config>
  				(2) @MultipartConfig 어노테이션
  </xmp>
  
<form action="ex06_ok_02.jsp" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="name" value="홍길동" /> <br />
	첨부파일 : <input type="file" name="upload" multiple="multiple" /> <br />
	<input type="submit" />
</form>
</div>
<script>
  
</script>

</body>
</html>