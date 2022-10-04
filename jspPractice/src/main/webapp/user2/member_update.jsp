<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		 function check() {
			 let form = document.join;
			 
			 if(form.passwd.value.length == "") {
				 alert("비밀번호를 입력해 주세요.");
				 form.passwd.focus();
				 return false;
			 }
			 if(form.passwd2.value.length == "") {
				 alert("비밀번호 확인을 입력해 주세요.");
				 form.passwd2.focus();
				 return false;
			 }
			 if(form.passwd.value != form.passwd2.value) {
				 alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				 form.passwd.focus();
				 return false;
			 }
			 form.submit();
		 }
	</script>
</head>
<body>
	<form name="join" method="post" action="member_update_action.jsp">
		<p>비밀번호: <input type="password" name="passwd">
		<p>비밀번호 확인: <input type="password" name="passwd2">
		<p><input type="button" value="전송" onclick="check()">
	</form>
</body>
</html>