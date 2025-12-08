<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  int empno;
  String ename;
  String job;
  int mgr;
  Date hiredate;
  double sal;
  double comm;
  int deptno = Integer.parseInt(request.getParameter("deptno"));
  
  ArrayList<EmpVO> list = null;
  Iterator<EmpVO> ir = null;
  EmpVO vo = null;
  
  
  
  try {
     con = DBConn.getConnection();
     String sql = "SELECT "
           + " * "
             /* + " empno, ename, job, mgr, TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno " */
             + " FROM emp "
             + "WHERE deptno = ?";
     
     pstmt = con.prepareStatement(sql);
     pstmt.setInt(1,deptno);
     rs = pstmt.executeQuery();
     
     if (rs.next()) {
        list = new ArrayList<>();
        do {
           empno = rs.getInt("empno");
           ename = rs.getString("ename");
           job = rs.getString("job");
           mgr = rs.getInt("mgr");
           hiredate = rs.getDate("hiredate");
           sal = rs.getDouble("sal");
           comm = rs.getDouble("comm");
           deptno = rs.getInt("deptno");
           
           vo = new EmpVO().builder()
                       .empno(empno)
                       .ename(ename)
                       .job(job)
                       .mgr(mgr)
                       .hiredate(hiredate) 
                       .sal(sal)
                       .comm(comm)
                       .deptno(deptno)
                       .build();
           
           list.add(vo);
           
        } while (rs.next());
        
     }
  }catch (Exception e){
     e.printStackTrace();
  }finally {
     try{
        rs.close();
        pstmt.close();
        DBConn.close();
     }catch(Exception e) {
        e.printStackTrace();
     }
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오후 4:17:46</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">CHacha's Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
  ex04_02.jsp
  
  EmpVO.java
  </xmp>
  
  
  <h2>emp list - (<%= deptno %>)</h2>
<table>
    <thead>
      <tr>
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
           <td colspan="8">사원이 존재 X</td>
         </tr>
      <%      
         }else{ 
      
         ir = list.iterator();
        while( ir.hasNext() ){
           vo = ir.next();
     %>
     <tr>
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
        <td colspan="8">
          <span class="badge left red"><%= list == null? 0 : list.size() %>명</span>
          <a href="javascript:history.back()">뒤로가기</a>
        </td>
      </tr>
    </tfoot>
  </table>
</div>

<script>
  
</script>

</body>
</html>