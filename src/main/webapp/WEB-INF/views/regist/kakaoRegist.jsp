<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<div class="container">
   <div class="row">
      <thead>
         <div class="page-header" align="center">
            <h3>카카오회원</h3>
            
         </div>
       </thead>
       <tbody>
          <div class="col-md-3">
             <div class="login-box well">
               <form action="../regist/kakaoRegist" method="post">
               <input type="hidden" name="m_id" value="${memberVO.m_id}"/>
            <input type="hidden" name="m_name" value="${memberVO.m_name}"/>
                   <legend>추가정보</legend>
                   <div class="form-group">
                    <div class="col-sm-6">
                        <label for="m_phone">전화번호</label>
                       </div>
                       <div class="col-sm-6">
                          <input name="m_phone" id="m_phone" placeholder="전화번호" type="text" class="form-control" />
                       </div>
                   </div>
                   <div class="form-group">
                   <label class="col-md-3 control-label" for="m_position">포지션</label>
                       <div class="col-sm-6">
                           <select class="form-control" id="m_position" name="m_position">
                              <option>ST</option>
                              <option>MF</option>
                              <option>DF</option>
                           </select>
                       </div>
                    </div>
                   <div class="form-group">
                       <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="확인" />
                   </div>
               </form>
             </div>
          </div>
       </tbody>
   </div><!-- row -->
</div> <!-- /container -->
</body>
</html>