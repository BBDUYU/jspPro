<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  ArrayList<DeptVO> list = null;
  Iterator<DeptVO> ir = null;
  DeptVO vo = null;
  
  int deptno;
  String dname;
  
  try {
     
     conn = DBConn.getConnection();
     String sql = "SELECT * FROM dept ";
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
     
     if (rs.next()) {
        list = new ArrayList<>();
        do {
           deptno = rs.getInt("deptno");
           dname = rs.getString("dname");
           
           vo = new DeptVO().builder()
                 .deptno(deptno)
                 .dname(dname)
                 .build();
           
           list.add(vo);
        } while(rs.next());
        
     }
     
  } catch(Exception e) {
     e.printStackTrace();
  } finally {
     try {
        
     }catch (Exception e) {
        e.printStackTrace();
     }
     
  }
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 9. 오전 9:11:29</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "input" ).checkboxradio();
} );
</script>
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
  
  </xmp>
  <h2>부서를 선택하세요</h2>
  <fieldset>
    <legend>Hotel Ratings: </legend>
<!--     <label for="checkbox-1">2 Star</label> -->
<!--     <input type="checkbox" name="checkbox-1" id="checkbox-1"> -->
<!--     <label for="checkbox-2">3 Star</label> -->
<!--     <input type="checkbox" name="checkbox-2" id="checkbox-2"> -->
<!--     <label for="checkbox-3">4 Star</label> -->
<!--     <input type="checkbox" name="checkbox-3" id="checkbox-3"> -->
<!--     <label for="checkbox-4">5 Star</label> -->
<!--     <input type="checkbox" name="checkbox-4" id="checkbox-4"> -->
<%
        ir = list.iterator();
     
         while(ir.hasNext()) {
            vo = ir.next();
             deptno = vo.getDeptno();
             dname = vo.getDname();
     %><label for="checkbox-<%= deptno %>"><%= dname %></label>
    <input type="checkbox" name="deptno" id="checkbox-<%= deptno %>" value="<%= deptno %>"><%
         }
     %>
  </fieldset>
  
  <br>
  
  <input type="button" value="사원 확인">
  
  <p id="demo"></p>
  
</div>
<script>
   $(":button[value= '사원 확인']").on("click", function () {
      const cbox = $(":checkbox[name = deptno]:checked");
      
      if (cbox.length == 0) {
         alert("부서를 체크");
         return;
      }
      // ex02_ok.jsp?deptno=10&deptno=30
      const deptnoArr = [];
      cbox.each(function(index,element){
         let deptno = $(element).val();
         deptnoArr.push(`deptno=\${deptno}`);
      });
      
      location.href = `test02_02.jsp?\${deptnoArr.join('&')}`;
   });
</script>

</body>
</html>