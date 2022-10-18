<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.Product"%>
<%@ page import="shop.ProductDAO"%>
<%@ include file="../inc/DBConnSqlTag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String productId = request.getParameter("productId");
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.getProductById(productId);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%= product.getpName() %></h3>
				<p><%= product.getDescription() %>
				<p> <b>상품 코드 : </b><span class="badge badge-danger">
				<%= product.getProductId() %></span>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p> <a href="#" class="btn btn-info">장바구니에 담기 &raquo;</a>
					<a href="./list.jsp" class="btn btn-secondary">상품
					 목록 &raquo;</a>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>