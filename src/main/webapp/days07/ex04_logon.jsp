<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String id = request.getParameter("id");
  String passwd = request.getParameter("passwd");
  // 로그인 성공하면    auth 라는 쿠키이름으로 로그인한 id 쿠키값으로 저장. 
  // 브라우저를 닫으면 쿠키는 삭제
  String location = "ex04_default.jsp";
  
  if( id.equals("admin") && passwd.equals("1234") ){
     Cookie cookie = Cookies.createCookie("auth", id, "/", -1); 
     response.addCookie(cookie);
  }else if( id.equals("hong") && passwd.equals("1234") ){
     Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
     response.addCookie(cookie);
  }else if( id.equals("kim") && passwd.equals("1234")){
     Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
     response.addCookie(cookie);
  }else{  // 로그인 실패
     location += "?logon=fail"; 
  }
  
  response.sendRedirect(location);
%>