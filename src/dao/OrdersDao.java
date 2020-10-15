package dao;
import vo.*;
import commons.DBUtil;
import java.sql.*;
import java.util.*;

public class OrdersDao { // 상품 주문
	public ArrayList<Orders> selectOrdersListByEmail(String memberEmail) throws Exception{ 
		ArrayList<Orders> list = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select product_id, orders_amount, orders_price, orders_state, orders_date from orders where member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			list = new ArrayList<Orders>(); // 주문 정보 
			Orders orders = new Orders();
			orders.setProductId(rs.getInt("product_id"));
			orders.setOrdersAmount(rs.getInt("orders_amount"));
			orders.setOrdersPrice(rs.getInt("orders_price"));
			orders.setOrdersState(rs.getString("orders_state"));
			orders.setOrdersDate(rs.getString("orders_date")); 
			list.add(orders);
		}
		
		conn.close();
		return list;
	}
	
	public void insertOrders(Orders orders) throws Exception{ // 주문 정보관리 
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into orders(product_id, orders_amount, orders_price, member_email, orders_addr, orders_state, orders_date) values(?, ?, ?, ?, ?, '결제완료', now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		
		stmt.executeUpdate();
		conn.close();
	}
}
