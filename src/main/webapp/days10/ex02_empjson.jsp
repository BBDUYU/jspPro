<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String sql = " SELECT empno,ename,sal,job "
	           +" FROM emp "
	           +" ORDER BY sal DESC ";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//  JSON =  { "count":0 } 응답
	String resultJSON = "{";        
	resultJSON+="\"emp\":[";
	try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   rs = pstmt.executeQuery();    
	   while(rs.next()){
		   //{"empno":7902,"ename":"FORD"},
		   int empno = rs.getInt("empno");
		   String ename = rs.getString("ename");
		   double sal = rs.getDouble("sal");
		   String job = rs.getString("job");
		   
		   resultJSON += String.format( "{\"empno\":%d,\"ename\":\"%s\",\"sal\":%.2f,\"job\":\"%s\"},", empno,ename,sal,job);
	   }
	   resultJSON = resultJSON.substring( 0, resultJSON.length()-1);  
	  
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
<%=resultJSON%>
<%-- {
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
	
} --%>