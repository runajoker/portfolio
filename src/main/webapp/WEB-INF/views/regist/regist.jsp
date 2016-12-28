<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript">

function Join()
{
        var form = document.form1;
        
        if (form.m_id.value == "") {
                alert("아이디를 입력해야 합니다!");
                form.m_id.focus();//포커스를 id박스로 이동.
                return;
        }
        //아이디 입력 문자수를 4~12자로 제한하는 조건문
        if (form.m_id.value.length < 4 || form.m_id.value.length > 12) {
         alert("아이디는 4~12자 이내로 입력 가능합니다!");
         form.m_id.select();//입력한 문자를 선택 상태로 만듬.
         return;
        }

  //입력된 문자의 길이만큼 루프를 돌면서 검사 
  for (i=0; i<form.m_id.value.length; i++) {
         var ch = form.m_id.value.charAt(i);//문자를 반환(정수형), 범위 검사 가능
         //입력된 문자를 검사
         if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) ){
          alert("아이디는 영문 소문자로만 입력 가능 합니다!");
          form.m_id.select();
          return;
         }
  }

  //입력된 첫번째 문자가 숫자인지 검사하는 조건문
  if (!isNaN(form.m_id.value.substr(0,1))) {
       alert("아이디는 숫자로 시작할 수 없습니다!");
       form.m_id.select();
       return;
  }
  
  if (form.m_pw.value == "") {
       alert("패스워드를 입력 해야 합니다!");
       form.m_pw.focus();//포커스를 Password박스로 이동.
       return;
  }

  if (form.m_pw.value.length < 8) {
       alert("비밀번호는 8자 이상 입니다!");
       form.m_pw.select();
       return;
  }
  
  if(form.m_pw.value != form.m_pw2.value){
     alert("비밀번호를 확인하세요");
      form.m_pw2.select();
      return;
  }
  
  if (form.m_name.value == ""){
      alert("이름을 입력 해야 합니다!");
      form.m_name.focus();
      return;
 }

  if (form.m_phone.value == ""){
      alert("핸드폰을 입력 해야 합니다!");
      form.m_phone.focus();
      return;
 }
  
  if(!form.agree.checked){
       alert("약관에 동희 해야 합니다!");
        
        return;
    }
form.submit();
}
</script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row">
	<article class="container">
        <div class="col-md-12">
        <div class="page-header" align="center">
           <h1>회원가입<small>Easy Matching</small></h1>
        </div>
        <form name="form1" class="form-horizontal" action="../regist/" method="post" onsubmit="return validate();">
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
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="m_pw2">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="m_pw2" name="m_pw2" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="m_name">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="m_name" name="m_name" type="text" placeholder="이름">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="m_phone">휴대폰번호</label>
              <div class="col-sm-6">
                  <input type="tel" class="form-control" id="m_phone" name="m_phone" placeholder="- 없이 입력해 주세요" />
              </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="m_position">포지션</label>
          <div class="col-sm-6">
         <select class="form-control" id="m_position" name="m_position">
            <option>CF</option>
            <option>MF</option>
            <option>DF</option>
            <option>GK</option>
         </select>
          </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" name="agree" type="checkbox" autocomplete="off" />
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button id="btn_join" class="btn btn-primary" type="button" onclick="Join();">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="location.href='../'">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
   </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>