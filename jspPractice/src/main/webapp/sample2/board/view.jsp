<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board.BoardDTO" %>
<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
	 	let form = document.newUpdate;
	 	alert("삭제하시겠습니까?");
	 	return;
	}
</script>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				뷰 게시판
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newUpdate" class="form-horizontal" action="BoardUpdateAction.do?num=<%= notice.getNum() %>&pageNum=<%= nowpage %>" method="post">
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=notice.getName()%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" value="<%=notice.getSubject()%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" cols="50" rows="5" class="form-control"><%=notice.getContent()%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<c:set var="userId" value="<%= notice.getId() %>" />
				<c:if test="${ sessionId==userId }">
					<p>
						<a href="./BoardDeleteAction.do?num=<%= notice.getNum() %>&pageNum=<%= nowpage %>" class="btn btn-danger"  onclick="check()">삭제</a>
						<input type="submit" class="btn btn-success" value="수정" />
				</c:if>
				<a href="./BoardListAction.do?pageNum=<%= nowpage %>" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>