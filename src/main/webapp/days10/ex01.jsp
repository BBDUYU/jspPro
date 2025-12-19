<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 19. 오전 8:48:25</title>
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
  	days10.ex01
  	js ajax + XML, [JSON]
  	jq ajax method
  	예) 회원 가입 20개 정도의 회원정보 입력
  	> 아이디 입력 [아이디 사용 여부 버튼] ajax 처리
  	https://api.jquery.com/jQuery.ajax/#jQuery-ajax-url-settings
  </xmp>
  <h2>회원 가입 페이지</h2>
  
  <form>
    deptno : <input type="text" name="deptno" value="10" /><br>
    empno(id) : <input type="text" name="empno" value="7369" />
    <input type="button" id="btnEmpnoCheck" value="ID 중복체크 - jquery ajax">
    <p id="notice"></p>
    <br>
    ename : <input type="text" name="ename" /><br>
    job : <input type="text" name="job" value="" /><br>   
    :
    <br>
    <input type="submit" value="회원(emp) 가입">
  </form>
</div>

<script>
// [3] - serialize()
$(function(){
	  $("#btnEmpnoCheck").on("click",function(){
		  let params = $("form").serialize();
		
		
		  $.ajax({
			  url:`ex01_idcheck.jsp`,
			  type:"GET",
			  data:{empno:empno},
			  cache:false,
			  dataType:"json",
			  success: function(data, textStatus, jqXHR){
				  //{"count":1} 자동으로 자바스크립트 객체로 변환 - 변환필요 X
				  alert(data.count);
				  
			  },
			  error: function(){
				  alert("error")
			  },
		  });
		 
	  })
}) 

// [2] - data방식
/* 
$(function(){
	  $("#btnEmpnoCheck").on("click",function(){
		  const empno=$("input[name='empno']").val();
		  
		  $.ajax({
			  url:`ex01_idcheck.jsp`,
			  type:"GET",
			  data:{empno:empno},
			  cache:false,
			  dataType:"json",
			  success: function(data, textStatus, jqXHR){
				  //{"count":1} 자동으로 자바스크립트 객체로 변환 - 변환필요 X
				  alert(data.count);
				  
			  },
			  error: function(){
				  alert("error")
			  },
		  });
	  })
}) 
 */
/*   [1] - 중복확인 - url방식
 	$(function(){
	  $("#btnEmpnoCheck").on("click",function(){
		  const empno=$("input[name='empno']").val();
		  
		  $.ajax({
			  url:`ex01_idcheck.jsp?empno=\${empno}`,
			  type:"GET",
			  //data:{empno:7369}
			  cache:false,
			  dataType:"json",
			  success: function(data, textStatus, jqXHR){
				  //{"count":1} 자동으로 자바스크립트 객체로 변환 - 변환필요 X
				  alert(data.count);
			  },
			  error: function(){
				  alert("error")
			  },
		  });
	  })
  }) 
  */
</script>

</body>
</html>