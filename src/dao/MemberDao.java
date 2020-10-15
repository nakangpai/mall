package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

public class MemberDao {

	public String login(Member member) throws Exception{ //로그인
		String memberEmail = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		// id,pw 받아서 일치여부 판단 
		String sql = "select member_email from member where member_email = ? and member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) { // 로그인 성공
			memberEmail = rs.getString("member_email");
		}
		conn.close();
		return memberEmail;
	}
	
	// 멤버 정보 입력
	public void insertMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values(?, ?, ?, now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		
		stmt.executeUpdate();
		conn.close();
	}
	
	// 중복 확인 
	public Member selectMemberEmailCk(String memberEmail) throws Exception{
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		String sql = "select id from (select member_email id from member union select admin_id id from admin) email where id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { // 중복된 id 사용x
		
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
	
	public Member selectMemberOne(String memberEmail) throws Exception{ // 회원정보 
		Member member = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email, member_name, member_date from member where member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
		}
		
		conn.close();
		return member;
	}
}
