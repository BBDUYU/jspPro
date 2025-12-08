<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오후 12:07:07</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">jiho HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    ex03_04.jsp
    
    js or jq 사용...
  </xmp>
  
  정수 : <input type = "text" id="num" autofocus="autofocus">
  <br>
  <p id= "demo"></p>
</div>
<script>
$("#num")
    .css("text-align", "center")
    .on({
       "keydown":function(){
       
          if(
                !(
                             (e.which >=48 && e.which <=57) 
                             || (e.which >=96 && e.which <=105)
                             || e.which == 13
                             || e.which == 8
                             || e.which == 229
                             )      
          ){
             alert("숫자만 입력하세요.");
             e.preventDefault();
             
          }
          
       },
       "keyup":function(e){
          if (e.which == 13) {
             let n = $(this).val();
              let content = "";
               let result = 0;
               for (var i = 1; i <= n; i++) {
                content += i + (i==n ? "" : "+");
                result += i;
               }
               content += `=\${result}`
               $("#demo").empty().html(content);
               $(this).select();
            
         }
          
       }
    });

</script>
</body>
</html>