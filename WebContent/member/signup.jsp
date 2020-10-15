<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
		h1 { text-align: left; }
	</style>
</head>
<body>
<div class="containerfluid">
<div class="row" style="margin : 10px;"> 
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
	<div> 
		<nav class="navbar navbar-expand-sm ">
			<ul class="navbar-nav mr-auto"></ul>
		<% 
			if(session.getAttribute("loginMemberEmail") == null){
		%>
				<!-- 로그아웃  -->
				<ul class="navbar-nav mr-right">
					<li class="nav-iten"><a class="nav-link btn btn-success brn-sm" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
					<li class="nav-iten"><a class="nav-link btn btn-warning btn-sm" href="<%=request.getContextPath()%>/member/signup.jsp">회원가입</a></li>
				</ul>
		<%
			}else{
		%>
				<!-- 로그인  -->
				<ul class="navbar-nav mr-right">
					<li class="nav-iten"><a class="nav-link btn btn-success btn-sm" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li>
					<li class="nav-iten"><a class="nav-link btn btn-warning btn-sm" href="<%=request.getContextPath()%>/member/memberOne.jsp">회원정보</a></li>
				</ul>
		<%
			}
		
		%>
</div>
	<!-- 회원가입 -->
	</div>
	<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp">
		<table class="table table-bordered form-group">
			<tr>
				<td>member_email</td>
				<td><input class="form-control" type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input class="form-control" type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>member_name</td>
				<td><input class="form-control" type="text" name="memberName"></td>
			</tr>
		</table>
		<div style="text-align: center;">
		<button class="btn btn-dark" type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>