<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   
   String location = "/jspPro/days09/ex02.jsp";
   
   String referer = (String)session.getAttribute("referer");
   
   boolean isAuthority = false;  // 권한
   
   if(id.equals("admin") && passwd.equals("1234")){
      isAuthority=true;
      session.setAttribute("auth", id);
      session.setAttribute("isAuthority", true); //<- 이거 과제
      if(referer !=null){
    	  location = referer;
    	  session.removeAttribute("referer");
      }
      
   }else if(id.equals("hong") && passwd.equals("1234")){
      session.setAttribute("auth", id);
      if(referer !=null){
    	  location = referer;
    	  session.removeAttribute("referer");
      }

   }else if(id.equals("kim") && passwd.equals("1234")){
      session.setAttribute("auth", id);
      if(referer !=null){
    	  location = referer;
    	  session.removeAttribute("referer");
      }

   }else{
      location = "logon.jsp?logon=fail";
   }
   System.out.println(referer);
   response.sendRedirect(location);
  
%>