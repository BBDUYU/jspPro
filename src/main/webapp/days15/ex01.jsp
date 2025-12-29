<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 29. 오전 9:00:47</title>
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
  	답변형 게시판
	   	1. DB 테이블  - 데이터 저장
	    글번호(PK)   제목         작성자   ... 등등 컬럼
	    1         첫번째글      홍길동
	    2         두번째글      정창기
	    3         세번째글      이용준
	    4         2-1답글      홍길동
	    5         2-1-1답답글   김춘식
	    6         네번째글      이기수
	    7         3-1답글      누군가
	    8         2-2답글      이답글
	    
	    
	    2. 뷰(list.jsp) - 출력 담당
	    // ORDER BY 글번호 DESC; X
	    글번호(PK)   제목         작성자   ... 등등 컬럼
	    6         네번째글      이기수
	    3         세번째글      이용준
	     ㄴ 7        3-1답글      누군가
	    2         두번째글      정창기
	     ㄴ 8        2-2답글      이답글
	     ㄴ 4        2-1답글      홍길동
	       ㄴ 5         2-1-1답답글   김춘식
	    1         첫번째글      홍길동
	    
	    ------------------------------------------------
	    [첫번째 방법] - 컬럼 3개 추가
	    	ㄱ. 글 그룹(REF)
	    	ㄴ. 그룹 내에서 순서(STEP)
	    	ㄷ. 새,답글 깊이(DEPTH)
	    ------------------------------------------------
  		1. DB 테이블  - 데이터 저장
	    글번호(PK)   	제목         작성자   	글그룹	글순서	깊이... 등등 컬럼
	    1         	첫번째글      	홍길동	1		1		0		
	    2         	두번째글      	정창기	2		1		0
	    3         	세번째글      	이용준	3		1		0
	    4         	2-1답글      	홍길동	2		2		1
	    5         	2-1-1답답글  	김춘식	2		3		2		
	    6         	네번째글      	이기수	6		1		0
	    7         	3-1답글      누군가	3		2		1
	    8         	2-2답글      	이답글	2		2		1
	    
	    
	    2. 뷰(list.jsp) - 출력 담당
	    // ORDER BY 글번호 DESC; X
	    글번호(PK)   제목         작성자   글그룹		글순서	깊이... 등등 컬럼
	    6         	네번째글      	이기수	6		1		0
	    3         	세번째글      	이용준	3		1		0  	
	    	 7         	3-1답글      누군가	3		2		1
	    2         	두번째글      	정창기	2		1		0
	    	 8         	2-2답글      	이답글	2		2		1
	    	 4         	2-1답글      	홍길동	2		3		1
	    	 	5         	2-1-1답답글  	김춘식	2		4		2
	    1         	첫번째글      	홍길동	1		1		0		
  	
	    ------------------------------------------------
	    [두번째 방법] - 컬럼 2개 추가
	    ------------------------------------------------
	    1. DB 테이블  - 데이터 저장
	    글번호(PK)   	제목         작성자   	글그룹,순서	깊이... 등등 컬럼
	    1         	첫번째글      	홍길동	1000		0		
	    2         	두번째글      	정창기	2000		0
	    3         	세번째글      	이용준	3000		0
	    4         	2-1답글      	홍길동	1999		1
	    5         	2-1-1답답글  	김춘식	1998		2		
	    6         	네번째글      	이기수	6000		0
	    7         	3-1답글      누군가	2999		1
	    8         	2-2답글      	이답글	1997		1
	    
	    2. 뷰(list.jsp) - 출력 담당
	    // ORDER BY 글번호 DESC; X
	    글번호(PK)   	제목         작성자   	글그룹,순서	깊이... 등등 컬럼
	    6         	네번째글      	이기수	6000		0
	    3         	세번째글      	이용준	3000		0
		    7         	3-1답글      누군가	2999		1
	    2         	두번째글      	정창기	2000		0
	    	4         	2-1답글      	홍길동	1999		1
		    8         	2-2답글      	이답글	1998		1
	    		5         	2-1-1답답글  	김춘식	1997		2
	    1         	첫번째글      	홍길동	1000		0		
	    
	    컬럼3개 사용해서 답변형 게시판
	    --
	    days15.replyboard.controller 패키지
	    days15.replyboard.command 패키지
	    days15.replyboard.domain 패키지
	    days15.replyboard.persistence 패키지
	    days15.replyboard.service 패키지
	    
	    -- webapp 폴더
	    	ㄴ days15 폴더
	    		ㄴ emoticon
	    		ㄴ images
	    		ㄴ replyboard
  </xmp>
  
</div>

<script>
  
</script>

</body>
</html>