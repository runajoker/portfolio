<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#calCap{text-align: center;}
#cap{font-size: 30px; padding-left: 20px; padding-right: 20px;}
#matchingDay{padding-top: 20px;}
</style>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.js"/>"></script>
<script type="text/javascript" >
$(function(){
	$.getJSON("../match/matchingScheduleJSON", function(data){
		var cnt = '<table border="1" align="center">';
		cnt += '<tr align="center"><td width="100" height="50"><h4><strong style="color:red;">일</strong></h4></td><td width="100"><h4><strong>월</strong></h4></td><td width="100"><h4><strong>화</strong></h4></td><td width="100"><h4><strong>수</strong></h4></td>';
		cnt += '<td width="100"><h4><strong>목</strong></h4></td><td width="100"><h4><strong>금</strong></h4></td><td width="100"><h4><strong style="color:blue;">토</strong></h4></td></tr>';
		cnt += '<c:forEach var="i" begin="0" end="5">';
		cnt += '<tr align="center">';
		cnt += '<c:forEach var="j" begin="0" end="6">';
		cnt += '<td width="100" height="50">';
		$.each(data, function(key, val){
			var a = '${cal_map.year}-${cal_map.month}-${cal[i][j]}';
			var b = val['mat_time'];
			
			if('${cal[i][j]}'<=9){a = '${cal_map.year}-${cal_map.month}-0${cal[i][j]}';}
			if(a==b){
				cnt += '<a id="dt" href="./matchingSchedule?year=${cal_map.year}&&month=${cal_map.month}&&date=${cal[i][j]}">';
				cnt += '경기 수 : ' + val['cnt'] + '<br/>';
				cnt += '</a>';
			}
		});
			if(${cal[i][j]}!=0){
				if(${j}==0){
					cnt += '<strong style="color:red;">${cal[i][j]}</strong>';
				}else if(${j}==6){
					cnt += '<strong style="color:blue;">${cal[i][j]}</strong>';
				}else{
			 		cnt += '<strong>${cal[i][j]}</strong>';
				}
			}else{
				cnt += '';
			}
		cnt += '<br/></td></c:forEach></tr></c:forEach></table>';
		$('#matchingDay').html(cnt);
	});
});
</script>
<div id="calCap">
	<c:choose>
		<c:when test="${cal_map.month==1}">
		<button type="button" id="write" class="btn btn-default" onclick="location.href='./matchingSchedule?year=${cal_map.year-1}&&month=12&&date=1'">이전달</button>
		</c:when><c:otherwise>
		<button type="button" id="write" class="btn btn-default" onclick="location.href='./matchingSchedule?year=${cal_map.year}&&month=${cal_map.month-1}&&date=1'">이전달</button>
		</c:otherwise></c:choose>
		<span id="cap">${cal_map.year}년 ${cal_map.month}월 매칭 월력표</span>
		<c:choose><c:when test="${cal_map.month==12}">
		<button type="button" id="write" class="btn btn-default" onclick="location.href='./matchingSchedule?year=${cal_map.year+1}&&month=1&&date=1'">다음달</button>
		</c:when><c:otherwise>
		<button type="button" id="write" class="btn btn-default" onclick="location.href='./matchingSchedule?year=${cal_map.year}&&month=${cal_map.month+1}&&date=1'">다음달</button>
		</c:otherwise>
	</c:choose>
</div>

<div id="matchingDay"></div>


</body>
</html>