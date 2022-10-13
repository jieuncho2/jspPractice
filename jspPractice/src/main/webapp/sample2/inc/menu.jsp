<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<link rel="stylesheet" href="/221013/sample/css/bootstrap.min.css" />
<script>
	function checkForm() {
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}
		location.href = "./BoardWriteForm.do?id=${sessionId}"
	}
</script>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/221013/sample/other/welcome.jsp">221013</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/sample/member/loginMember.jsp"/>">로그인</a></li>
						<li class="nav-item">
							<a class="nav-link" href='<c:url value="/sample/member/addMember.jsp"/>'>회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%= sessionId %>님]</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/sample/member/logoutMember.jsp"/>">로그아웃</a></li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/sample/member/updateMember.jsp"/>">회원 수정</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">고객센터</a></li>
					<a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>"  onclick="checkForm(); return false;">장바구니</a></li>
			</ul>
		</div>
	</div>
</nav>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<ul class="navbar-nav mr-auto">
				<a class="nav-link" href="<c:url value="/sample/member/logoutMember.jsp"/>">메뉴</a></li>
			</ul>
		</div>
	</div>
</nav>