<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="vo" value="${messageVO}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 이거 5개는 항상 갖구다닐꺼 -->
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script
	src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/navbar-static-top.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/myPage/myPage.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/pageBtn.css" />">
<script>
	function checking() {

		var sure = confirm('삭제하시겠습니까?');
		if (sure) {
			return true;
		}

		return false

	}
</script>
<style>
.tbl_type {
		width:50%;
}
</style>
</head>
<body>
	<%@ include file="/resources/includeFile/header.jsp"%>
	<div class="jumbotron">
		<div class="row">
			<h3>쪽지 상세보기</h3>
			<table class="tbl_type">
				<tr>
					<th th width="20%">받은 사람</th>
					<td>${vo.m_id}(${vo.m_name})</td>
				</tr>
				<tr>
					<th th width="20%">날짜</th>
					<td>${vo.g_regdate}</td>
				</tr>
				<tr>
					<td colspan="2">${vo.g_content}</td	>
				</tr>
			</table>
			<div>
				<form name="input" method="POST" action="../deleteMsg/${vo.g_no}"
					onsubmit="return checking()">
					<input type="hidden" name="status" value="send" /> <input
						type="submit" class="btn btn-danger" value="삭제" />
				</form>

			</div>
		</div>
		<!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp"%>
</html>