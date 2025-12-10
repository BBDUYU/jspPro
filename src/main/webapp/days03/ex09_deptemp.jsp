<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   ArrayList<DeptVO> Dlist=(ArrayList<DeptVO>)request.getAttribute("Dlist");
   ArrayList<EmpVO> Elist=(ArrayList<EmpVO>)request.getAttribute("Elist");
   Iterator<DeptVO> Dir = null;
   Iterator<EmpVO> Eir = null;
   DeptVO Dvo = null;
   EmpVO Evo = null;
   
   int deptno;
   String dname;
   String loc;
   
   int deptParam = (request.getAttribute("deptParam") != null)
            ? (Integer) request.getAttribute("deptParam")
            : 10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오후 4:47:29</title>
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
  <xmp class="code"> </xmp>
  
</div>
<select id="deptno" name="deptno">
    <%
      Dir = Dlist.iterator();
     while ( Dir.hasNext() ) {
        Dvo = Dir.next();
        deptno = Dvo.getDeptno();
        dname = Dvo.getDname();
   %><option value="<%= deptno %>"<%= (deptno == deptParam ? "selected" : "") %>><%= dname %></option><%  
     }// while
    %>
  </select>
  
  <hr>
<h2>emp list - (<%= deptParam %>)</h2>
<table>
    <thead>
      <tr>
       <th><input type="checkbox" id="ckbAll" name="ckbAll"/></th>
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
      <%
         if( Elist == null ){
      %>
         <tr>
           <td colspan="9">사원이 존재 X</td>
         </tr>
      <%      
         }else{ 
      
         Eir = Elist.iterator();
        while( Eir.hasNext() ){
           Evo = Eir.next();
     %>
     <tr>
       <td><input type="checkbox" id="ckb-<%= Evo.getEmpno() %>" name="ckb-<%= Evo.getEmpno()%>" value="<%= Evo.getEmpno()%>" data-empno="<%= Evo.getEmpno()%>"/></td>
       <td><%= Evo.getEmpno() %></td>
        <td><%= Evo.getEname() %></td>
        <td><%= Evo.getJob() %></td>
        <td><%= Evo.getMgr() %></td>
        <td><%= Evo.getHiredate() %></td>
        <td><%= Evo.getSal() %></td>
        <td><%= Evo.getComm() %></td>
        <td><%= Evo.getDeptno() %></td>
     </tr>     
     <%
        } // while
           
        } // if     
     %>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="9">
          <span class="badge left red"><%= Elist == null? 0 : Elist.size() %>명</span>
          <a href="javascript:history.back()">뒤로가기</a>
          <button>선택한 empno 확인</button>
        </td>
      </tr>
    </tfoot>
  </table>
<script>
  $("#deptno").on("change",function(){
     let deptno=$(this).val();
     if(!isNaN(deptno)){
        
        location.href=`${pageContext.request.contextPath }/scott/deptemp?deptno=\${deptno}`;
     }
  })
  
  //$("#deptno").val(${param.deptno});
</script>
<script>
   // 모두 선택 체크박스 + 클릭
   $("#ckbAll").on("click", function(){
      $("table tbody tr")
         .find("td:first-child :checkbox")
            .prop("checked", $(this).prop("checked"));
   })
   
   // 사원 각각의 체크박스 + 클릭
   $("table tbody tr")
     .find("td:first-child :checkbox")
       .on("click", function() {
         const flag = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
         $("#ckbAll").prop("checked", flag);
        });
</script>

</body>
</html>