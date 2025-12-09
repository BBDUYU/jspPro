<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 9. 오후 4:07:55</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#tabs" ).tabs();
} );
</script>
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
  [ ex05.jsp ]
  1. JSP 테스트
    1) get 방식 요청
    2) post 방식 요청
  2. Servlet 테스트
    1) get 방식 요청
    2) post 빙식 요청
  </xmp>
  <div id="tabs">
    <ul>
      <li><a href="#tabs-1">jsp -> get 방식 요청</a></li>
      <li><a href="#tabs-2">jsp -> post 방식 요청</a></li>
    </ul>
    <div id="tabs-1">
      <p>
        1. a 링크 태그로 요청 <br>
        2. 웹 브라우저 : 주소창 url 입력 후 요청 <br>
        3. location.href 요청 <br>
        4. form method="get" 요청 <br>
        
        <br>
        
        정수 : <input type="text" id="n" name="n" value="10"><br>
        <a href="ex05_02.jsp">ex05_02.jsp</a>
      </p>
    </div>
    <div id="tabs-2">
      <p>
        <form method="get">
          Name : <input type="text" id="name" name="name" value="홍길동"><br>
          age : <input type="text" id="age" name="age" value="20"><br>
          
          <input type="radio" name="method" value="get" checked="checked">GET 요청
          <input type="radio" name="method" value="post">POST 요청
          
          <br>
          <button type="button">전송(submit)</button>
        </form>
      </p>
    </div>
  </div>
  
</div>
<script>
	$("#tabs-2 > form > button").on("click",function(){
		let method = $(":radio[name=method]:checked").val();
		$(this)
			.parent()
			.attr({
				"method" : method,
				"action" : `<%=contextPath %>/days02/ex05_03.jsp`
			})
			.submit();
	})
</script>
<script>
  $("#tabs-1 > p > a").on("click", function() {
   // href="ex05_02.jsp?n=10"
   $(this).attr("href", function(index, oldHref) {
      // alert(oldHref); ex05_02.jsp
      let n = $("#n").val(); // 입력받은 정수값
      return `\${oldHref}?n=\${n}`;
   });
  });
</script>

</body>
</html>