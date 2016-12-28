<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertTeam</title>
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
    <span align="center"><h3><strong>팀 생성</strong></h3></span>
<form action="insert" method="post" >
<table class="table table-condensed" width="1000px">
<tr>
	<th><h5><strong>팀명</strong></h5></th>
	<td><input type="text" class="form-control" placeholder="제목"  style="width:60%;" name="t_name"></td>
</tr>
<tr>
	<td><h5><strong>지역구</strong></h5></td>
	<td>
	<select class="form-control" style="width:60%;" name="t_place" id="addr">
			<option>안성</option>
			<option>수원</option>
			<option>화성</option>
			<option>평창</option>
			<option>평택</option>
			<option>시흥</option>
			<option>광명</option>
			<option>광주</option>
			<option>이천</option>
			<option>구리</option>
			<option>양주</option>
			<option>안성</option>
			<option>의왕</option>
			<option>여주</option>
			<option>안산</option>
			<option>남양주</option>
	</select>
	</td>
</tr>
<tr>
	<td><h5><strong>소개글</strong></h5></td>
	<td><textarea class="form-control" rows="3" name="t_intro" style="width:70%;" required="required"></textarea></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" class="btn btn-primary" value="확인" /></td>
</tr>
</table>
</form>
  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>
