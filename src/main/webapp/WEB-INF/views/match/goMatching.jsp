<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 이거 5개는 항상 갖구다닐꺼 -->
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >

<script type="text/javascript" 
		src="//apis.daum.net/maps/maps3.js?apikey=238e33b9df2eb3dfe7689597a3a88d32&libraries=services"></script>
<script type="text/javascript">
function showMap(){
	var addr = document.getElementById('addr').value;
	var s_name = addr.substring(addr.indexOf(',')+2);
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다   
	var geocoder = new daum.maps.services.Geocoder();// 주소-좌표 변환 객체를 생성합니다
	
	geocoder.addr2coord(addr, function(status, result) {// 주소로 좌표를 검색합니다
	    
	     if (status === daum.maps.services.Status.OK) {// 정상적으로 검색이 완료됐으면 
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + s_name + '</div>'
	        });
	        infowindow.open(map, marker);// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
}
</script>
<script type="text/javascript">
function check(){
	var stime=$('#stime').val().substring(0,2);
	var etime=$('#etime').val().substring(0,2);
	if(etime>stime){
		$('#gomat').submit();
	}else{
		alert('시작-종료 시간을 확인해주시기 바랍니다.');
	}
}

</script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<!-- Jumbotron -->
<div class="jumbotron">
  <div class="row">
	<span align="center"><h3><strong>매칭 신청</strong></h3></span>
	<form class="form-horizontal" action="goMatching" id="gomat" method="post" style="padding-left: 140px;padding-top: 30px">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label" >원하는 날짜</label>
		    <div class="col-sm-10">
		      <input type="date" class="form-control" placeholder="date" name="mat_time_date" style="width:70%;">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">원하는 시간(부터)</label>
		    <div class="col-sm-10">
		      <input type="time" class="form-control" id="stime" placeholder="time" style="width:70%;" name="mat_time_time_start">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">원하는 시간(까지)</label>
		    <div class="col-sm-10">
		      <input type="time" class="form-control" id="etime" placeholder="time" style="width:70%;" name="mat_time_time_end">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">원하는 장소</label>
		    <div class="col-sm-10">
		    	<select class="form-control" style="width:60%;" name="mat_place" id="addr">
				  	<c:forEach var="list" items="${list}">
						<option>${list.REFINE_LOTNO_ADDR},&nbsp;${list.FACLT_NM}</option>
					</c:forEach>
				</select>
				<input type="button" class="btn btn-primary" value="지도보기" onclick="showMap();" style="width:70%;" />
				<div id="map" style="width:500px;height:250px;align:center;"></div>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">매칭소개글</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" rows="3" name="mat_memo" style="width:70%;" required="required"></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		   	 	<input type="button" class="btn btn-danger" value="매칭 신청" onclick="check();" style="width:70%;" />
		    </div>
		  </div>
	</form>

  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>