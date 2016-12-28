<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="year"/>
<fmt:formatDate value="${now}" pattern="MM" var="month"/>
<c:set var="session" value="${sessionScope.memberInfo}" />
<c:set var="cnt" value="${cnt}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Easy-Matching HomeScreen</title>
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />">
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/gongi-mini.css" />" ><!-- 앞에 게시판 3개 나오는거 -->
<link rel="stylesheet" href="<c:url value="/resources/css/footer.css" />" ><!-- footer -->
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
	<nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">이지매칭</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../navbar/">회원가입</a></li>
            <li class="active"><a href="./">로그인<span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
      </div>
    </nav>

 <div class="container">
      <div class="masthead">
        <h3 class="text-muted">Easy Matching</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">HOME<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">회원가입/로그인</li>
                <li><a href="regist/">회원가입</a></li>
                <li><a href="login/">로그인</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MyPage<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">정보보기</li>
                <li><a href="myPage/">개인정보</a></li>
                <li><a href="team/">내팀정보</a></li>
                <li class="dropdown-header">쪽지보기</li>
              	<li><a href="myPage/${m_no}/message">쪽지함</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Matching<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">매치정보</li>
              	<li><a href="match/matchingSchedule?year=${year}&&month=${month}&&date=1">매칭 스케쥴</a></li>
                <li><a href="match/complete">완료된 매칭</a></li>
                <li><a href="match/goMatching">매칭신청</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Team<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">팀정보</li>
              	<li><a href="team/">팀 전체보기</a></li>
                <li><a href="team/${t_no}">내팀 정보</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Community<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">커뮤니티</li>
              	<li><a href="community/1/1/">공지게시판</a></li>
              	<li><a href="community/2/1/">자유게시판</a></li>
                <li><a href="community/3/1/">모집게시판</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>

      <!-- Jumbotron -->
      <div class="jumbotron">
	       <div class="row">
	
	         <!-- Example row of columns -->
    <div class="tab_list m1" style="height:30px;">
		<ul>
			<li class="m1"><a href="#"><span>공지사항</span></a>
				<ul>
				<li>› <a href="#">이것은 첫 번째 탭의 공지사항 목록 입니다.</a></li>
				<li>› <a href="#">이것은 첫 번째 탭의 공지사항 목록 입니다.</a></li>
				<li>› <a href="#">이것은 첫 번째 탭의 공지사항 목록 입니다.</a></li>
				<li class="more">› <a href="#">공지사항 더보기</a></li>
				</ul>
			</li>
			<li class="m2"><a href="#"><span>자유게시판</span></a>
				<ul>
				<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 두 번째 탭의 보도자료 목록 입니다.</a></li>
				<li class="more">› <a href="#">자유게시판 더보기</a></li>
				</ul>
			</li>
			<li class="m3"><a href="#"><span>모집게시판</span></a>
				<ul>
				<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
				<li>› <a href="#">이것은 세 번째 탭의 해명자료 목록 입니다.</a></li>
				<li class="more">› <a href="#">모집게시판 더보기</a></li>
				</ul>
			</li>
		</ul>
	</div>
	        <div class="col-lg-4">
	          <h2>Heading</h2>
	          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
	       </div>
	        <div class="col-lg-4">
	          <h2>Heading</h2>
	          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
	          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
	        </div>
	      </div>
      </div>

</div> <!-- /container -->

</body>
<jsp:include page="../../resources/includeFile/footer.jsp"/>
</html> --%>