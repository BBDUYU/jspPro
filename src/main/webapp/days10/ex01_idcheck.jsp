<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String empno = request.getParameter("empno");
	String sql = " SELECT COUNT(*) cnt "
	           +" FROM emp "
	           +" WHERE empno = ? ";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//  JSON =  { "count":0 } 응답
	String resultJSON = null;        
	try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, empno);
	   rs = pstmt.executeQuery();     
	   rs.next();
	   int cnt = rs.getInt("cnt"); 
	   resultJSON = String.format("{ \"count\":%d }", cnt );
	}catch(Exception e){
	   e.printStackTrace();
	}finally{
	   JdbcUtil.close(rs);
	   JdbcUtil.close(pstmt);
	   JdbcUtil.close(conn);
	}
%>
<%=resultJSON%>