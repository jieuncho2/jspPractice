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
        <p><input type="file" name="imgFile">
        <p><input type="button" value="전송" onclick="checkForm()">
    </form>
	<script type="text/javascript">
		 function checkForm() {
			 const checkForm = document.forms.fileUpload;
			 const mb = 1024 * 1024;
			 const max = 1;
			 const chkFileSize = max * mb;
			 
			 if(checkForm.imgFile.value=="") {
				 alert("파일을 선택해 주세요.");
				 return;
			 } else {
				 let upFileSize = checkForm.imgFile.files[0].size;
				 if(chkFileSize < upFileSize) {					 
				 alert("업로드는 " + max + " 메가바이트 아래로만 가능합니다.");
				 return;
				 }
			 }
			 
			 checkForm.submit();
		 }
	</script>
</body>
</html>