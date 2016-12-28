<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="vo" value="${boardVO}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script
   src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet"
   href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/css/navbar-static-top.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/css/pageNation.css" />">

<link rel="stylesheet" href="<c:url value="/resources/jquery-ui/sunny/jquery-ui.css" />" />
<script type="text/javascript" src="<c:url value="/resources/jquery-ui/jquery-ui.js" />"></script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row" >

                          <span align="center"><h3><strong>${vo.b_name}</strong></h3></span>
               <div class="col-md-10" style="padding-top: 15px">
                    
               <table class="table table-condensed" style="width:1000px">
               <tbody>                       
                  <tr>
                     <td align="center" width="10%"><h5><strong>글번호</strong></h5></td>
                     <td align="center" width="50%"><h5><strong>글제목</strong></h5></td>
                     <td align="center" width="10%"><h5><strong>이름</strong></h5></td>
                     <td align="center" width="20%"><h5><strong>작성일</strong></h5></td>
                     <td align="center" width="15%"><h5><strong>조회수</strong></h5></td>
                  </tr>
                  <c:forEach var="list" items="${pageNation.list}">
                  <tr>
                     <td align="center">${list.art_no}</td>
                     <td align="center"><a href="${list.art_no}/">${list.art_title}[${list.art_com_cnt}]</a></td>
                     <td align="center">${list.m_name}</td>
                     <td align="center">${list.art_regdate}</td>
                     <td align="center">${list.art_readcount}</td>
                  </tr>
                  </c:forEach>
                     <tr>
                     <td colspan="11" align="center">
                     <div class="paginate_simple">
                     	${pageNation.display}
                     </div>
                     </td>
                     </tr>
               </tbody>
               </table>
            	<div style="width:1000px; text-align: right">
	               <button type="button" id="list" class="btn btn-default" onclick="location.href='/em/'">홈으로</button>
	               <button type="button" id="write" class="btn btn-primary" onclick="location.href='insert'">글쓰기</button>
      			</div>
      	</div>
      </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>