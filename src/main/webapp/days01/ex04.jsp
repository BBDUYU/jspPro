<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	int deptno;
	String dname;
	String loc;
	
	ArrayList<DeptVO> list = null;
	Iterator<DeptVO> ir=null;
	DeptVO vo=null;
	
	try{
		con=DBConn.getConnection();
		String sql="SELECT * "
				+" FROM dept";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			list=new ArrayList<>();
			do{
				deptno=rs.getInt("deptno");
				dname=rs.getString("dname");
				loc=rs.getString("loc");
				vo=new DeptVO().builder()
				.deptno(deptno)
				.dname(dname)
				.loc(loc)
				.build();
				list.add(vo);
			}while(rs.next());
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			pstmt.close();
			DBConn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 8. 오후 2:59:21</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/webPro/images/SiSt.ico">
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
  	ex04
  </xmp>
<select>
	<option>부서선택</option>
	<%
		ir=list.iterator();
		while(ir.hasNext()){
			vo=ir.next();
			
		}
	%>
</select>  
</div>

<script>
  
</script>

</body>
</html>