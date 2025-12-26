<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 24. 오전 9:03:05</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
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
  	oracle_json
  	구글맵출력 + ajax로 맛집으로 등록된 정보를 조회해서 지도위에 출력
  </xmp>
   <a href="ex01_oracle_input.jsp">맛집 등록</a> 
  <br>
  <button id="btnDeleteMarkers">delete marker</button>
  <br>  
  
  <div id="map" style="width: 100%; height: 500px;"></div>

  <script>
    // 쌍용교육센터 위도, 경도
   let lat = 37.504770;
   let lng = 127.053175;
   
   // js 배열 저장
   var markers = [];
   
   //  type : restaurant [R], bar [B]
   var customLabel = { 
         restaurant:{ label: 'R'},
         bar:{ label: 'B'},
   };
  
    function myMap(){       
       
       const mapCanvas = document.getElementById("map");
       let mapCenter = new google.maps.LatLng( lat , lng );
       
       var mapOptions = {
             center: mapCenter
               , zoom: 15 
       };
       
       var map = new google.maps.Map(
               mapCanvas
             , mapOptions
       );
       
       // 2. ajax 요청 ->   _json_data.jsp 요청 -> 지도 위에 마커 표시
       var infoWindow = new google.maps.InfoWindow;       
       var params = null;
       
       //  
      $.ajax({
         url : "ex01_oracle_json_data.jsp",
         dataType : "json",
         type : "get",
         data : params,
         cache : false,
         success : function(data) { //  []
         // data == [
          //             {"id":100,"type":"restaurant","name":"admin","lng":127.03432487024399,"lat":37.49937084987687,"address":"seoul"}
          //             ,{"id":200,"type":"bar","name":"admin","lng":127.03231042642815,"lat":37.49895800057274,"address":"seoul"}
          //        ]
            $(data).each(
                  function(index, e) {
                     // id, type,name, lng,lat,address
                     var id = e.id;
                     var name = e.name;
                     var address = e.address;
                     var type = e.type;
                     var point = new google.maps.LatLng(
                           parseFloat(e.lat), parseFloat(e.lng));

                     var infowincontent = $("<div />");
                     var strong = $("<strong />").html(name);
                      infowincontent.append(strong).append($("<br>"));

                     var text = document.createElement('text');
                     text.textContent = address;
                      infowincontent.append(text);
                      // "restaurant"
                      // person.name == person["name"]
                     var icon = customLabel[type] || {};

                     var marker = new google.maps.Marker({
                        map : map,
                        position : point,
                        label : icon.label
                     });
                     
                     marker.addListener('click', function() {
                        infoWindow.setContent(infowincontent.html());
                        infoWindow.open(map, marker);
                     }); 
                     
                     // 모든 마커를 저장했다.
                     markers.push(marker);
                  }); // each
         }
      }); // ajax 
                
       
    } // myMap
    
    function placeMarker(map, location){
       let marker = new google.maps.Marker({
          position: location
          , map: map
       });
       // marker.setMap( map );
       
       // 정보창 표시
       let message = 'Latitude: ' + location.lat() +'<br>Longitude: '   + location.lng();
       let infoWindow = new google.maps.InfoWindow({
          content: message
       });
       infoWindow.open( map, marker );
    }
    
    // 5. 
   $("#btnDeleteMarkers").click(function (){
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);  // 마커 삭제
      }
   });
 
  </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnZn-TjIF63kzqVm95EbpOPvDL5OirMrw&callback=myMap"></script> 
  

</body>
</html>