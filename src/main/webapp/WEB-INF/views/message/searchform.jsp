<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script>
	
	function id_check(){
	 var com_url = '../searchId/';
	 var a = document.getElementById('usr_id');
	 var usr_id = a.value;
	 $.ajax({
	 url: com_url,
	 method: 'post',
	 data:{
	 m_id: usr_id
	 }
	 }).done(function(data){
		 var addHTML = '';
		 if(data>0) {
			 var con = confirm(usr_id+'에게 쪽지를 보내시겠습니까?');
			 	if(con) {
			 		var addr = "/em/message/insert/"+data;
			 		location.href=addr;
			 		window.open("about:blank","_self").close();
			 		
			 	}
		 } else {
			 addHTML += '아이디를 찾지 못했습니다';
		 } 
			
	 $('#viewid').html(addHTML);
	 }
	)};
	
	 
</script>
</head>
<body>
	
		<input type="text" id="usr_id" /> <input type="button" id="search"
			value="검색" onclick="javascript:id_check();" />
	<div id="viewid" background-color="red">
	a
	</div>
</body>
</html>