<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<%
	// 로그인 상태일 경우 index.jsp로 이동 
	if(session.getAttribute("loginMemberEmail") != null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<div class="containerfluid">
	<div class="row" style="margin : 20px;"> <!-- 검색바 -->
		<div class="col-sm-4 font-weight-bold"><h2><a class="text-success"  style="text-decoration : none;" href="<%=request.getContextPath()%>/index.jsp">Goodee Mall</a></h2></div>
		<div class="col">
			<form method="post" action="<%=request.getContextPath()%>/product/searchProduct.jsp">
				<table>
					<tr>
						<td width="200px">
							<input class="form-control" type="text" name="productName">
						</td>
						<td width="100px">
							<button class="btn btn-dark" type="submit">검색</button>	
						</td>
					</tr>
				</table>	
			</form>
		</div>
		</div>
		<div class="col-sm-3">
		<%
			if(session.getAttribute("loginMemberEmail") == null){
		%>
				<a class="text-success" href="<%=request.getContextPath()%>/member/login.jsp"><i class='fas fa-user' style='font-size: 30px'></i></a>
		<%
			}else{
		%>
			<a class="text-dark" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp"><i class='fas fa-user' style='font-size: 30px'></i></a>
		<%
			}
		%>	
		</div>
	</div>
	<div> <!-- 로그인/회원가입 -->
		<nav class="navbar navbar-expand-sm bg-">
			<ul class="navbar-nav mr-auto"></ul>
		<% 
			if(session.getAttribute("loginMemberEmail") == null){
		%>
				<!-- 로그아웃 -->
				<ul class="navbar-nav mr-right">
					<li class="nav-iten"><a class="nav-link btn btn-success brn-sm" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
					<li class="nav-iten"><a class="nav-link btn btn-warning btn-sm" href="<%=request.getContextPath()%>/member/signup.jsp">회원가입</a></li>
				</ul>
		<%
			}else{
		%>
				<!-- 로그인 -->
				<ul class="navbar-nav mr-right">
					<li class="nav-iten"><a class="nav-link btn btn-success btn-sm" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li>
					<li class="nav-iten"><a class="nav-link btn btn-warning btn-sm" href="<%=request.getContextPath()%>/member/memberOne.jsp">회원정보</a></li>
				</ul>
		<%
			}
		
		%>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp">
		<table class="table table-bordered form-group">
			<tr>
				<td>member_email</td>
				<td><input class="form-control" type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input class="form-control" type="password" name="memberPw"></td>
			</tr>
		</table>
		<div style="text-align:center;">
		<button class="btn btn-success"type="submit">로그인</button>
		</div>
	</form>
</body>
</html>