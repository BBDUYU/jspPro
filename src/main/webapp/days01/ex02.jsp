<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오전 9:17:36</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/webPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
	.ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
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
   책 제목, 저자, 나이 입력 태그를 사용해서 입력 받아서
   서버에 전송(submit)한 후에 서버에 입력값을 출력하는 jsp로 응답
   
   제출 버튼을 클릭하면 책 제목, 저자, 나이는 필수 입력 항목
  </xmp>
  
  <form action="ex02_el_ok.jsp" method="get" id="bookForm">
  	책제목 : <input type="text" id="title" name="title"  autofocus="autofocus" value="JSP2.4"/><br>
  	저자 : <input type="text" id="author" name="author"  value="홍길동"/><br>
  	나이 : <input type="text" id="age" name="age" value="20"/><br>
  	
  	<button type="button" id="submitBtn">제출</button>
  	<input type="reset" />
  </form>
  <p class="validateTips">입력값을 확인</p>
  
</div>

<script>
  $( function() {
    var form,
 
      ageRegex = /^(?:\d|[1-9]\d|1[0-2]\d|130)$/,
      title = $( "#title" ),
      author = $( "#author" ),
      age = $( "#age" ),
      allFields = $( [] ).add( title ).add( author ).add( age ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
   	
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > 0 ) {
    	  return true;    
      } else {
    	  o.addClass( "ui-state-error" );
          updateTips( n + " 필수입력 ");
          alert(`\${n} 필수입력`);
          return false;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        alert(`\${n}`);
        return false;
      } else {
        return true;
      }
    }
 
    $("#submitBtn").on("click",addInfo);
    
    function addInfo() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( title, "책제목", 3, 16 );
      valid = valid && checkLength( author, "저자", 6, 80 );
      valid = valid && checkLength( age, "나이", 5, 16 );
 
      valid = valid && checkRegexp( age, ageRegex, "0 ~ 130살 유효" );
 
      if ( valid ) {
       $("form").submit();
      }
    }

  } );
  </script>

</body>
</html>