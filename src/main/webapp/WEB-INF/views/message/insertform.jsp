<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${sessionScope.memberInfo}" var="session" />
<c:if test="${messageVO ne null}"><c:set var="vo" value="${messageVO}" /></c:if>
<c:if test="${memberId ne null}"><c:set var="mbId" value="${memberId}" /></c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 이거 5개는 항상 갖구다닐꺼 -->
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/myPage/myPage.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/pageBtn.css" />" >
<script language="javascript" type="text/javascript">  
//검색 누르면 새창 작게 뜨게

function moveUp() {
	location.href='../reciveMsg/';
}
</script>  
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row">
	<h3>쪽지 보내기</h3>
	<br />
	<table class="tbl_type_sh">
		<form action="./action" method="post">
		<tr>
			<th width="15%">받는사람</th>
			<td>
			
			<c:if test="${messageVO eq null}">
				<a id="search" href="./">받는사람 검색</a>
			${memberId}
			</c:if>
			<c:if test="${messageVO ne null}">
			${vo.m_id}(${vo.m_name})		
			</c:if>
			<!-- DB구조상 뒤바뀌는게 맞음 -->
			<input type="hidden" name="m_no" value="${vo.g_send_no}" />
			<input type="hidden" name="g_send_no" value="${vo.m_no}" />
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" name="g_content">
			
			</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="btn btn-primary" value="전송"> <input type="button" class="btn btn-danger" value="취소" onclick="javascript:moveUp();"></td>
		</tr>
		<input type="hidden" name="g_no" value="${vo.g_no}">
		</form>
	</table>
  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>