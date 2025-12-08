<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // http://localhost/jspPro/days01/ex03_05.jsp
  // ?
  // num=34
  String content = "";
  String pNum = request.getParameter("num"); // null
  if(pNum != null && !pNum.equals("") ) {
     int num = Integer.parseInt(pNum);
     int result = 0;
     for (int i = 1; i <= num; i++) {
        content += i + (i==num ? "" : "+");
        result += i;
     }
     content += "=" + result;
  }
  
  // try{
  // } catch(NumberFormatException e){}
  // } catch(Exception e){}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오후 12:08:14</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
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
  ex03_05.jsp
  
  정수 입력해서 엔터를 치면 서브밋 -> ex03_05.jsp를 호출해서
  입력받은 정수까지의 합을 p 태그에 출력
  </xmp>
  
  <!-- <form action="ex03_05.jsp"></form> -->
     <%-- 정수 : <input type="text" id="num" autofocus="autofocus" value="<%= pNum%>"> --%>
     정수 : <input type="text" id="num" autofocus="autofocus">
     <br>
     <p id="demo">결과 : <%= content %></p>
</div>


<script>
  let pNum = <%= pNum%>;
  $("#num").val(pNum);
</script>

<script>
$("#num")
    .css("text-align", "center")
    .on({
       "keydown":function(e){
          if(
                !((e.which >=48 && e.which <=57) 
                 || (e.which >=96 && e.which <=105)
                 || e.which == 13
                 || e.which == 8
                 || e.which == 229 )      
          ){
             alert("숫자만 입력하세요.");
             e.preventDefault();
             
          }
          
       },
       "keyup":function(e){
          if (e.which == 13) {
          // alert("서버에서 합 처리 후 출력!!")
          // js 서브밋~
          let n = $(this).val();
          location.href = `ex03_05.jsp?num=\${n}`;
        
            
        }
          
       }
    });

</script>

</body>
</html>