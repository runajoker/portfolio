<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="vo" value="${memberVO}" />
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
  <span align="center"><h3><strong>마이페이지</strong></h3></span>
  <!-- UI Object -->
	<table width="100%" cellspacing="0" border="1" summary="myPage" class="tbl_type_sh">
	<caption>마이페이지</caption>
		<colgroup>
	<col width="140"><col><col width="120"><col>
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">아이디</th>
			<td colspan="3">${vo.m_id}</td>
		</tr>
			<tr>
			<th scope="row">이름</th>
			<td colspan="3">${vo.m_name}</td>
			</tr>
		<tr>
			<th scope="row">전화번호</th>
			<td>${vo.m_phone}</td>
			<th scope="row">회원등급</th>
				<c:choose>
					<c:when test="${vo.m_admin==3}">
						<td>주장</td>
					</c:when>
					<c:when test="${vo.m_admin==2}">
						<td>일반 팀원</td>
					</c:when>
					<c:when test="${vo.m_admin==1}">
						<td>팀이 없는 상태</td>
					</c:when>
				</c:choose>
		</tr>
		<tr>
			<th scope="row">포지션</th>
			<td>${vo.m_position}</td>
			<th scope="row">내 팀</th>
			<td>${vo.teamVO.t_name}</td>
		</tr>
	</tbody>
	</table>
	<!-- UI Object -->
	<div class="btn_cen" align="center" style="margin-top:20px;">
		<a href="/em/myPage/delete" class="btn btn-danger" ><strong>탈퇴</strong></a>
		<a href="/em/myPage/update" class="btn btn-primary" ><strong>수정</strong></a>
		<a href="/em/" class="btn btn-primary" ><strong>메인</strong></a>
	</div>


  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>