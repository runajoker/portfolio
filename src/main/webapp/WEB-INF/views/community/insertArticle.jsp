<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	$('#insertArticle').submit();
}
</script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
   <div class="row" align="center">
   <span align="center"><h3><strong>글쓰기</strong></h3></span>
<form id="insertArticle" method="post" >
<table class="table table-condensed">
	<tr>
		<th><h5><strong>제목</strong></h5></th>
		<td><input type="text" class="form-control" placeholder="제목"  name="art_title"></td>
	
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea class="form-control" rows="20" cols="30" name="art_content" required="required"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" class="btn btn-primary" value="게시" onclick="insertArt();"/>
			<input type="reset"  class="btn btn-warning" value="초기화" />
			<input type="button" class="btn btn-danger" value="목록" onclick="location.href='./'"/>
		</td>
	</tr>
	</table>
</form>
      </div><!-- row -->
   </div> <!-- /jumbotron -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>