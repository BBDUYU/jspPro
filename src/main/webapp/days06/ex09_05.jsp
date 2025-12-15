<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String updateCookieNameArr[] = request.getParameterValues("ckbCookie");
	Cookie  cookieArr[] = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 3:47:19</title>
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
<div id="content">
  <xmp class="code">
   ex09_05.jsp
  </xmp>
<%!
public String getCookieValue( String cookieName , HttpServletRequest request ){
    Cookie [] cookieArr = request.getCookies();
    for( Cookie c : cookieArr ){
       if( c.getName().equals(cookieName) ){
          try{
          return URLDecoder.decode(c.getValue() ,"UTF-8");
          }catch(Exception e){}
       }
    }

    return null;
}
%>
<form action="ex09_05_ok.jsp">
<%
	String updateCookieArr[] = request.getParameterValues("ckbCookie");
	for(int i=0;i<updateCookieArr.length;i++){
		String cookieName = updateCookieArr[i];
        String cookieValue = getCookieValue(cookieName,request);
        %>
         <li>
	      <%= cookieName %> : 
	      <input type="text" name="<%= cookieName %>" value="<%= cookieValue %>"><br>
	    </li>    
        <%
	} // for
%>
<br>
      <input type="submit" value="쿠키 수정">
</form>

</div>
<script>
</script>

</body>
</html>