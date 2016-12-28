<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>login Form</title>
<!-- 이거 5개는 항상 갖구다닐꺼 -->
<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
<script src="<c:url value="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />" >
<link rel="stylesheet" href="<c:url value="/resources/css/navbar-static-top.css" />" >
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
$(function(){
    Kakao.init('bdde28507d4eecf071dd986165f08aaf');
    
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
            Kakao.API.request({
            url: "/v1/user/me",
            success: function(res) {
            //console.log(res.properties);
             alert(res.properties.nickname + "님 환영합니다. 로그인 되었습니다");
             location.href="kakaoLogin?id="+res.id+"&&name="+res.properties.nickname;
         },
         fail: function(error) {
            alert(JSON.stringify(error));
         }
         });
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
});
</script>
</head>
<body>

<article class="container">

        <div class="col-md-12">
        <div class="page-header">
           <h1>로그인 <small>Easy Matching</small></h1>
        </div>
        <form name="form1" class="form-horizontal" action="./" method="post"">
        <div class="form-group">
           <label class="col-sm-3 control-label" for="m_id">아이디</label>
           <div class="col-sm-6">
                <input class="form-control" id="m_id" name="m_id" type="text" placeholder="아이디">
           </div>
        </div>
        <div class="form-group">
           <label class="col-sm-3 control-label" for="m_pw">비밀번호</label>
           <div class="col-sm-6">
                <input class="form-control" id="m_pw" name="m_pw" type="password" placeholder="비밀번호">
           </div>
        </div>
          
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btn_join" class="btn btn-primary" type="submit" >로그인<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="location.href='../'">취소<i class="fa fa-times spaceLeft"></i></button><br/>
          </div>
        </div>
        <div align="center">
        	<a id="kakao-login-btn"></a>
        </div>
        </form>
          <hr>
        </div>
      </article>

</form>

</body>
</html>