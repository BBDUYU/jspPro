<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
	Thread.sleep(3000);

	Connection conn = ConnectionProvider.getConnection();
	Statement stmt = conn.createStatement();
	
	String sql ="with temp as(select empno, ename, sal , rank() over(order by sal desc )   r from emp ) select * from temp where r <=10";
	ResultSet rs = stmt.executeQuery(sql);
	
	Calendar cal = Calendar.getInstance();
	String now = String.format("%tT",cal);
	
	JSONObject jobj = new JSONObject();
	JSONArray jarr = new JSONArray();
	
	while(rs.next()){
		int empno = rs.getInt(1);
		String ename = rs.getString(2);
		int sal = rs.getInt(3);
		int rank = rs.getInt(4);
		
		JSONObject empobj = new JSONObject();
			empobj.put("empno",empno);
			empobj.put("ename",ename);
			empobj.put("sal",sal);
			empobj.put("rank",rank);
		jarr.add(empobj);
	}
	jobj.put("emp",jarr);
	conn.close();
	
%>
<%= jobj%>