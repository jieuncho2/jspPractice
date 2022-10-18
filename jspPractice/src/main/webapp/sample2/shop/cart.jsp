<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>장바구니</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
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
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				//세션으로 가져오면 object이므로 형변환 필수
				//out.print("cartList 크기 : " + cartList.size());
				//cartList : 장바구니
				if (cartList == null) {
					cartList = new ArrayList<Product>();
				}

				int sum = 0; //total을 누적
				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					//금액 = 가격 * 수량
					int total = product.getUniPrice() * product.getQuantity();
					//total을 누적
					sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId()%>-<%=product.getPname()%></td>
					<td><%=product.getUniPrice()%></td>
					<td><%=product.getQuantity()%></td>
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