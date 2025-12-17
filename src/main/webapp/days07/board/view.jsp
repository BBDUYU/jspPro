<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String contextPath = request.getContextPath();
%>
<%
	String sessionName = "auth";
	String logonId  = null;
	
	logonId=(String)session.getAttribute(sessionName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 11. 오후 4:11:13</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>

<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    MVC view.jsp
  </xmp>
  
  <h2>글 내용 보기</h2>
  
  <table>
    <tbody>
      <tr>
        <td>이름</td>
        <td>${ dto.writer }</td>
        <td>등록일</td>
        <td>${ dto.writedate }</td>
      </tr>
      <tr>
        <td>Email</td>
        <td>${ dto.email }</td>
        <td>조회수</td>
        <td>${ dto.readed }</td>
      </tr>
      <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td> 
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="3" class="full" style="height: 200px;vertical-align: top">${ dto.content }</td> 
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="4" align="center">
          <c:if test="${dto.writer eq sessionScope.auth}">
	          <a href="<%= contextPath %>/board/edit.do?seq=${dto.seq}&currentPage=${param.currentPage}&numberPerPage=${param.numberPerPage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}">수정하기</a>
	          <a href="<%= contextPath %>/board/delete.do?seq=${dto.seq}&currentPage=${param.currentPage}&numberPerPage=${param.numberPerPage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}">삭제하기</a>
	          <!-- jquery.com 모달창 삭제 -->
	          <input type="button" id="btnModalDelete" value="모달창 삭제">
          </c:if>
          
          
          <a href="<%= contextPath %>/board/list.do?currentPage=${param.currentPage}&numberPerPage=${param.numberPerPage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}">Home</a>
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>

<!-- 삭제 모달차 div -->
<div id="dialog-form" title="삭제 모달창">
  <h2>삭제하기</h2>
  
  <form method="post" action="<%= contextPath %>/board/delete.do?seq=${ param.seq }">
    <table>
      <tr>
        <td colspan="2" align="center">
          <b>글을 삭제합니다.</b>
        </td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td>
         <input type="password" name="pwd" size="15" autofocus="autofocus">
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="삭제">
          &nbsp;&nbsp;
          <!-- <input type="button" value="취소" id="cancel" onclick="history.back();"> -->
          <%-- <input type="button" value="취소" id="cancel" onclick="location.href='view.htm?seq=${param.seq}'"> --%>
          <input type="button" value="취소" id="cancel">
        </td>
      </tr>
    </table>
    
    <span style="color:red;display: none" id="spn">비밀번호가 잘못되었습니다.</span>
    
  </form>
</div>

<script>
var dialog, form;
dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 400,
    width: 350,
    modal: true,
    buttons: {
    },
    close: function() {
      form[ 0 ].reset();
    }
  }); 

 form = dialog.find( "form" );
 
 $("#btnModalDelete").on("click", function (){
	  dialog.dialog( "open" );
 });
 
 $("#cancel").on("click", function (){
	  dialog.dialog( "close" );
 });
 
 // http://localhost/jspPro/cstvsboard/view.htm?seq=148&delete=fail
 // 삭제 실패 요청 URL
 //if(  ${ param.delete == 'fail' } ){
 if(  ${ param.delete eq 'fail' } ){	  // EL empty 연산자 eq 연산자 ==  
	 dialog.dialog( "open" );
     $("#spn").show().slideToggle(3000);
	 // alert('<%= request.getParameter("seq") %>의 비밀번호가 틀립니다!!!');
 } // if	
</script>  
</body>
</html>







