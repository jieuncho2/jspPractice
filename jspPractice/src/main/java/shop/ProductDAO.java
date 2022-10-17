package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import shop.Product;

public class ProductDAO {
	public ArrayList<Product> getAllProducts() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product ORDER BY productId DESC";
		
		ArrayList<Product> list = new ArrayList();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setpName(rs.getString("pName"));
				product.setDescription(rs.getString("description"));
				product.setUnitPrice(rs.getInt("unitPrice"));
				product.setProductId(rs.getString("productId"));
				list.add(product);
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
}
