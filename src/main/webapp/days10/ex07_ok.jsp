<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 19. 오후 2:39:19</title>
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
  	ex07_ok
  </xmp>
  <%
  	String path = "/days10/upload";
  	// 실제 배포했을 때의 경로
  	
  	String saveDir=pageContext.getServletContext().getRealPath(path);
  	System.out.println("> saveDir : "+saveDir);
  	File d = new File(saveDir);
  	if(!d.exists()){
  		d.mkdirs();
  	}
  	
  	int maxSize = 5*1024*1024; //5mb
  	String encoding="UTF-8";
  	FileRenamePolicy policy = new DefaultFileRenamePolicy();
  	
	MultipartRequest mrequest = new MultipartRequest(request,saveDir,maxSize,encoding,policy);   
  	String msg= mrequest.getParameter("msg");
  	
  %>
  > 전송된 메시지 : <%=msg %> <br />
  <br />
  <br />
  <h3>첨부파일 정보</h3>
  <%
  	Enumeration en = mrequest.getFileNames();
  	while(en.hasMoreElements()){
  		// 1. name속성값
  		String inputFileNameAttr =(String) en.nextElement();
  		// 2. 첨부된 파일객체를 얻어옴
  		File attachFile = mrequest.getFile(inputFileNameAttr);
  		
  		if(attachFile != null){
  			String fileName = attachFile.getName();
  			long fileSize = attachFile.length();
  			String originalFileName = mrequest.getOriginalFileName(inputFileNameAttr);
  			String filesystemName = mrequest.getFilesystemName(inputFileNameAttr);
  		
  		%>
  		> name 속성값 : <%= inputFileNameAttr %> <br />
  		> 첨부파일명 : <%= fileName %> <br />
  		> 첨부파일크기 : <%= fileSize %>  <br />
  		> 첨부파일 원래 파일명 : <%= originalFileName %>  <br />
  		> 실제저장된 파일명 : <%= filesystemName %>  <br />
  		<%
  		}
  	}
  %>
  
</div>

<script>
  
</script>

</body>
</html>