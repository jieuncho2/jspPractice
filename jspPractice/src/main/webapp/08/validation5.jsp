<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkMember() {
		// 영문 대문자와 소문자, 한글, 한글의 자음과 모음만 검사하도록 정규 표현식 작성.
		let regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		// 이름에 대해 한글만 검사하도록 정규 표현식 작성.
		let regExpName = /^[가-힣]*$/;

		// 숫자만 검사하도록 정규 표현식을 작성.
		let regExpPasswd = /^[0-9]*$/;

		// 전화번호 형태인지 검사하도록 정규 표현식 작성.
		let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;

		// 이메일 형태인지 검사하도록 정규 표현식 작성
		let regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		let form = document.Member;
		
		let id = form.id.value;
		let name = form.name.value;
		let passwd = form.passwd.value;
		let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		let email = form.email.value;
		
		if(!regExpId.test(id)) {
			alert("아이디는 문자로 시작해 주세요!");
			form.id.select();
			return;
		}
		if(!regExpName.test(name)) {
			alert("이름은 한글만으로 입력해 주세요!");
			return;
		}
		if(!regExpPasswd.test(passwd)) {
			alert("비밀번호는 숫자만으로 입력해 주세요!");
			return;
		}
		if(!regExpPhone.test(phone)) {
			alert("연락처 입력을 확인해 주세요!");
			return;
		}
		if(!regExpEmail.test(email)) {
			alert("이메일 입력을 확인해 주세요!");
			return;
		}
		
		form.submit();
	}
</script>
<body>
	<form name="Member" action="validation5_process.jsp" method="post">
		<p>아이디: <input type="text" name="id">
		<p>이름: <input type="text" name="name">
		<p>비밀번호: <input type="text" name="passwd">
		<p>연락처: <input type="text" name="phone1"><input type="text" name="phone2"><input type="text" name="phone3">
		<p>이메일: <input type="text" name="email">
		<p><input type="button" value="전송" onclick="checkMember()">
	</form>
</body>
</html>