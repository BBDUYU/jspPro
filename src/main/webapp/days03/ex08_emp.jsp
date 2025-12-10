<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% %>
<%
	ArrayList<EmpVO> list=(ArrayList<EmpVO>)request.getAttribute("list");
	int deptno = (int)request.getAttribute("deptno");
	
	Iterator<EmpVO> ir = null;
	EmpVO vo =null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 10. 오후 4:19:10</title>
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
  	ex08_emp.jsp
  </xmp>
  
</div>
<h2>emp list</h2>
  
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
         if( list == null ){
      %>
         <tr>
           <td colspan="9">사원이 존재 X</td>
         </tr>
      <%      
         }else{ 
      
         ir = list.iterator();
        while( ir.hasNext() ){
           vo = ir.next();
     %>
     <tr>
        <td><input type="checkbox" id="ckb-<%= vo.getEmpno() %>" name="ckb-<%= vo.getEmpno()%>" value="<%= vo.getEmpno()%>" data-empno="<%= vo.getEmpno()%>"/></td>
        <td><%= vo.getEmpno() %></td>
        <td><%= vo.getEname() %></td>
        <td><%= vo.getJob() %></td>
        <td><%= vo.getMgr() %></td>
        <td><%= vo.getHiredate() %></td>
        <td><%= vo.getSal() %></td>
        <td><%= vo.getComm() %></td>
        <td><%= vo.getDeptno() %></td>
     </tr>     
     <%
        } // while
           
        } // if     
     %>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="9">
          <span class="badge left red"><%= list==null?0:list.size() %>명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
          <button>선택한 empno 확인</button>
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>
<script>
// [2]
  $("tfoot button").on("click", function() {
   let empnoArr = [];
   
   $("tbody :checkbox:checked").each(function(i, e) {
      let empno = $(e).data("empno");
      empnoArr.push(empno);
   });   
   
   location.href = `test02_03.jsp?empno=\${empnoArr.join("&empno=")}`;
  });
  

/* [1]
  // 선택 empno 확인버튼
  $("tfoot button").on("click", function() {
   let empnoArr = [];
   
   $("tbody :checkbox:checked").each(function(i, e) {
      let empno = e.parentElement.nextElementSibling.innerText;
      empnoArr.push(empno);
   });   
   
   location.href = `ex02_03.jsp?empno=\${empnoArr.join("&empno=")}`;
  });
*/
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