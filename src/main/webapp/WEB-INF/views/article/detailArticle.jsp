<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vo" value="${articleVO}" />
<c:set var="session" value="${sessionScope.memberInfo}" />
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
<script>
$(document).ready(function(){
   comment_list();
});
function comment_list(){
   var com_url = 'comment/list/';
   $.ajax({
      url:com_url,
      method:'post',
      data:{
         art_no:'${vo.art_no}'
      }
   }).done(function(data){
      var comment_list = '';
         comment_list += '   <table boarder="1" nowrap width="700" class="table table-condensed">';
      $.each(data, function(key,val){
         comment_list += '      <tr id="'+val['com_no']+'">';
         comment_list += '         <td nowrap width="100">';
         comment_list += '         '+val['m_id']+'('+val['m_name'   ]+')';
         comment_list += '         </td>';
         comment_list += '         <td >';
         comment_list += '            '+val['com_comment'];
         comment_list += '         </td>';
         comment_list += '         <td nowrap width="100">';
         
         /* if(val['com_regdate'] == ${date} ){ */
         comment_list += '            '+val['com_regdate'];
         
         
         comment_list += '         </td>';
         if(val['m_no']=='${session.m_no}'){
         comment_list += '         <td nowrap width="100">';
            comment_list += '         <a href="javascript:comment_update('+val['com_no']+' );">수정</a>';
            comment_list += '         <a href="javascript:comment_delete('+val['com_no']+' );">삭제</a>';
         comment_list += '         </td>';            
         }
         
         comment_list += '   </tr>';
         
      });
         comment_list += '   </table>';
      $('#viewcomment').html(comment_list);
   });
}
function comment_insert(){
   var com_url = 'comment/insert/';
   
   $.ajax({
      url:com_url,
      method:'post',
      data:{
         art_no:'${vo.art_no}',
         com_comment:$('#comment').val(),
         m_no:'${session.m_no}'
      }
   
   }).done(function(data){
      
      comment_list();
      $('#comment').val('');
   });
}

function comment_delete(com_no){
   if(!confirm('정말로 삭제하시겠습니까?')){
      return;
   }
   var com_url = 'comment/delete/';
   
   $.ajax({
      url:com_url,
      method:'post',
      data:{
         com_no:com_no
      }
   }).done(function(data){
      comment_list();
   });
}
function comment_update(com_no){
   alert('update : '+com_no);
}
</script>
</head>
<body>
<%@ include file="/resources/includeFile/header.jsp" %>
<div class="jumbotron">
  <div class="row">
<span align="center"><h3><strong>쓴글 보기</strong></h3></span>
          <div class="container">
           <hr/>
           <div class="row1">
               <div class="col-md-10">
                   <table class="table table-condensed">
                       <thead>
                           <tr align="center">
                               <th width="10%">제목</th>
                               <th width="60%">${vo.art_title}</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td>작성일
                               </td>
                               <td>
                               ${vo.art_regdate}
                               </td>
                           </tr>
                           <tr>
                               <td>글쓴이
                               </td>
                               <td>
                               ${vo.m_name} <span style='float:right'>조회 : ${vo.art_readcount}</span>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">
                                   <p>${vo.art_content}</p>
                       
                               </td>
                           </tr>
                       </tbody>
                   </table>
   <br />

                   <table class="table table-condensed">
                       <thead>
                           <tr>
                               <td>
                                   <span style='float:right'>
                                       <button type="button" id="list" class="btn btn-default"   onClick="self.location='../';">목록</button>
                                       <button type="button" id="modify" class="btn btn-default" onClick="self.location='update';">수정</button>
                                       <button type="button" id="delete" class="btn btn-default" onClick="self.location='delete';">삭제</button>
                                   </span>
                               </td>
                           </tr>
                       </thead>
                   </table>
 
   <div id="viewcomment" style="background: #EEEEEE;" class="form-inline">
      111 ${result} <a href="comment/test/">test22</a>
   </div>
   
                      <table class="table table-condensed">
                       <tr>
                           <td>
                               <span class="form-inline" role="form">
                                   <p>
                                       <div class="form-group">
                                           <input type="hidden" id="m_no" name="m_no" value="${session.m_no}" class="form-control col-lg-2" >${session.m_id}(${session.m_name})
                                       </div>
                                       <div class="form-group">
                                           <input type="text" id="comment" name="comment" class="form-control col-lg-2" data-rule-required="true" placeholder="댓글을 입력해주세요. " maxlength="80">
                                       </div>
                                       <div class="form-group">
                                           <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default" onclick="javascript:comment_insert();">확인</button>
                                       </div>
                                   </p>
                               </span>
                           </td>
                       </tr>
                   </table>
   			</div></div></div>
      </div><!-- row -->
</div> <!-- /container -->
</body>
<%@ include file="/resources/includeFile/footer.jsp" %>
</html>