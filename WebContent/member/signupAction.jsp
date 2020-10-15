<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	// index로 이동 로그인중일 경우
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	

	request.setCharacterEncoding("utf-8");
	
	// 값을 받아온다
	// 중복여부 확인 
	// 정보 입력 
	
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	
	if(member != null){
		response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
		return;
	}
	
	Member paraMember = new Member();
	paraMember.setMemberEmail(memberEmail);
	paraMember.setMemberPw(memberPw);
	paraMember.setMemberName(memberName);
	memberDao.insertMember(paraMember);
	
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>