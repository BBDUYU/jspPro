<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	//	"/days06"
	String path = application.getInitParameter("path");

	// 실제 물리적으로 배포했을 시 경로
	//C:\Class\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days06
	String realPath = application.getRealPath(path);
	System.out.println("> realPath : "+realPath);
	
	ArrayList <String> fnlist = new ArrayList<>();
	
	File dir = new File(realPath);
	File listFiles[]=dir.listFiles();
	
	for(int i=0;i<listFiles.length;i++){
		File f = listFiles[i];
		if(f.isFile() && f.getName().endsWith(".jsp")){
			String fileName = f.getName();
			fnlist.add(fileName);
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 15. 오후 2:17:43</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
	.demo{
		border:1px solid gray;
		padding:5px;
		margin-top:10px;
		max-height:500px;
		overflow: auto;
	}
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
  	
  </xmp>
  <form action="">
  	<select name="file" id="file" onchange="submit()">
  		 <c:forEach items="<%=fnlist %>" var="fileName">
  			<option>${fileName }</option>
  		</c:forEach> 
  	</select>
  </form>
  <%
  	
    String pFileName = request.getParameter("file");  
  
    pFileName = pFileName == null ? fnlist.get(0) : pFileName;
    
    String fileName = pFileName;
    
    String content = "";
    
    fileName = String.format("%s\\%s", realPath, fileName);
    
    try(
       FileReader fr = new FileReader(fileName);   
       BufferedReader br = new BufferedReader(fr);   
          ){
       String line = null;
       while(  (line = br.readLine()) != null ){
          line = line
        		  .replaceAll("<","&lt;")
        		  .replaceAll(">","&gt;")
        		  +"<br>";   
          content += line;
       } // while
    }catch(Exception e){
       e.printStackTrace();
    }finally{
       
    }
  %>
 
  <div class="demo">
  	<code>
  		<%=content %> 
  	</code>
  </div>
  
</div>

<script>
  $("#file").on("change",function(){
	  $(this).parent().submit();
  })
  $("#file").val('<%=pFileName %>');
</script>

</body>
</html>