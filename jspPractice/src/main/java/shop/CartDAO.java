package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import shop.Cart;

public class CartDAO {

	public ArrayList<Cart> getAllCarts() {
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM cart ORDER BY cartId DESC";
		
		ArrayList<Cart> list = new ArrayList();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getString("cartId"));
				cart.setUserId(rs.getString("userId"));
				String productId = rs.getString("productId");
				cart.setProductId(productId);
				String productName = getProductName(productId);
				cart.setProductName(productName);
				int unitPrice = getUnitPrice(productId);
				cart.setUnitPrice(unitPrice);
				cart.setAmount(rs.getInt("amount"));
				list.add(cart);
			}
			return list;
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("에러: " + ex);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				// TODO: handle exception
				throw new RuntimeException(ex.getMessage());
			}
		}
			
		return null;
	}
	
	public String getProductName(String productId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = null;
		System.out.println(productId);
		
		String sql = "SELECT pName FROM product WHERE productId = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();

			String pName = null;
			while(rs.next()) {
				pName = rs.getString("pName");
			}

			return pName;
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("에러: " + ex);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				// TODO: handle exception
				throw new RuntimeException(ex.getMessage());
			}
		}
		
		return null;
		
	}
	
	public int getUnitPrice(String productId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = null;
		System.out.println(productId);
		
		String sql = "SELECT unitprice FROM product WHERE productId = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();

			int unitPrice = 0;
			while(rs.next()) {
				unitPrice = rs.getInt("unitPrice");
			}

			return unitPrice;
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.err.println("에러: " + ex);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				// TODO: handle exception
				throw new RuntimeException(ex.getMessage());
			}
		}
		
		return 0;
		
	}

}
