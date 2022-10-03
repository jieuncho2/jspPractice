<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	 function checkLogin() {
		 let form = document.loginForm;
		 
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
<body>
	<!-- 폼 페이지에 입력한 데이터(아이디와 비밀번호) 값의 유무 검사하기 -->
	<form name="loginForm" action="validation2_process.jsp" method="post">
        <p>아이디: <input type="text" name="id">
        <p>비밀번호: <input type="password" name="passwd">
        <p><input type="button" value="전송" onclick="checkLogin()">
    </form>
</body>
</html>