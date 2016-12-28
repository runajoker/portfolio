<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<!-- Jumbotron -->
<div class="jumbotron">
  <div class="row" align="center">
<span style="color:red;">현재 팀이 등록되어있지 않습니다.</span>
<span style="color:black;"><h3><strong>참여 가능한 팀 목록</strong></h3></span>
<table class="table table-condensed" style="width: 1050px;">
	<tr>
		<th>지역</th>
		<th>팀명</th>
		<th>주장</th>
		<th>전적</th>
		<th>팀원수</th>
		<th>소개글</th>
	</tr>
<c:forEach items="${teamList}" var="vo">
	<tr>
		<td>${vo.t_place}</td>
		<td><a href="${vo.t_no}/"> ${vo.t_name}</a></td>
		<td>${vo.t_captain}</td>
		<td>${vo.t_record_win} / ${vo.t_record_draw} / ${vo.t_record_lose}</td>
		<td>${vo.memberVO.m_no}</td>
		<td>
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="size:50%;">소개글보기</button>
             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">${vo.t_name}팀이 남긴 메모</h4>
			      </div>
			      <div class="modal-body">
			        ${vo.t_intro}
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
		</td>
	</tr>
</c:forEach>
</table>
<input type="button" class="btn btn-primary" value="팀 만들기" onclick="location.href='insert'" style="width:100%;" />
  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>