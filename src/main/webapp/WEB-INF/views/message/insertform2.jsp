<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${sessionScope.memberInfo}" var="session" />
<c:if test="${memberId ne null}">
	<c:set var="mbId" value="${memberId}" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script language="javascript" type="text/javascript">
	//검색 누르면 새창 작게 뜨게
	function id_check() {
		var com_url = '../searchId/';
		var a = document.getElementById('usr_id');
		var usr_id = a.value;
		$.ajax({
			url : com_url,
			method : 'post',
			data : {
				m_id : usr_id
			}
		}).done(function(data) {

			var addHTML = '';
			if(data != ''){
				var con = confirm(usr_id + '에게 보내시겠습니까?');
				if(con) {
				$('#hidden_m_no').val(<c:out value="${session.m_no}" />);
					$('#hidden_send_no').val(data.m_no);
					addHTML += '' + data.m_id;
					addHTML += '(' + data.m_name;
					addHTML += ')';
				
				
				$('#viewUser').html(addHTML);
				} else {
					$('#usr_id').val('');
				}
			} else {
				alert(usr_id+'는 없는 회원입니다');
			}
					}).fail(function() {
		    alert( "error" );
		  })
	};
	function moveUp() {
		location.href='../reciveMsg/';
	}
</script>
</head>
<body>
	<%@ include file="/resources/includeFile/header.jsp"%>
	<div class="jumbotron">
		<div class="row">
			<h3>쪽지 보내기</h3>
			<br />
			<table class="tbl_type_sh">
				<form action="/em/message/insert/action" method="post">
					<tr>
						<th width="15%">받는사람</th>
						<td>
							<div id="viewUser">
								<input type="text" id="usr_id" /> <input type="button"
									value="검색" class="btn btn-primary" id="search_id"
									onclick="javascript:id_check();" />
							</div> <!-- DB구조상 뒤바뀌는게 맞음 --> <input type="hidden" name="m_no"
							id="hidden_m_no" /> <input type="hidden" name="g_send_no"
							id="hidden_send_no" value="내번호" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" name="g_content"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" class="btn btn-primary" value="전송"> <input type="button" class="btn btn-danger" value="취소" onclick="javascript:moveUp();"></td>
					</tr>
				</form>
			</table>
		</div>
		<!-- row -->
	</div>
	<!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp"%>
</html>