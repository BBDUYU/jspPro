<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 12. 오전 7:05:54</title>
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
    days05.ex01.jsp
    게시판    ( CRUD )
     1) 목록
     2) 쓰기
     3) 수정
    --------
    [문제점] 조회수 새로고침시 방지
    --------  
    4) 삭제
    -- [문제] 삭제 후 목록으로 페이지 이동하고 154번 삭제완료!!! 경고창.
    -- ㄱ. delete.jsp 페이지로 처리
    -- ㄱ. view.jsp 페이지의 모달창으로 처리
    
    5) 페이징 처리
    http://localhost/jspPro/cstvsboard/list.htm
    http://localhost/jspPro/cstvsboard/list.htm?page=1
    http://localhost/jspPro/cstvsboard/list.htm?page=3
    
    List.java 서블릿 수정 + BoardDAOImpl.java 수정/체크
    PageVO.java - 용도 
    
    6) 검색 처리
    
    
    [문제]    
  </xmp>
</div>
<script>
</script>  
</body>
</html>