<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String error = request.getParameter("error"); // ""
  String logonName = request.getParameter("name");
  String auth = request.getParameter("auth"); // "true" "false"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오후 2:29:45</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
   #logon, #logout{
    border:1px solid gray;
    width:300px;
    padding:20px;
    border-radius: 10px;
  }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">CHacha's Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
  ex07.jsp : main 페이지 + 로그인부분
  ex07_ok.jsp : 인증처리
           ㄴ 성공/실패 ex07.jsp (main 페이지)
           
  ex07.jsp (main 페이지) 인증처리 여부에 따라 화면 구성이 달라진다.
  
  인증 X              - 게시판
  인증 O              - 일정관리
  인증 O + 관리자권한 O  - 설문조사 
  </xmp>
    <div id="logon">
   <form action="ex07_ok.jsp" method="get">
    아이디 : <input type="text" name="id" value="admin"> <br>
    비밀번호 :  <input type="password" name="passwd" value="1234"> <br>
    <input type="submit"> 
    <input type="reset"> 
   </form>
  </div>  
   
  <div id="logout" style="display: none">
     [<%=logonName %>]님 로그인하셨습니다.<br>
     <button>로그아웃</button>
  </div>
  <br>
  
  <%
    if (logonName != null) {
    	if( auth.equals("true")){
    		 %>
    		  <a href="#">설문조사</a><br>
    		  <%
    	}
    		%>
    		  <a href="#">일정관리</a><br>

    	<script>
    		alert("로그인 성공");
    		$("#logon").hide();
    		$("#logout").show();
    	</script>
    	<%
    }// if
  %>
  

  
  <br>
  <a href="#">게시판</a><br>
</div>

<script>
  <%
  	if(error!=null && error.equals("")){ //로그인 실패 후 다시 메인 페이지로 돌아온 경우
  	%>
  	alert("로그인 실패 후 리다이렉트");
  	<%
  	}
  %>
</script>
<script>
$("#logout button").on("click",function(){
	let result = window.confirm("정말 로그아웃 합니까?");
	if(result){
		location.href = "ex07_logout.jsp";	
	}
})
</script>
</body>
</html>
