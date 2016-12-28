<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="vo" value="${teamInfo}" />
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
  <span align="center"><h3><strong>${vo.t_name}팀의 정보</strong></h3></span>
<form action="../${vo.t_no}/" method="post">
<table class="table table-condensed">
<caption>팀 화면입니다.</caption>
<tr>
	<td>팀이름</td>
	<td>${vo.t_name}</td>
</tr>
<tr>
	<td>팀주장</td>
	<td>${vo.t_captain}</td>
</tr>
<tr>
	<td>활동지역</td>
	<td>${vo.t_place}</td>
</tr>
<tr>
	<td>팀소개</td>
	<td>${vo.t_intro}</td>
</tr>
<tr>
	<td>팀 전적</td>
	<td>${vo.t_record_win} / ${vo.t_record_draw} / ${vo.t_record_lose}</td>
</tr>

</table>
<input type="submit" class="btn btn-primary" value="가입하기">
<input type="reset" class="btn btn-danger" value="취소하기" onclick="location.href='../'" />
</form>

  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>