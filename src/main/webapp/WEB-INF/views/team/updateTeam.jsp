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
<div class="jumbotron">
  <div class="row" align="center">
    <span align="center"><h3><strong>${vo.t_name}팀 수정</strong></h3></span>
<form action="update" method="post">
<table class="table table-condensed">
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
	<td>
		<select name="t_place">
			<option value='서울' <c:if test="${vo.t_place == '서울'}">selected</c:if>>서울</option>
			<option value='수원' <c:if test="${vo.t_place == '수원'}">selected</c:if>>수원</option>
			<option value='부산' <c:if test="${vo.t_place == '부산'}">selected</c:if>>부산</option>
			<option value='광주' <c:if test="${vo.t_place == '광주'}">selected</c:if>>광주</option>
		</select>
	</td>
</tr>
<tr>
	<td>팀소개</td>
	<td><input type="text" name="t_intro" value="${vo.t_intro}"></td>
</tr>
<tr>
	<td>팀 전적</td>
	<td><input type="hidden" name="t_record" value="${vo.t_record_win} / ${vo.t_record_draw} / ${vo.t_record_lose}">${vo.t_record_win} / ${vo.t_record_draw} / ${vo.t_record_lose}</td>
</tr>
<tr>
	<td>
		<input type="submit" class="btn btn-primary" value="수정">
		<input type="reset" class="btn btn-danger" value="취소" onclick="location.href='../team/'">
	</td>
</tr>
</table>

</form>

  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>