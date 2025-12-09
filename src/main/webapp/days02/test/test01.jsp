<%@page import="java.util.Objects"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // http://localhost/jspPro/days02/ex01.jsp
  // ?n=1&m=5  X
  String pN = request.getParameter("n");  // null
  String pM = request.getParameter("m");  // null
  
  int n , m;
  String content = "";
  
  if(  pN != null && !pN.equals("")
         &&   pM != null && !pM.equals("") ){     
     n = Integer.parseInt(pN);
     m = Integer.parseInt(pM);     
     int min = Math.min(n, m);
     int max = Math.max(n, m);     
     int sum = 0;     
     for(int i=min; i<=max; i++){
        content += String.format("%d+", i);
        sum += i;
     }
     content += String.format("=%d", sum);     
  } // if 
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 9. 오전 7:11:39</title>
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
    [문제] 두 정수(n,m) 입력받아서 두 정수 사이의 합을 출력
    ( 서버에서 처리 )
  </xmp>
  
  <form>
     정수1(n) : <input type="text" id="n" name="n" autofocus="autofocus" value="${param.n}">
     ~
     정수2(m) : <input type="text" id="m" name="m">
     <br>
     <input type="button" value="제출">
  </form>
  
  <br>
  <p id="demo"><%= content %></p>
  
</div>
<script>
  $("#n, #m")
     .css("text-align", "center")
     .on({
        "keydown": function (e){
           // 입력값이 숫자 유무 체크 -> 이벤트 취소 코딩.
        }
         , "keyup": function (e){
            if( e.which == 13 ){
               if(  $(this).prop("id") == "n" ){
                  $(this).next().select();
               }
            } // if
         }
     });
  
  $(":button").on("click", function (){
     $("form").submit();
  })
  
  // 상태 관리 js
  //             null   
   <%-- $("#m").val('<%= Objects.toString( pM, "" ) %>'); --%>
  $("#m").val(<%= pM %>);
</script>  
</body>
</html>











