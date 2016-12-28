<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	/** checkbox 처리를 위한 function **/
	function check() {
		cbox = input.chk;
		if (cbox.length) {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = input.all.checked;
			}
		} else {
			cbox.checked = input.all.checked;
		}
	}

	/** 체크가 안된 경우 null Exception 막기 위해**/
	function checking() {

		if (document.input.chk.checked == true) {
			var sure = confirm('삭제하시겠습니까?');
			if (sure) {
				return true;
			}
			return false;
		}

		for (var i = 0; i < document.input.chk.length; i++) {
			if (document.input.chk[i].checked == true) {
				var sure = confirm('삭제하시겠습니까?');
				if (sure) {
					return true;
				}
			}
		}
		return false

	}
</script>
</head>
<body>
	<%@ include file="/resources/includeFile/header.jsp"%>
	<div class="jumbotron">
		<div class="row">
			<h3>
			보낸 쪽지함
				<a href="../reciveMsg/">받은 쪽지함</a> 
			</h3>
			<table class="tbl_type">
				<tr>
					<form name="input" method="post" action="../deleteMsg/"
						onsubmit="return checking()">
						<td width="8%"><input type="hidden" name="status" value="send">
						<input type="checkbox" name="all" onclick="check();" /></td>
						<th width="8%">받은 사람</th>
						<th>내용</th>
						<th width="18%">날짜</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td width="8%"><input type="checkbox" name="chk" value="${vo.g_no}" /></td>
						<td width="8%">${vo.m_id}(${vo.m_name})</td>
						<td><a href="${vo.g_no}">${vo.g_content}</a></td>
						<td width="18%">${vo.g_regdate}</td>

					</tr>

				</c:forEach>
			</table>

			<input type="submit" class="btn btn-danger" value="삭제" />
			</form>
		</div>
		<!-- row -->
	</div>
	<!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp"%>
</html>