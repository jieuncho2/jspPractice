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
			 if(form.name.value.length == "") {
				 alert("이름을 입력해 주세요.");
				 form.name.focus();
				 return false;
			 }
			 form.submit();
		 }
	</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form name="join" method="post" action="member_insert_action.jsp">
		<p>아이디: <input type="text" name="id">
		<p>비밀번호: <input type="password" name="passwd">
		<p>비밀번호 확인: <input type="password" name="passwd2">
		<p>이름: <input type="text" name="name">
		<p><input type="button" value="전송" onclick="check()">
	</form>
</body>
</html>