<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="vo" value="${teamInfo}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀장 임명</title>
</head>
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<!-- Jumbotron -->
<div class="jumbotron">
  <div class="row" align="center">
    <span align="center"><h3><strong>팀장 임명</strong></h3></span>
<form action="entrust" method="post">
<table class="table table-condensed">
<tr>
	<td>팀명</td>
	<td><input type="hidden" name="t_no" value="${vo.t_no}" /> 
		${vo.t_name}</td>
</tr>


<tr>
	<th>회원</th>
			<td>
				<select name="m_no">    
					<c:forEach var="ag" items="${teamMemInfo}">
			
                    <option value='${ag.memberVO.m_no}' <c:if test="${vo.memberVO.m_name == ag.memberVO.m_name}">selected</c:if>>${ag.memberVO.m_no} : ${ag.memberVO.m_name}</option>

					</c:forEach>
				</select>
			</td>
</tr>

<tr>
	<td>비밀번호</td>
	<td><input type="password" name="m_pw" /></td>
</tr>

<tr>
	<td colspan="2"><input type="submit" class="btn btn-primary" value="팀장 교체" /><input type="reset" class="btn btn-danger" value="취소" onclick="location.href='../team/'"/></td>
</tr>
</table>
</form>
  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>
