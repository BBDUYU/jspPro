<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 24. 오전 9:02:45</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>-->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>

<!-- jquery.com UI 모달창 -->
<link rel="stylesheet"    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
  	ex01_oracle_input
  </xmp>
  
  <div id="map" style="width: 100%;height:500px"></div>
  
  <!-- Modal -->
   <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog" style="width: 350px">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">위치 정보 입력</h4>
            </div>
            <div class="modal-body"> 
               <div style="text-align: center">
                  <form id="form1" action="ex01_oracle_input_ok.jsp" method="post">
                     <table style="width:300px;text-align: center" border="1">
                     
                        <tr><td>ID</td></tr>
                        <tr><td><input type="text" name="id" value="100"></td></tr>
                        <tr><td>TYPE</td></tr>
                        <tr><td><input type="text" name="type" value="restaurant or bar"></td></tr>
                        <tr><td>NAME</td></tr>
                        <tr><td><input type="text" name="name" value="admin"></td></tr>
                        <tr><td>ADDRESS</td></tr>
                        <tr><td><input type="text" name="address" value="seoul"></td></tr>
                        <tr>
                           <td><input type="button" id="btnSave" value="저장"></td>
                        </tr>
                     </table>
   <input type="hidden" id="h_lat" name="lat" value="" />
   <input type="hidden" id="h_lng" name="lng" value="" />
                  </form>
               </div>

            </div>
            <div class="modal-footer">
               <button type="button" onclick="modal_close();" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>

      </div>
   </div>
</div>


<script>
	$("#btnSave").on("click",function(){
		if(confirm("저장하시겠습니까?")){
			$("#form1").submit();
		}
	});

	function modal_close(){
		if(typeof marker != 'undefined'){
			marker.setMap(null);
		}
	}
</script>
  <script>
    function myMap(){
       //1                                     쌍용교육센터 위도, 경도
       let lat=37.504770;
       let lng=127.053175;
       
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
       //2
       google.maps.event.addListener(map,"click",function(event){
    	   let location = event.latLng;
    	   placeMarker(map, location);
    	   // 모달창 띄우기
    	   $("#h_lng").val(event.latLng.lng());
    	   $("#h_lat").val(event.latLng.lat());
    	   $("#myModal").modal("show");
       })
       function placeMarker(map, location){
    	   let marker = new google.maps.Marker({
    	          position: location
    	          ,map : map
    	       });
    	       marker.setMap( map );
    	       
    	       let message = 'Latitude: ' + location.lat() + 
    	         '<br>Longitude: '   + location.lng();
    	       let infoWindow = new google.maps.InfoWindow({
    	          content: message
    	       });
    	       infoWindow.open( map, marker );
       }
    }
  </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnZn-TjIF63kzqVm95EbpOPvDL5OirMrw&callback=myMap"></script> 
  

</body>
</html>