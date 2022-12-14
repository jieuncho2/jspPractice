<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원가입</h3>
	<!-- form1.jsp 파일에서 1) action 값 수정 2) 취미의 name을 동일하게 변경 및 독서가 기본 값이 되도록 수정 -->
	<form action="form2_process.jsp" name="member" method="post">
		<p>아이디: <input type="text" name="id"> <input type="button" value="아이디 중복검사">
		<p>비밀번호: <input type="password" name="passwd">
		<p>이름: <input type="text" name="name">
		<p>연락처: <select name="phone1">
			<option value="010">010</option>
			<option value="010">011</option>
			<option value="010">016</option>
			<option value="010">017</option>
			<option value="010">019</option>
		</select> - <input type="text" maxlength="4" size="4" name="phone2"> -
		<input type="text" maxlength="4" size="4" name="phone3">
		<p>성별: <input type="radio" name="sex" value="남성" checked>남성
			<input type="radio" name="sex" value="여성">여성
		<p>취미: 독서<input type="checkbox" name="hobby" value="독서" checked>
			운동<input type="checkbox" name="hobby" value="운동">
			영화<input type="checkbox" name="hobby" value="영화">
		<p><textarea name="comment" rows="3" cols="30" placeholder="가입인사를 입력해주세요"></textarea>
		<p><input type="submit" value="가입하기">
			<input type="reset" value="다시쓰기">
	</form>
</body>
</html>