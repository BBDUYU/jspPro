<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//DB연동 ID,PASSWD체크X
	//회원 admin/1234
	//회원 hong/1234
	//회원 kim/1234
	HashMap<String,String> memberMap = new HashMap<String,String>();
	memberMap.put("admin","1234");
	memberMap.put("hong","1234");
	memberMap.put("kim","1234");
	
	// 아이디 존재 유무 확인 : memberMap.get(id) == null
	String location = request.getContextPath();
	if(memberMap.containsKey(id)){
		if(memberMap.get(id).equals(passwd)){
			location = "/days03/ex06_main.jsp";
			// 로그인 성공
			//	 ㄴ 인증정보들을 세션, 쿠키, DB로 상태 저장
		}else{
			//아이디는 존재, 비밀번호가 잘못됨
			location = "/days03/ex06.jsp?error=1002";
		}
	}else{
		//아이디가 존재하지 않다
		location = "/days03/ex06.jsp?error=1001";
	}
	
	//리다이렉트
	/* response.sendRedirect(location); */
	//포워드
	RequestDispatcher dispatcher = request.getRequestDispatcher(location); 
	dispatcher.forward(request, response);
%>