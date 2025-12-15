<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   Enumeration<String> en = request.getParameterNames();
   while(en.hasMoreElements()){
      String cookieName = en.nextElement();
      String cookieValue = request.getParameter(cookieName);

      Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
      cookie.setMaxAge(-1);
      cookie.setPath("/");   
      response.addCookie(cookie);
   }// while
   
      
   String location="ex09_03.jsp";
   response.sendRedirect(location);

      
%>