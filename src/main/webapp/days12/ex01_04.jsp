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
    days12.ex01_04.jsp 
    쌍용교육센터의 임의의 위치에 맛집 마커 표시 
  </xmp>
  
  <!-- 지도를 출력할 컨테이너 div 태그 선언 -->
  <div id="googleMap" style="width: 100%;height:400px"></div>
  
    <script>
    function getRndNumber(min, max) {
      return (Math.random() * (max - min) ) + min;
   }
 
  
    function myMap(){
       // 쌍용교육센터 위도, 경도
       let lat=37.504770;
       let lng=127.053175;
       
       const mapCanvas = document.getElementById("googleMap");
       let mapCenter = new google.maps.LatLng( lat , lng );
       
       var mapOptions = {
             center: mapCenter
               , zoom: 5
       };
       
       var map = new google.maps.Map(
               mapCanvas
             , mapOptions
       );
       
        // 1. 마커 표시
      let marker = new google.maps.Marker({
         position : mapCenter
         // , animation : google.maps.Animation.BOUNCE
         ,
         icon : "pinkball.png"
      });
      marker.setMap(map);

      // 2. 정보창 표시
      let message = "<a href='http://www.sist.co.kr'><img alt='lezhin.com 로고' src='//img-s-msn-com.akamaized.net/tenant/amp/entityid/BBFwET1.img'></a>";
      let InfoWindow = new google.maps.InfoWindow({
         content : message
      });
      InfoWindow.open(map, marker);
      
      // 마커를 클릭할 때 이벤트 처리 - 클릭된 위치에 정보창을 표시
      google.maps.event.addListener( marker , "click", function() {
         map.setZoom(15);
         map.setCenter(marker.getPosition());
         
         // 클릭할 때 정보창 표시
         InfoWindow.open(map, marker);
         
         // 3초 후에 자동으로 정보창을 닫자.
         window.setTimeout(()=> {
            InfoWindow.close();
            map.setZoom(5);
         },3000);
      });
      
       
       
       
    }
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnZn-TjIF63kzqVm95EbpOPvDL5OirMrw&callback=myMap"></script> 
</div>
<script>
</script>  
</body>
</html>