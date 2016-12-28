<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >


<title>Insert title here</title>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
   <div class="row">

      <div class="container">
              <hr/>
              <div class="row">
              <span align="center"><h3><strong>완료 된 매칭</strong></h3></span>

				</div>
                  <div class="col-md-10" style="padding-top: 20px; padding-left: 0px">
                      <table class="table table-condensed" style="width: 1050px;">
                          <thead>
                        <tr align="center">
                           <td width="15%">매칭 날짜</td>
                           <td width="10%">time(min)</td>
                           <td width="40%">매칭&nbsp;&nbsp;&nbsp;&nbsp;장소</td>
                           <td width="20%">홈 팀</td>
                           <td width="20%">어웨이 팀</td>
                           <td width="10%">매칭 메모</td>
                        </tr>
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
                           </tr>
                        </c:forEach>
                     </tbody>
               </table>
               
               <table class="table table-condensed" style="width: 1000px;" >
                       <thead>
                           <tr>
                               <td>
                                   <span style='float:right'>
                                       <button type="button" id="list" class="btn btn-default"   onClick="self.location='../';">목록</button>
                                   </span>
                               </td>
                           </tr>
                       </thead>
                   </table>
               </div><!-- table table-condensed -->
            </div><!-- /col-md-10 -->
         </div><!-- /container -->
      </div><!-- row -->
   </div> <!-- /jumbotron -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>