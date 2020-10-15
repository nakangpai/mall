<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrdersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<%
	String memberEmail = request.getParameter("memberEmail");
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<Orders> list = ordersDao.selectOrdersListByEmail(session.getAttribute("loginMemberEmail").toString());
%>
<div class="containerfluid">
<div class="row" style="margin : 10px;">
		<div class="col-sm-4 font-weight-bold"><h2><a class="text-success"  style="text-decoration : none;" href="<%=request.getContextPath()%>/index.jsp">Goodee Mall</a></h2></div>
		<div class="col">
			<form>
				<table>
					<tr>
						<td width="200px">
							<input class="form-control" type="text">
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
			<a class="text-success" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp"><i class='fas fa-user' style='font-size: 30px'></i></a>
		<%
			}
		%>
			
			<a class='fas fa-shopping-cart' style='font-size: 30px' class ="success"></a>	
		</div>
	</div>
	
	<div> 
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
					<li class="nav-iten"><a class="nav-link btn btn-warning btn-sm" href="">회원정보</a></li>
				</ul>
		<%
			}
		
		%>
	</div>
		<!-- 주문 관리 -->
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>수량</th>
				<th>금액</th>
				<th>결제 날짜</th>
				<th>결제/배송 조회</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Orders o : list){
			%>
				<tr>
					<td><%=o.getProductId()%></td>
					<td><%=o.getOrdersAmount()%>개</td>
					<td><%=o.getOrdersPrice()%>원</td>
					<td><%=o.getOrdersDate()%></td>
					<td><%=o.getOrdersState()%></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>