<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 9. 오후 12:37:13</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
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
    ex04.jsp
    
    [ 서블릿 ]  p188
    1. 서블릿 규약을 따르는 서블릿 클래스 선언
    2. 서블릿 규약
      ㄱ. 접근지정자 public  class
      ㄴ. javax.servlet.http.HttpServlet 클래스 상속
      ㄷ. service(), get(), post() 메서드를 오버라이딩 .
    3. web.xml 서블릿 등록
        - 웹 애플리케이션의 설정 파일이다.
        - 배포 서술자 == Deployment Descriptor , DD파일
        - WEB-INF/web.xml에 위치
        - 서버(톰캣 등)가 웹앱을 어떻게 실행할지 정의하는 핵심 설정 파일
        - 서블릿, 필터, 리스너 등의 정보를 서버에 알려주는 역할
        - 현재는 @WebServlet, @WebFilter 등 어노테이션 사용으로 필수가 아님
        - 예)
        <servlet>
          <servlet-name>HelloServlet</servlet-name>
          <servlet-class>com.example.HelloServlet</servlet-class>
      </servlet>
      
      <servlet-mapping>
          <servlet-name>HelloServlet</servlet-name>
          <url-pattern>/hello</url-pattern>
      </servlet-mapping>

        
    4. 서블릿 등록할 때 정한  요청 URL로 클라이언트에서 요청.   
  </xmp>
  <!-- get 방식 요청 -->
<a href="<%=contextPath%>/hello?name=admin">/jspPro/hello?name=admin</a><br />  
<%-- 
<a href="<%=contextPath%>/days02/sample.html">/jspPro/days02/sample.html</a><br />  
<a href="<%=contextPath%>/days02/sample.jsp">/jspPro/days02/sample.jsp</a><br />  
<a href="<%= contextPath  %>/days02/test/xxx/sample.do">/jspPro/days02/test/xxx/sample.do</a><br>
<a href="<%= contextPath  %>/days02/sample.do">/jspPro/days02/sample.do</a><br></div>
 --%>
<script>
  
</script>

</body>
</html>