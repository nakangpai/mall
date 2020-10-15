package dao;
import vo.*;
import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.Product;

public class ProductDao {
	public Product selectProductOne(int productId) throws Exception{ // 상세 내용
		Product product = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select product_id, product_pic, product_name, product_price, product_content, product_soldout from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
		}
		
		return product;
	}
	
		public ArrayList<Product> selectProductList() throws Exception{ // 상품 목록 
			ArrayList<Product> list = new ArrayList<Product>();
			
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "select product_id, product_pic, product_name, product_price from product limit 0, 6";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getInt("product_id"));
				p.setProductPic(rs.getString("product_pic"));
				p.setProductName(rs.getString("product_name"));
				p.setProductPrice(rs.getInt("product_price"));
				list.add(p);
			}
			conn.close();
			return list;
		}
		
		// 각 카테고리 상품 목록 
		public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception{
			ArrayList<Product> list = new ArrayList<Product>();
			
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			
			String sql = "select product_id, product_pic, product_name, product_price from product where category_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, categoryId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getInt("product_id"));
				p.setProductPic(rs.getString("product_pic"));
				p.setProductName(rs.getString("product_name"));
				p.setProductPrice(rs.getInt("product_price"));
				list.add(p);
			}
			
			conn.close();
			return list;
		}
		
		// 검색별 상품 목록 메서드
		public ArrayList<Product> searchProductList(String productName) throws Exception{
			ArrayList<Product> list = new ArrayList<Product>();
			
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			System.out.println(conn+"<--conn");
			
			String sql = "select product_id, product_pic, product_name, product_price from product where product_name like ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+productName+"%");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				p.setProductId(rs.getInt("product_id"));
				p.setProductPic(rs.getString("product_pic"));
				p.setProductName(rs.getString("product_name"));
				p.setProductPrice(rs.getInt("product_price"));
				list.add(p);
			}
			
			conn.close();
			return list;
		}
}
