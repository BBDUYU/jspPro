<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 18. 오후 2:09:21</title>
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
  	ex04
  </xmp>
  
  서버요청시간 : <%= new Date().toLocaleString() %> <br />
  <input type="button" value="js ajax test" onclick="load('ex04_ajax_info.txt');"/> <br />
  <p id="demo"></p>
  
</div>

<script>

  function getXMLHttpRequest(){
      if (window.ActiveXObject) { // IE
       try{
        return  ActiveXObject("Msxml2.XMLHTTP");
       }catch(e){
          try{
             return new ActiveXObject("Microsoft.XMLHTTP");
          }catch(e){
             return null;
          }
       }
      }else if( window.XMLHttpRequest  ){
         return new XMLHttpRequest();
      }else {
         return null;
      }
   }
  
  let xhRequest;
  
  function callback(){
	  if(xhRequest.status == 200 && xhRequest.readyState==4){
		  let replyText = xhRequest.responseText;
		  const nameArr = replyText.split(",");
		  $("#demo").empty();
		  for(let name of nameArr){
			  $("#demo").append("<li>"+name+"</li>")
		  }
		  
	  }
  }
  
  function load(url){
	  // 1. XMLHttpRequest 객체 생성
	  xhRequest = getXMLHttpRequest();
	  // 4. callback - 200/4  p.demo 응답 데이터 출력
	  xhRequest.onreadystatechange = callback;
	  // 2. open() 설정
	  xhRequest.open("GET",url);
	  // 3. send() 요청
	  xhRequest.send();
  }
</script>

</body>
</html>