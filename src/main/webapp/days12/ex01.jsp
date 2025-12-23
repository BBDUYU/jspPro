<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 18. 오후 4:27:51</title>
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
  	ex01
  	구글 맵 사용법
  </xmp>
  <a href="ex01_04.jsp?lat=37.504770&lng=127.053175">쌍용교육센터</a>
  <br />
  <br />
  <div id="googleMap" style="width:100%;height:400px"></div>

</div>

<script>
  function myMap(){
	  
	  var mapProp = {
			 center: new google.maps.LatLng(51.508742,-0.120850),
             zoom:5
	  };
	 var map  = new google.maps.Map(document.getElementById("googleMap"), mapProp);
  }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnZn-TjIF63kzqVm95EbpOPvDL5OirMrw&callback=myMap"></script>
</body>
</html>