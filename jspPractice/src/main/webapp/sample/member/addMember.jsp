<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function checkForm() {
		if(!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원 가입
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newMember" class="form-horizontal" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id">
					<span class="idCheck"></span>
					<br><input name="btnIsDuplication" type="button" value="팝업 아이디 중복 확인">
					<br><input name="btnIsDuplication2nd" type="button" value="ajax 아이디 중복 확인">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="password">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남
					<input name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4">
					<input name="birthyy" type="text" maxlength="4" placeholder="년(4자)" size="6">
					<select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input name="birthdd" type="text" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input name="mail1" type="text" maxlength="50">@
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>	
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-primary" value="취소" onclick="reset()" />
				</div>
			</div>
		</form>
		<script>
        document.addEventListener('DOMContentLoaded', () => {
            const btnIsDuplication = document.querySelector('input[name=btnIsDuplication]');
            const btnIsDuplication2nd = document.querySelector('input[name=btnIsDuplication2nd]');
            const inputID = document.querySelector('input[name=id]');
            const newMember = document.newMember;
            
            const xhr = new XMLHttpRequest();
            
            btnIsDuplication.addEventListener('click', () => {
                const id = newMember.id.value;
                window.open("popupIDCheck.jsp?id=" + id, "IDCheck", "width = 500, height = 500, top = 100, left = 200, location = no");
            });

            btnIsDuplication.addEventListener('click', () => {
                const id = newMember.id.value;
                xhr.open('GET', 'ajaxIDCheck.jsp?id=' + id);
                xhr.send();

                xhr.onreadystatechange = () => {
                    if(xhr.readyState !== XMLHttpRequest.DONE) return;

                    if(xhr.status === 200) {
                        const resp = xhr.response.trim();
                        console.log(resp);
                        if(resp === 'true') {
 ;                          alert('동일한 아이디가 있습니다.');
                        } else {
                            alert('동일한 아이디가 없습니다.');
                        }
                    } else {
                        console.error('Error', xhr.status, xhr.statusText);
                    }
                }
            });

            inputID.addEventListener('keyup', () => {
                const id = newMember.id.value;
                const idCheck = document.querySelector('.idCheck');
                xhr.open('GET', 'ajaxIDCheck.jsp?id=' + id);
                xhr.send();

                xhr.onreadystatechange = () => {
                    if(xhr.readyState !== XMLHttpRequest.DONE) return;

                    if(xhr.status === 200) {
                        const resp = xhr.response.trim();
                        console.log(resp);
                        if(resp === 'true') {
 ;                          idCheck.style.color = 'red';
                            idCheck.innerHTML = '동일한 아이디가 있습니다.'
                        } else {
                            idCheck.style.color = 'red';
                            idCheck.innerHTML = '동일한 아이디가 없습니다.'
                        }
                    } else {
                        console.error('Error', xhr.status, xhr.statusText);
                    }
                }
            });
        });
    </script>
	</div>
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>