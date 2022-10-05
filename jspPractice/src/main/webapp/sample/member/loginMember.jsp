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
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				로그인
			</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-sign-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요.");
					out.println("</div>");
				}
			%>
		</div>
		<form class="form-signin" action="processLoginMember.jsp" method="post">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="Id">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="Password">
				</div>
			</div>
			<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>	
		</form>
	</div>
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>