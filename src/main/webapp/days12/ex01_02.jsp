<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 23. 오전 7:09:30</title>
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
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    days12.ex01_02.jsp 
    오버레이( 구글 지도 상에 위도/경도 좌표에 연결된 객체 ) 추가
     ㄴ 마커 - 아이콘 이미지 표시
        1) new google.maps.Marker() 객체 생성 +  position 속성 설정
        2) 지도에 마커를 추가    setMap() 메서드 
        
     ㄴ 폴리라인
     ㄴ 다각형
     ㄴ 원***/사각형
     ㄴ 정보창
          - 마커에 대한 텍스트 내용이 포함된 정보창
          1) new google.maps.InfoWindow()
          2) 정보창.open()
          
     ㄴ 사용자 정의 오버레이.
     
     마커 대신에 아이콘 표시
  </xmp>
  
  <!-- 지도를 출력할 컨테이너 div 태그 선언 -->
  <div id="googleMap" style="width: 100%;height:400px"></div>
  
  <script>
    function myMap(){
       //                                     쌍용교육센터 위도, 경도
       let lat = <%= request.getParameter("lat") %>;
       let lng = ${ param.lng };
       
       const mapCanvas = document.getElementById("googleMap");
       let mapCenter = new google.maps.LatLng( lat , lng );
       
       var mapOptions = {
             center: mapCenter
               , zoom: 15 
       };
       
       var map = new google.maps.Map(
               mapCanvas
             , mapOptions
       );
       
       // 쌍용교육센터 좌표에 마커 표시
       let marker = new google.maps.Marker({
          position: mapCenter
          // , animation: google.maps.Animation.BOUNCE
          , icon: "pinkball.png"
       });
       marker.setMap( map );
       
       /*
       var myCity = new google.maps.Circle({
            center:mapCenter,
            radius:200,
            strokeColor:"#0000FF",
            strokeOpacity:0.8,
            strokeWeight:2,
            fillColor:"#0000FF",
            fillOpacity:0.4
          });
       myCity.setMap( map );
       */
       
       // 정보창 표시
       let message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";;
       let infoWindow = new google.maps.InfoWindow({
          content: message
       });
       infoWindow.open( map, marker );
    }
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=&callback=myMap"></script> 
</div>
<script>
</script>  
</body>
</html>
