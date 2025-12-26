<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2025. 12. 26. 오전 9:04:14</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>

	<link rel="stylesheet" type="text/css" href="/jspPro/days14/dhtmlxSuite_v51_std/codebase/fonts/font_roboto/roboto.css"/>
	<link rel="stylesheet" type="text/css" href="/jspPro/days14/dhtmlxSuite_v51_std/codebase/dhtmlx.css"/>
	<script src="/jspPro/days14/dhtmlxSuite_v51_std/codebase/dhtmlx.js"></script>
	<script src="/jspPro/days14/dhtmlxSuite_v51_std/samples/dhtmlxChart/common/testdata.js"></script>
	<style>
		.container{
			position:relative;
			width:450px;
			height:350px;
			
			border:dotted 1px #555;
			padding:10px;
			margin-top:10px;
		}
		.loader{
			position:absolute;
			top:0;
			left:0;
			width:100%;
			height:100%;
			background:rgba(255,255,255,0) url('ajax_loader.gif') no-repeat 50% 50%;
		}
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
  		
  </xmp>
  <a href="#" class="load">Ajax Chart</a>
  <br />
  	<div id="container" class="container" style="width:600px;height:250px;border:1px solid #c0c0c0;margin:20px"></div>
  <script>
  		// js 객체 변수
  		// res.container==$("#container")
  		var res={
  			container:$(".container"),
  			//,loader:$("<div class='.loader'></div>")
  			loader:$("<div/>",{"class":"loader"})
  		};
  
		var myLineChart;
		//function doOnLoad() {
			
			myLineChart =  new dhtmlXChart({
				view:"bar",
				container:"container",
				value:"#sal#",
				label:"#sal#",
				item:{
					borderColor: "#1293f8",
					color: "#ffffff"
				},
				line:{
					color:"#1293f8",
					width:3
				},
				xAxis:{
					template:"'#ename#"
				},
				offset:0,
				yAxis:{
					start:0,
					end:10000,
					step:1000,
					template:function(obj){
						return (obj%20?"":obj)
					}
				}
			});
			//myLineChart.parse(dataset,"json");
		//}
		$("a.load").on("click",function(){
			$.ajax({
				url:"ex01_emp_chart.jsp",
				dataType:"json",
				type:"get",
				cache:false,
				beforeSend:function(xhr){
					res.container.empty().append(res.loader);
				}, 
				success:function(data){
					res.container.find(res.loader).remove();
					myLineChart.parse(data.emp,"json");
				},
				error:function(){
					res.container.find(res.loader).remove();
					alert("에러");
				}
			});
		});
	</script>
</div>

<script>
  
</script>

</body>
</html>