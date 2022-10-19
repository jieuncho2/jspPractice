<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="shop.Cart"%>
<%@ page import="shop.CartDAO"%>
<%@ include file="../inc/DBConnSqlTag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<%
		CartDAO CartDAO = new CartDAO();
		ArrayList<Cart> list = CartDAO.getAllCarts();
	%>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="deleteCart.jsp?cartId=?"
						class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a
						href="shippingInfo.jsp?cartId=?"
						class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>


		<!-- 장바구니 목록 구현 시작 -->
		<div style="padding-top: 50px;">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
				int sum = 0; //total을 누적
				for (int i = 0; i < list.size(); i++) {
					Cart cart = list.get(i);
					//금액 = 가격 * 수량
					int total = cart.getUnitPrice() * cart.getAmount();
					//total을 누적
					sum = sum + total;
				%>
				<tr>
					<td><%=cart.getProductName()%></td>
					<td><%=cart.getUnitPrice()%></td>
					<td><%=cart.getAmount()%></td>
					<td><%=total%></td>
					<td>삭제</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td></td>
					<td></td>
					<td>총액</td>
					<td><%=sum%></td>
					<td></td>
				</tr>

			</table>
			<a href="products.jsp" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>
		</div>
	</div>

	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>