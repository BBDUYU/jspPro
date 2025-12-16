<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 5:25:58</title>
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
    days07.ex01.jsp    
    [ 모델2구조와 MVC패턴 ]
    
    1) 모델 1 구조
    2) 모델 2 구조
    
    [ 웹 브라우저를 통해서 명령어를 전달하는 2가지 방법 ]
    1) 특정 이름의 파라미터에 명령어 정보를 전달하는 방법
       http://localhost/board?cmd=list&page=2&....
       http://localhost/board?cmd=write
       http://localhost/board?cmd=delete
    2) 요청URL 자체를 명령어로 사용하는 경우
        http://localhost/board/list.htm?page=2  
        http://localhost/board/list/2  
        
    [days04 게시판 구현 -> MVC 패턴으로 수정.]   
    1)
    days07.mvc.domain 패키지 추가   
    days07.mvc.persistence 패키지 추가   
    days07.mvc.controller 패키지 추가
    days07.mvc.command 패키지 추가  - 명령(로직)을 수행하는 패키지, 모델
    2) [web.xml] 복사+붙이기 -> web_days06.xml   
    3) days07.mvc.domain
           ㄴ BoardDTO.java
           ㄴ PageVO.java
    4) days07.mvc.persistence
           ㄴ BoardDAO.java     
           ㄴ BoardDAOImpl.java 
    5) 커넥션 풀  
       ex02.jsp  
       com.util.ConnectionProvider.java
    6) days04.board 패키지
       서블릿 List.java, Delete.java, View.java, Write.java
       -> 로직 처리 클래스( 모델 ) 수정
        
       ->  ㄱ.  request /session 객체 저장.   X 
       ->  ㄴ.  뷰(jsp) ...
       ->  ㄷ.  포워딩(컨)/리다이렉트(모)
       -> ㄱ.ㄴ.ㄷ 정보를 서블릿(컨트롤러) 반환 + 클래스 선언  
       
       (1) 인터페이스 선언  days07.mvc.command.CommandHandler.java
       (2) 각각의 모델 클래스는 위의 인터페이스 구현한 클래스 
       
    7)  List.java (서블릿) -> 로직처리하는 모델 생성 ListHandler.java 서블릿 X
        NullHandler.java - 요청한 URL을 분석해 보니 로직을 처리할 ???Handler 찾지 못한 경우.
    
    8) MV[C]     Controller 생성. 
      (1)   요청URL => 분석 => 어떤 CommandHandler 처리
         commandHandler.properties
         key           value
         요청URL        처리할 CommandHandler 객체
         
      (2) 서블릿인 컨트롤러 선언 
           DispatcherServlet  
           
   9) 글 목록  처리 완료!!!
   
   10) 글 쓰기 처리 ~        
  </xmp>
  
  <a href="/jspPro/board/list.do">게시글 목록</a>
  <br>
  
</div>
<script>
</script>  
</body>
</html>









