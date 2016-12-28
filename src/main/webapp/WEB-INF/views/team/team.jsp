<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="info" value="${teamInfo}" />
<c:set var="admin" value="${info.memberVO.m_admin}" />
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
  <span align="center"><h3><strong>우리팀 정보</strong></h3></span>
  <!-- UI Object -->
	<table width="100%" cellspacing="0" border="1" summary="myPage" class="tbl_type">
	<caption>마이페이지</caption>
	<colgroup>
	<col width="140"><col><col width="120"><col>
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">팀명</th>
			<td colspan="3">${info.t_name}</td>
		</tr>
			<tr>
			<th scope="row">주장</th>
			<td colspan="3">${info.t_captain}</td>
			</tr>
		<tr>
			<th scope="row">주 활동지</th>
			<td>${info.t_place}</td>
			<th scope="row">팀 전적</th>
				<td>${info.t_record_win} / ${info.t_record_draw} / ${info.t_record_lose}</td>
		</tr>
		<tr>
			<th scope="row">팀 소개</th>
			<td colspan="3">${info.t_intro}</td>
		</tr>
	</tbody>
	</table>

	<!-- UI Object -->
	<div class="btn_cen" align="center" style="margin-top:20px;">
		<c:if test="${admin eq '3'}"><a href="/em/team/entrust" class="btn_big"><strong>팀장 수여</strong></a></c:if>
		<c:if test="${admin eq '3'}"><a href="/em/team/update" class="btn_big"><strong>팀 수정</strong></a></c:if>
		<c:if test="${admin eq '3'}"><a href="/em/team/delete" class="btn_big"><strong>팀 삭제</strong></a></c:if>
		<c:if test="${admin eq '2'}"><a href="/em/team/withdraw" class="btn_big"><strong>팀 탈퇴</strong></a></c:if>
		<a href="/em/" class="btn_big" ><strong>메인</strong></a>
	</div>
<span align="center"><h3><strong>우리팀 매칭현황</strong></h3></span>
			<div class="col-md-10" style="padding-top: 20px; padding-left: 0px;">
                      <table class="table table-condensed" style="width: 1050px;">
                          <thead>
	<c:choose>
		<c:when test="${list!=null}">
                        <tr align="center">
                           <td width="15%">매칭 날짜</td>
                           <td width="5%">time(min)</td>
                           <td width="40%">매칭&nbsp;&nbsp;&nbsp;&nbsp;장소</td>
                           <td width="10%">홈 팀</td>
                           <td width="10%">어웨이 팀</td>
                           <td width="10%">매칭 메모</td>
                           <td width="10%">매칭 신청</td>
                        </tr>
		</c:when>
		<c:otherwise>
			<tr><td colspan="7">우리팀과 매칭한 팀이 없습니다.</td></tr>
		</c:otherwise>
	</c:choose>
                          </thead>
                          <tbody>
                        <c:forEach var="vo" items="${list}">
                           <tr align="center">
                              <td>${vo.mat_time}</td>
                              <td>${vo.mat_play_time}(min)</td>
                              <td>${vo.mat_place}</td>
                              <td>${vo.mat_home_name}</td>
                              <td>${vo.mat_away_name}</td>
                              <td>
                              <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="size:50%;">메모보기</button>
                              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel">${vo.mat_home_name}팀이 남긴 메모</h4>
								      </div>
								      <div class="modal-body">
								        ${vo.mat_memo}
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
                              </td>
                              <!-- 매칭 처리하기 -->
                              <c:choose>
                                 <c:when test="${vo.mat_home==info.t_no}">
                                    <td><input type="button" class="btn btn-danger" value="매칭취소" onclick="location.href='../match/${vo.mat_no}/homeDelete/${vo.mat_home}'" /></td>
                                 </c:when>
                                 <c:otherwise>
                                    <td><input type="button" class="btn btn-danger" value="매칭취소" onclick="location.href='../match/${vo.mat_no}/awayDelete/${vo.mat_away}'" /></td>
                                 </c:otherwise>
                              </c:choose>
                           </tr>
                        </c:forEach>
                     </tbody>
               </table>
              </div>

  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>