<%@page import="com.util.ConnectionProvider"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="com.util.DBConn"%> 
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

  String contextPath = request.getContextPath();

  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  int deptno;
  String dname;
  String loc;
  
  // org.doit.domain.DeptVO.java 추가
  ArrayList<DeptVO> dlist = null;
  Iterator<DeptVO> dir = null;
  DeptVO dvo = null;
  
  try{
     con = ConnectionProvider.getConnection();
     String dSql = "SELECT * " 
             + " FROM dept";
     pstmt = con.prepareStatement(dSql);
     rs = pstmt.executeQuery();
     if( rs.next() ){
        dlist = new ArrayList<>();
        do{
           deptno = rs.getInt("deptno");
           dname = rs.getString("dname");
           loc = rs.getString("loc");
           
           dvo = new DeptVO().builder()
                 .deptno(deptno)
                 .dname(dname)
                 .loc(loc)
                 .build();
           dlist.add(dvo);                            
        }while( rs.next() );
     } // if
  }catch(Exception e){
     e.printStackTrace();
  }finally{
     try{
      rs.close();  
       pstmt.close();
       con.close();
     }catch(Exception e){
        e.printStackTrace();
     }
  } // try
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 19. 오전 10:04:24</title>
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
  ex03.jsp
  </xmp>
<div id="content">

  <select id="deptno" name="deptno">
     <c:forEach items="<%= dlist %>" var="dvo">
       <option value="${ dvo.deptno }">${ dvo.dname }</option>
     </c:forEach>
  </select>
  
   <h2>emp list - (<span id="spndeptno"></span>)</h2>
  
  <table>
    <thead>
      <tr>
       <th><input type="checkbox" id="ckbAll" name="ckbAll"></th>
       <th>empno</th>
       <th>ename</th>
       <th>job</th>
       <th>mgr</th>
       <th>hiredate</th>
       <th>sal</th>
       <th>comm</th>
       <th>deptno</th>
      </tr>
    </thead>
    <tbody>

    </tbody>
    <tfoot>
      <tr>
        <td colspan="9">
          <span class="badge left red">0명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
          <button>선택한 empno 확인</button>
          <!-- ex02_03.jsp -->
        </td>
      </tr>
    </tfoot>
  </table>
  
  
  </div>
<script>
$(function(){
	  $("#deptno").on("change",function(){
		  let deptno = $(this).val();
		  $("#spndeptno").text(deptno);
		
		  $.ajax({
			  //url:`ex03_empjson.jsp`,
			  url:`ex03_empjson_lib.jsp`,
			  type:"GET",
			  data:{deptno:deptno},
			  cache:false,
			  dataType:"json",
			  success: function(data, textStatus, jqXHR){
				
					$("span.badge").text( `\${data.emp.length} 명` );
	                $("table tbody").empty();
	                if (data.emp.length==0) {
	                	
	                	$("table tbody").append(
	                            `<tr>
	                            <td colspan="9">사원이 존재 X</td>
	                          </tr>`
	                            );
					}else{
						$(data.emp).each(function(i, emp){
					        $("tbody").append(`
					          <tr>
					            <td><input type="checkbox"></td>
					            <td>\${emp.empno}</td>
					            <td>\${emp.ename}</td>
					            <td>\${emp.job}</td>
					            <td>\${emp.mgr}</td>
					            <td>\${emp.hiredate}</td>
					            <td>\${emp.sal}</td>
					            <td>\${emp.comm}</td>
					            <td>\${emp.deptno}</td>
					          </tr>
					        `);
					      });
					}
			
			  },
			  error: function(){
				  alert("error")
			  },
		  });
		 
	  })
	  $("#deptno").change();
}) 

</script>

</body>
</html>