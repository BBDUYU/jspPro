<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String content = "";
	int result = 0;
	for (int i = 1; i <= 10; i++) {
	 content += i + (i==10 ? "" : "+");
	 result += i;
	}
	content += "="+result;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오전 11:18:06</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/webPro/images/SiSt.ico">
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
	ex03  
	
	p 요소에 1+2+3+4+5+6+7+8+9+10=55 라고 출력
	1) js
	2) jsp - 스크립트릿을 사용
  </xmp>
  <p id="demo">
  	<%=content %>
  </p>
  
</div>
<script>
	
</script>
<script>
/*[2]
	const arr=[];
	for (var i = 1; i <=10 ; i++) {
		arr.push(i);
	}
	let result = arr.reduce((total,value)=>total+value);
	$("#demo").html(arr.join("+") + "="+result);
	*/
</script>
<script>
/*[1]
  let content = "";
  let result = 0;
  for (var i = 1; i <= 10; i++) {
   content += i + (i==10 ? "" : "+");
   result += i;
  }
  content += `=\${result}`
  $("#demo").append(content);
  */
</script>

</body>
</html>