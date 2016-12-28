<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="info" value="${teamInfo}" />
<c:set var="admin" value="${info.memberVO.m_admin}" />
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
<link rel="stylesheet" href="<c:url value="/resources/myPage/myPage.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/pageBtn.css" />" >
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row">
  <span align="center"><h3><strong>전체 팀보기</strong></h3></span>
  <!-- UI Object -->
	<table width="100%" cellspacing="0" border="1" summary="myPage" class="tbl_type">
	<caption>마이페이지</caption>
	<colgroup>
	<col width="140"><col><col width="120"><col>
	</colgroup>
	<tbody>
		<tr>
			<th>팀명</th>
			<th>지역</th>
			<th>주장</th>
			<th>전적</th>
			<th>팀원수</th>
		</tr>
		<c:forEach items="${teamList}" var="vo">
			<tr>
				<td><a href="${vo.t_no}/"> ${vo.t_name}</a></td>
				<td>${vo.t_place}</td>
				<td>${vo.t_captain}</td>
				<td>${vo.t_record_win} / ${vo.t_record_draw} / ${vo.t_record_lose}</td>
				<td>${vo.memberVO.m_no}</td>
			</tr>
		</c:forEach>
	
	</tbody>
	</table>

  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>