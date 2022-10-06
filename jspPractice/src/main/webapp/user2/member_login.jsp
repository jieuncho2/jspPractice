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
			 
			 if(form.id.value.length == "") {
				 alert("아이디를 입력해 주세요.");
				 form.id.focus();
				 return false;
			 }
			 if(form.passwd.value.length == "") {
				 alert("비밀번호를 입력해 주세요.");
				 form.passwd.focus();
				 return false;
			 }
			 form.submit();
		 }
	</script>
</head>
<body>
	<h3>로그인</h3>
	<form name="join" method="post" action="member_login_action.jsp">
		<p>아이디: <input type="text" name="id">
		<p>비밀번호: <input type="password" name="passwd">
		<p><input type="button" value="전송" onclick="check()">
	</form>
</body>
</html>