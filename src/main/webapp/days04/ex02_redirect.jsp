<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- redirect jsp -->
<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");

    String location = String.format("ex02_finish.jsp?name=%s&age=%s", name, age);
    response.sendRedirect(location);
%>
