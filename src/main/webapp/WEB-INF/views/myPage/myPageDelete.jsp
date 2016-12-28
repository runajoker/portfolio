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
<form action="delete" method="post">
<span align="center"><h3><strong>회원 탈퇴</strong></h3></span>
<table cellspacing="0" border="1" summary="myPage" class="tbl_type_sh">
<caption>회원 탈퇴</caption>
		<colgroup>
	<col width="140"><col><col width="120"><col>
	</colgroup>
		<tr>
			<th>아이디</th>
			<td><input type="hidden" name=m_no value="${vo.m_no}">
				<input type="hidden" name="m_id" value="${vo.m_id}">${vo.m_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="hidden" name="m_name" value="${vo.m_name}">${vo.m_name}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input class="form-control" type="password" name="m_pw" /></td>
		</tr>
		<tr>
			<td colspan="2">
			        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btn_join" class="btn btn-danger" type="submit"">회원 탈퇴<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-primary" type="button" onclick="location.href='../myPage/'">취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
			</td>
		</tr>
</table>		
</form>

  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>