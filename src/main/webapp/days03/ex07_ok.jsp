<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 String id = request.getParameter("id");
 String passwd = request.getParameter("passwd");
 
 // DB연동 id,passwd 체크 X
 // 회원  admin/1234
 // 회원  hong/1234
 // 회원  kim/1234
 HashMap<String, String> memberMap = new HashMap<String, String>();
 memberMap.put("admin","1234");
 memberMap.put("hong","1234");
 memberMap.put("kim","1234");
 
 // 아이디가 존재 유무 확인 : memberMap.get(id) ==null
       String location = request.getContextPath();
       String name = null;
       boolean auth;// 인증 true/false 변수
       
       
       
       if(id.equals("admin") && passwd.equals("1234")){
          name = "관리자";
          auth = true;
          location = "ex07.jsp?name="+URLEncoder.encode(name)+"&auth="+auth;
              
       
       }else if(id.equals("hong") && passwd.equals("1234")){
          name = "홍길동";
          auth = false;
          location = "ex07.jsp?name="+URLEncoder.encode(name)+"&auth="+auth;
      
          
          }else if(id.equals("kim") && passwd.equals("1234")){
             name = "김도훈";
             auth = false;
             location = "ex07.jsp?name="+URLEncoder.encode(name)+"&auth="+auth;
          }else{
             //location = "ex07.jsp";
             location = "ex07.jsp?error";
          }
    
       response.sendRedirect(location);
%>
