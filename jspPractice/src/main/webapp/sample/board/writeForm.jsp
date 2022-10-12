<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name = (String) request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
<script type="text/javascript">
	function checkForm() {
		if(!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if(!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if(!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				게시판
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newWrite" class="form-horizontal" action="./BoardWriteAction.do" method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name%>" placeholder="name">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-3">
					<input name="subject" type="text" class="form-control" placeholder="subject">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea name="content" cols="50" rows="5" class="form-control" placeholder="content"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-primary" value="취소" />
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>