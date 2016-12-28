<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cnt" value="${cnt}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Easy-Matching HomeScreen</title>

<!-- 이거 5개는 항상 갖구다닐꺼 -->
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >

<link rel="stylesheet" href="<c:url value="/resources/css/gongi-mini.css" />" ><!-- 앞에 게시판 3개 나오는거 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
jQuery(function($){/* 앞에 게시판 3개 나오는거 */
   var tab = $('.tab_list');
   tab.removeClass('js_off');
   tab.css('height', tab.find('>ul>li>ul:visible').height()+40);
   function onSelectTab(){
      var t = $(this);
      var myClass = t.parent('li').attr('class');
      t.parents('.tab_list:first').attr('class', 'tab_list '+myClass);
      tab.css('height', t.next('ul').height()+40);
   }
   tab.find('>ul>li>a').click(onSelectTab).focus(onSelectTab);
});
</script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<!-- Jumbotron -->
<div class="jumbotron">
  <div class="row">
  
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active" align="center">
      
      <a href="http://192.168.10.14/forum/main" target="_blank"><img src="<c:url value="/resources/img/aahack-mat.jpg" />"  alt="Hack-mat"/></a>
      <div class="carousel-caption">
        핵맛
      </div>
    </div>
    <div class="item" align="center">
      <a href="http://192.168.10.29/sjl/" target="_blank"><img src="<c:url value="/resources/img/aabeskit.jpg"/>"  alt="BeSkit"> </a>
      <div class="carousel-caption">
          비스킷
      </div>
    </div>
    <div class="item" align="center">
     <a href="http://192.168.10.29/sjl/" target="_blank"><img src="<c:url value="/resources/img/it.jpg"/>"  alt="잇퍼니처"> </a>
      <div class="carousel-caption">
          잇퍼니처
      </div>
    </div>
    광고
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<form class="form-horizontal">
  <div class="form-group" >
    <label for="EasyMatching" class="col-xs-4 control-label">EasyMatching</label>
    <div class="col-xs-4" class="form-group">
      <input type="text" class="form-control" id="searchMatching" placeholder="지역, 팀명 등으로 검색 가능">
    </div>
      <a href="#" class="col-xs-4"><img src="<c:url value="/resources/img/btn_main_search.png" />" alt="팀정보보기" /></a>
  </div>
</form>
        <div class="row">
            
      
            

            <div class="main_lank2_list_wrap">
               <table class="table table-condensed">
                  <thead>
                  <tr>
                     <th colspan="2">팀이름</th>
                     <th>전적</th>
                     <th>지역</th>
                     <th>날짜</th>
                     <th><a href="match/"><img src="<c:url value="/resources/img/main_lank_more.gif" />" alt="전체보기" /></a></th>
                  </tr>
                  </thead>
                  <tbody>
                
                      <c:forEach var="vo" items="${list}">
                           <tr align="center">
                              <td align="center">${vo.team_homeVO.t_name}</td>
                              <td align="right">
                         		  <a href="team/${vo.team_homeVO.t_no}/"><img src="<c:url value="/resources/img/main_lank_btn02.gif" />" alt="팀정보보기" /></a>
                      		  </td>
                              <td>${vo.team_homeVO.t_record_win + vo.team_homeVO.t_record_draw + vo.team_homeVO.t_record_lose}전 ${vo.team_homeVO.t_record_win}승 ${vo.team_homeVO.t_record_draw}무 ${vo.team_homeVO.t_record_lose}패</td>
                              <td>${vo.mat_place}</td>
                              <td>${vo.mat_time}</td>
                              <td><a href="match/${vo.mat_no}/awayMatching"><img src="<c:url value="/resources/img/main_app_btn01.gif" />" alt="팀정보보기" /></a></td>
                           </tr>
                      </c:forEach>
                  </tbody>
               </table>
            </div> <!-- main_lank2_list_wrap -->
         </div> <!-- row -->
  
  
  
  <div class="row">
     <div class="col-md-6">
        <div class="tab_list m1" style="height:60px;">
            <ul>
               <li class="m1"><a href="#"><span>모집중</span></a>
                  <ul>
               		  <c:forEach var="vt" items="${teamList}">
                		  <li>› <a href="team/${vt.t_no}/">장소:${vt.t_place} 팀명:${vt.t_name} 총원:${vt.memberVO.m_no}</a></li>
                      </c:forEach>
                  <li>› <a href="team/">모집팀 더보기</a></li>
                  </ul>
               </li>
            </ul>
      </div><!-- tab_list m1 -->
     </div><!-- col-md-6 -->
     <div class="col-md-6">
          <div class="tab_list m1" style="height:60px;">
            <ul>
                <li class="m1"><a href="#"><span>공지사항</span></a>
                  <ul>
                  	   <c:forEach var="at" items="${articleList}">
                		  <li>› <a href="community/1/1/${at.art_no}/"> ${at.art_title}</a></li>
                      </c:forEach> 
                  <li>› <a href="community/1/1/">공지사항 더보기</a></li>
                  </ul>
               </li> 
               <li class="m2"><a href="#"><span>자유게시판</span></a>
               	  <ul>
                  	   <c:forEach var="at" items="${articleList2}">
                		  <li>› <a href="community/2/1/${at.art_no}/"> ${at.art_title}</a></li>
                      </c:forEach> 
                  <li>› <a href="community/2/1/">자유게시판 더보기</a></li>
                  </ul>
                  
               </li>
               <li class="m3"><a href="#"><span>모집게시판</span></a>
               	  <ul>
                  	   <c:forEach var="at" items="${articleList3}">
                		  <li>› <a href="community/3/1/${at.art_no}/"> ${at.art_title}</a></li>
                      </c:forEach> 
                  <li>› <a href="community/3/1/">모집게시판 더보기</a></li>
                  </ul>
               </li>
            </ul>
         </div><!-- tab_list m1 -->
      </div><!-- col-md-6 -->
   </div><!-- row -->
  </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>