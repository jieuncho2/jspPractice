<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="shop.Product"%>
<%@ page import="shop.ProductDAO"%>
<%@ include file="../inc/DBConnSqlTag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display=3">상품 목록</h1>
		</div>
	</div>
	<%
		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> list = productDAO.getAllProducts();
	%>
	<div class=container>
		<div class="row" align="center">
			<%
				for(int i = 0; i < list.size(); i++){
					Product product = list.get(i);
			%>
					<div class="col-md-4">
						<h3><%=product.getpName() %></h3>
						<p><%=product.getDescription() %>
						<p><%=product.getUnitPrice() %>원
						<p> <a href="./product.jsp?productId=<%=product.getProductId()%>"
						class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
					</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>