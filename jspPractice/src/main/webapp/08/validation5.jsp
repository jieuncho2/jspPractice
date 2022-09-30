<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		
		
</body>
</html>