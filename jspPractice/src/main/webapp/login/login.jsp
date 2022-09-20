<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="login" method="post">
        아이디: <input type="text" name="memberID" id="memberID">
        비밀번호: <input type="password" name="pass" id="pass">
        <div id="login-button">로그인</div>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const loginButton = document.querySelector('#login-button'); // 로그인 버튼
            loginButton.addEventListener("click", () => { // 클릭 시 콜백 함수 실행
                const formLogin = document.forms.login;
                if(formLogin.memberID.value === '') {
                    alert('아이디를 입력해 주세요!');
                    memberID.focus();
                    return;
                } else if(formLogin.pass.value === '') {
                    alert('비밀번호를 입력해 주세요!');
                    pass.focus();
                    return;
                }
                formLogin.action = 'login_action.jsp'; // form 태그 외부에서도 action 속성 지정 가능
                formLogin.submit();
            })
        });
    </script>
</body>
</html>