<%@page import="java.util.Date"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   int empno;                          
   String ename;                       
   String job;                         
   int mgr;               
   Date hiredate;  
   double sal;                         
   double comm;                        
   int deptno = 10;    
   
   String pDeptno = request.getParameter("deptno");
   pDeptno = ( pDeptno == null ? "10" : pDeptno  );   
   try{
        deptno = Integer.parseInt(pDeptno); 
   }catch(Exception e){}

    String sql = "SELECT empno, ename, job, mgr " 
              + " , TO_CHAR( hiredate, 'yyyy-MM-dd' ) hiredate "
              + " , sal, comm, deptno "
           + " FROM emp "
           + " WHERE deptno = ? ";
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String resultJSON = "{";   
   resultJSON += "  \"emp\":[";
   
   try{
        conn = ConnectionProvider.getConnection();
        pstmt = conn.prepareStatement(sql);   
        pstmt.setInt(1, deptno );
        rs = pstmt.executeQuery();     
        if(rs.next()){ 
           do{
              empno = rs.getInt("empno");
              ename = rs.getString("ename");
              job = rs.getString("job");
              mgr = rs.getInt("mgr");
              hiredate = rs.getDate("hiredate");
              sal = rs.getDouble("sal");
              comm = rs.getDouble("comm");
              deptno = rs.getInt("deptno");
              
              resultJSON += String.format(
                    "{\"empno\":%d,\"ename\":\"%s\",\"sal\":%.2f,\"job\":\"%s\"},"
                    , empno, ename, sal, job);
           }while(rs.next());
            // 마지막 콤마 제거     
             resultJSON = resultJSON.substring( 0, resultJSON.length()-1); 
        } // if
        
        
        resultJSON += "]";
        resultJSON += "}";
   }catch(Exception e){
        e.printStackTrace();
   }finally{
        JdbcUtil.close(rs);
        JdbcUtil.close(pstmt);
        JdbcUtil.close(conn);
}
%>
<%= resultJSON %>



<%-- 

{
  "emp":[
            {"empno":7902,"ename":"FORD"},
            {"empno":7566,"ename":"JONES"},
            {"empno":7698,"ename":"BLAKE"},
            {"empno":7782,"ename":"CLARK"},
            {"empno":7499,"ename":"ALLEN"},
            {"empno":7844,"ename":"TURNER"},
            {"empno":7934,"ename":"MILLER"},
            {"empno":7654,"ename":"MARTIN"},
            {"empno":7521,"ename":"WARD"},
            {"empno":7900,"ename":"JAMES"},
            {"empno":7369,"ename":"SMITH"}  
        ]  
} 

--%>