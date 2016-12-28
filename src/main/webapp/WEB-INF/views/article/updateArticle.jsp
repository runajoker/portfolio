<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="vo" value="${articleVO}" />
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
<script src="<c:url value="/resources/tinymce/tinymce.min.js" />"></script>
<script>tinymce.init({ selector:'textarea' });</script>
<script>
function insertArt(){
	$('#updateArticle').submit();
}
</script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row">
  <span align="center"><h3><strong>게시물 수정</strong></h3></span>
  <form id="updateArticle" method="post" >
<table class="table table-condensed">
	<tr>
		<th><h5><strong>제목</strong></h5></th>
		<td><input type="text" class="form-control" placeholder="제목"  name="art_title" value="${vo.art_title}"></td>
	
	</tr>
	<tr>
		<th><h5><strong>작성자</strong></h5></th>
		<td><h5><strong>${vo.m_name}</strong></td>
	</tr>
	<tr>
		<th><h5><strong>작성일</strong></h5></th>
		<td><h5><strong>${vo.art_regdate}</strong></td>
	</tr>
	<tr>
		<th><h5><strong>조회수</strong></h5></th>
		<td><h5><strong>${vo.art_readcount}</strong></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea class="form-control" rows="20" cols="30" name="art_content" required="required">${vo.art_content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" class="btn btn-primary" value="수정완료" onclick="insertArt();"/>
			<input type="reset"  class="btn btn-warning" value="초기화" />
			<input type="button" class="btn btn-danger" value="취소" onclick="location.href='../'"/>
		</td>
	</tr>
	</table>
</form>

      </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>