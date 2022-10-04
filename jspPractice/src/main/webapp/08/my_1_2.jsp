<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="fileUpload" action="my_1_process.jsp" method="post" enctype="multipart/form-data">
		<p><input type="file" name="imgFile"><span id="upInfo"></span></p>
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
	<script>
		const max = 10;
		document.addEventListener('DOMContentLoad', () => {
			document.querySelector('#upInfo').innerHTML = '업로드 사이즈는 ' + max + '메가입니다.';
		});
	
		/* 업로드 파일 용량 검사 */
		function checkForm() {
			const checkForm = document.forms.fileUpload;
			const mb = 1024 * 1024;
			const chkFileSize = max * mb;

			if (checkForm.imgFile.value == "") {
				alert("파일을 선택해 주세요.");
				return;
			} else { // 파일을 선택한 경우
				let upFileSize = checkForm.imgFile.files[0].size;
				if (chkFileSize < upFileSize) {
					alert("업로드는 " + max + " 메가바이트 아래로만 가능합니다.");
					return;
				}
			}

			checkForm.submit();
		}
	</script>
</body>
</html>