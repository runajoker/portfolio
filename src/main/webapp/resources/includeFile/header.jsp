<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="session" value="${sessionScope.memberInfo}" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="year"/>
<fmt:formatDate value="${now}" pattern="MM" var="month"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#loginClick').click(function(){
		window.open('http://192.168.10.140/em/login/', 'Profile Picture Inserting', 
	        	'toolbar=no, location=center, scrollbar=no' +
	         	'resizable=no, width=400, height=400, left=500, top=250');
	});
	opener.location.href="./";
	window.close();
});
</script>
</head>
<body>
 <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/em/">Easy-Matching</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/em/">Home</a></li>
          </ul>
          <c:choose>
          <c:when test="${session.m_no == null}">
           <ul class="nav navbar-nav navbar-right">
              <li class="active" id="loginClick"><a href="./">로그인<span class="sr-only">(current)</span></a></li>
              <li><a href="/em/regist/">회원가입</a></li>
           </ul>
          </c:when>
          <c:otherwise>
          	<ul class="nav navbar-nav navbar-right">
          	  <li class="active" id="loginClick"><span style="color:white; text-align: left; padding-bottom: 1px;">${session.m_name}님이 접속 중 입니다.</span></li>
              <li class="active"><a href="/em/login/out">로그아웃<span class="sr-only">(current)</span></a></li>
           </ul>
          </c:otherwise>
          </c:choose>
      </div>
    </nav>
    
     <div class="container">
      <div class="masthead">
        <h3 class="text-muted">Easy Matching</h3>
        <nav>
          <ul class="nav nav-justified">
             <li class="active"><a href="/em/">Home</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MyPage<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header" style="color:blue;">정보보기</li>
                <li><a href="/em/myPage/">개인정보</a></li>
                <li class="dropdown-header" style="color:blue;">쪽지보기</li>
              	<li><a href="/em/message/reciveMsg/">쪽지함</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Matching<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">	
                <li class="dropdown-header" style="color:blue;">매치정보</li>
                <li><a href="/em/match/">전체 매칭 보기</a></li>
              	<li><a href="/em/match/matchingSchedule?year=${year}&&month=${month}&&date=1">매칭 스케줄</a></li>
                <li><a href="/em/match/complete">완료된 매칭</a></li>
                <li><a href="/em/match/goMatching">매칭신청</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Team<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header" style="color:blue;">팀정보</li>
              	<li><a href="/em/team/showteam">팀 전체보기</a></li>
                <li><a href="/em/team/">내팀 정보</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Community<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header" style="color:blue;">커뮤니티</li>
              	<li><a href="/em/community/1/1/">공지게시판</a></li>
              	<li><a href="/em/community/2/1/">자유게시판</a></li>
                <li><a href="/em/community/3/1/">모집게시판</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
</body>
</html>