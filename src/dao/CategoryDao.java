package dao;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;
import java.sql.*;

public class CategoryDao { // 카테고리 목록 
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();		
		
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
		
			Category category = new Category();
	
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
		
			list.add(category);
		}
		
		conn.close();
		return list;
	}
	
	public ArrayList<Category> selectCategoryCkList() throws Exception { // 카테고리 추천 리스트 
		ArrayList<Category> list = new ArrayList<Category>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();		
		
		String sql = "select category_id, category_pic from category where category_ck = 'Y' limit 0, 4";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
		
			Category category = new Category();
			
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryPic(rs.getString("category_pic"));
			
			list.add(category);
		}
		
		conn.close();
		return list;
	}
}
