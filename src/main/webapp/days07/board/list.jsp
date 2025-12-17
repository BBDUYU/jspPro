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
<title>2025. 12. 11. 오후 12:32:32</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
	<c:if test="${ empty sessionScope.auth }">
	      <li><a href="<%= contextPath %>/days08/ex04_default.jsp">로그인</a></li>
	    </c:if>
	    <c:if test="${ not empty sessionScope.auth }">
	      <li>[<%= logonId %>]님 로그인하셨습니다.
	        <a href="<%= contextPath %>/days08/ex04_logout.jsp">로그아웃</a></li>
	    </c:if>
  </ul>
</header>
<div>
  <xmp class="code">
    MVC list.jsp
  </xmp>
  
  <h2>목록 보기</h2>
  
  <a href="<%= contextPath %>/board/write.do">글 쓰기</a>
  <br>
  
  <select id="cmbNumberPerPage" name="cmbNumberPerPage" style="margin: 10px"></select>
  <script>
    for (var i = 10; i <= 50; i+=5) {
    	$("#cmbNumberPerPage").append(`<option>\${i}</option>`);
    }
    
    $("#cmbNumberPerPage").on("change", function (){
    	let npp = $(this).val();
    	location.href = `<%= contextPath %>/board/list.do?currentPage=${pvo.currentPage}&numberPerPage=\${npp}`;
    });
    // 상태 관리
    $("#cmbNumberPerPage").val(${pvo.numberPerPage});
  </script>
  <br>
  
  <table>
    <thead>
      <tr>
        <th width="10%">번호</th>
        <th width="45%">제목</th>
        <th width="17%">작성자</th>
        <th width="20%">등록일</th>
        <th width="10%">조회</th>    
      </tr>
    </thead>
    <tbody>
      <c:choose>
        <c:when test="${ empty list }">
          <tr>
            <td colspan="5">등록된 게시글이 없습니다.</td>
          </tr>
        </c:when>
        <c:otherwise>
          <c:forEach items="${ list }" var="dto">
          <tr>
           <td>${ dto.seq }</td>
           <td><a class="title" href="<%= contextPath %>/board/view.do?seq=${ dto.seq }">${ dto.title }</a></td>
           <td>${ dto.writer }</td>
           <td>${ dto.writedate }</td>
           <td>${ dto.readed}</td>
          </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose> 
      
      <script>
        // 게시글의 제목을 클릭할 때 seq, currentPage, numberPerPage 파라미터로 설정..
        $("a.title").attr("href", function (index, oldHref){
        	let cp  = ${pvo.currentPage};
        	let npp = ${ pvo.numberPerPage };
        	let sc  = '${ param.searchCondition }';	 
      	    let sw  = '${ param.searchWord}';
        	return `\${oldHref}&currentPage=\${cp}&numberPerPage=\${npp}&searchCondition=\${sc}&searchWord=\${sw}`;
        });
      </script>
      
    </tbody>
    <tfoot>
      <tr>
        <td colspan="5" align="center">
          <!-- [1] 2 3 4 5 6 7 8 9 10 next -->
          <div class="pagination"> 
            <c:if test="${ pvo.prev }">
              <a href="${ pvo.start - 1 }">&lt;</a>
            </c:if>
            <c:forEach begin="${ pvo.start }" end="${ pvo.end }" step="1" var="i">
              <!-- http://localhost/jspPro/cstvsboard/2 -->
              <!-- http://localhost/jspPro/cstvsboard/list.htm?currentPage=2 -->
              
              <c:choose>
                <c:when test="${ pvo.currentPage eq i }">
                   <a href="${ i }" class="active">${ i }</a>
                </c:when>
                <c:otherwise>
                  <a href="${ i }">${ i }</a>
                </c:otherwise>
              </c:choose> 
              
            </c:forEach>
            <c:if test="${ pvo.next }">
              <a href="${ pvo.end + 1 }">&gt;</a>
            </c:if>
          </div>
<script>
  $(".pagination a:not(.active)").attr("href", function (index, oldHref){
	  //  http://localhost/jspPro/cstvsboard/list.htm?currentPage=12
	  let npp  = ${ pvo.numberPerPage};	 
	  let sc  = '${ param.searchCondition }';	 
	  let sw  = '${ param.searchWord}';	  

	  return `<%= contextPath %>/board/list.do?currentPage=\${oldHref}&numberPerPage=\${npp}&searchCondition=\${sc}&searchWord=\${sw}`;
	  
  });
  
  $(".pagination a.active").on("click", function (){
 	 event.preventDefault();
  });
</script> 
        </td>
      </tr>
      <tr>
        <td colspan="5" align="center">
          <form>
            <select name="searchCondition" id="searchCondition">
            	<option value="t">title</option>
            	<option value="c">content</option>
            	<option value="w">writer</option>
            	<option value="tc">title+content</option>
            </select>
            <input type="text" id="searchWord" name="searchWord">
            <input type="submit" value="search">
            
          </form>
         </td>         
      </tr>
    </tfoot>
  </table>
  <br>
  <a href="<%= contextPath %>/board/write.do">글 쓰기</a>
  <br>
 
</div>

<script>
  // 상태관리
  $("#searchCondition").val('${ empty param.searchCondition ? "t" : param.searchCondition }');
  $("#searchWord").val('${param.searchWord}');
</script> 
</body>
</html>



