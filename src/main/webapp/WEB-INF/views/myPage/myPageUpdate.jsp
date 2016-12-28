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
<style>
.standard-font {
	font : 15px;
}
</style>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row">
  <span align="center"><h3><strong>회원 정보 수정</strong></h3></span>
<form action="update" method="post">
<table width="100%" cellspacing="0" border="1" summary="myPage" class="tbl_type_sh">
		<caption>회원 정보 수정</caption>
		<colgroup>
	<col width="140"><col><col width="120"><col>
	</colgroup>
		<tr>
			<th ><label for="m_id">아이디</label></th>
			<td><input type="hidden" name="m_id" value="${vo.m_id}">${vo.m_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="hidden" class="form-control" name="m_name" value="${vo.m_name}">${vo.m_name}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input class="form-control" type="text" name="m_phone" value="${vo.m_phone}"></td>
		</tr>
		<tr>
			<th>포지션</th>
			<td>
				
				<select class="form-control" name="m_position">    
					
                    <option value='FW' <c:if test="${vo.m_position == 'FW'}">selected</c:if>>FW</option>

              	      <option value='ST' <c:if test="${vo.m_position == 'ST'}">selected</c:if>>MF</option>

                    <option value='DF' <c:if test="${vo.m_position == 'DF'}">selected</c:if>>DF</option>

                    <option value='GK' <c:if test="${vo.m_position == 'GK'}">selected</c:if>>GK</option>

				</select>
			</td>
			
		</tr>	
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-primary" value="수정완료" onclick="location.href='../myPage/'"/>
				<input type="reset" class="btn btn-danger" value="취소" onclick="location.href='../myPage/'" />
			</td>
		</tr>
</table>		
</form>
  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>