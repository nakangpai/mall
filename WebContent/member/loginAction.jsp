<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}

	// id, pw받음 
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	
	Member paraMember = new Member();
	paraMember.setMemberEmail(memberEmail);
	paraMember.setMemberPw(memberPw);
	
/* 	   받은 값과 저장 값 비교 
	   다르면 login.jsp이동
	   같으면 index.jsp이동
*/
	MemberDao memberDao = new MemberDao();
	String paraMemberEmail = memberDao.login(paraMember);
	if(paraMemberEmail == null){
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
	}else{		
		session.setAttribute("loginMemberEmail", paraMemberEmail);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}


%>