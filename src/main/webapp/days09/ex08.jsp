<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 18. 오후 4:08:47</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<script src="httpRequest.js"></script>
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
  	dept 부서 정보를 xml, json 저장
  	ex08_dept.json -> ajax 요청해서 -> 형식으로 처리
  	ex08_dept.xml -> 
  	
  </xmp>
  <button type="button">ex08_dept.json -> ajax 요청 처리</button>
  <br />
  <p id="demo"></p>
</div>

<script>
  $("button").on("click",function(){
	  sendRequest("ex08_dept.json",null,callback,"GET");
  });
  
  function callback(){
	  if(httpRequest.readyState==4){
		  if(httpRequest.status==200){
			  let replyJSON = httpRequest.responseText;
			  // json -> js Object 변환 : JSON.parse();
			  const deptObj = JSON.parse(replyJSON);
			  //console.log(deptObj);
			  // [] 배열
			  const deptArr = deptObj.departments;
			  
			  for (let dept of deptArr) {
				$("#demo").append(`
						<li>
							\${dept.deptno} / \${dept.dname} / \${dept.loc}
						</li>
						`);
			  }
		  }
	  }
  }
</script>

</body>
</html>