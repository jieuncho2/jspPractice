<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="board.BoardDTO"%>
<%
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	int total_number = ((Integer) request.getAttribute("total_number")).intValue();
	String items = (String)request.getAttribute("items") != null ? (String)request.getAttribute("items"):"";
	String text = (String)request.getAttribute("text") != null ? (String)request.getAttribute("text"):"";
	int blockNum = ((Integer) request.getAttribute("blockNum")).intValue();
	int block_start = ((Integer) request.getAttribute("block_start")).intValue();
	int block_end = ((Integer) request.getAttribute("block_end")).intValue();
	int total_block = ((Integer) request.getAttribute("total_block")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="/sample/css/bootstrap.min.css" />
<title>Board</title>
<script type="text/javascript">
	function checkForm() {
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}
		location.href = "./BoardWriteForm.do?id=${sessionId}"
	}
</script>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge-success">전체 <%=total_record%>건	</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr>
						<td><%=total_number--%></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>&id=${sessionId}"><%=notice.getSubject()%></a></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<c:set var="items" value="<%= items %>" />
			<c:set var="text" value="<%= text %>" />
			<div align="center">
				<c:if test="${block_start > 1}">
					<a href="<c:url value="./BoardListAction.do?blockNum=${blockNum - 1}&pageNum=${pageNum}" />">이전</a>
				</c:if>
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="<%=block_start%>" end="<%=block_end%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${ items }&text=${ text }" /> ">
						<c:choose>
							<c:when test="${pageNum == i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
				<c:if test="${blockNum < total_block}" >
					<a href="<c:url value="./BoardListAction.do?blockNum=${blockNum + 1}&pageNum=${pageNum}" />">다음</a>
				</c:if>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
						<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
						</select> <input name="text" type="text" value="<%= text %>" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
						</td>
						<td width="100%" align="right">
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>





