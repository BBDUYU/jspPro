<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // ex09_04.jsp
   // 
   String [] deleteCookieNameArr = request.getParameterValues("ckbCookie");
   for(int i = 0; i < deleteCookieNameArr.length; i++){
      String cookieName = deleteCookieNameArr[i];
      
      Cookie cookie = new Cookie(cookieName, "X");
      cookie.setMaxAge(0); 
      cookie.setPath("/");   // jspPro/days06
      response.addCookie(cookie);
   }
   
   String location = "ex09_03.jsp";
%>
<script>
   alert("쿠키 삭제 완료");
   location.href='<%= location %>';
</script>