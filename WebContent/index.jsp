<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<%
	CategoryDao categoryDao = new CategoryDao();
	// 전체카테고리, 추천카테고리 
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
	
%>
<body>
<div class="containerfluid">
	<div class="row"  style="margin : 25px;"> 
		<div class="col-sm-4 font-weight-bold"><h2><a class="text-success"  style="text-decoration : none;" href="<%=request.getContextPath()%>/index.jsp">Goodee Mall</a></h2></div>
		<div class="col">
			<form method="post" action="<%=request.getContextPath()%>/product/searchProduct.jsp">
				<table>
					<tr>
						<td width="200px">
							<input class="form-control" type="text" name="productName">
						</td>
						<td width="200px">
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
		</div>
	</div>
	
	<div> 
		<nav class="navbar navbar-expand-sm bg-light">
			<ul class="navbar-nav mr-auto"></ul>
		<% 
			if(session.getAttribute("loginMemberEmail") == null){
		%>
				<!-- 로그아웃-->
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
	</div>
	<div><!-- 전체 카테고리 -->
		<div class="row">
			<div class="col-sm-3">
					<%
						for(Category c : categoryList1){
					%>
					<a class="nav-link" href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>"><button class="btn btn-outline-success btn-block" value=<%=c.getCategoryId()%>><%=c.getCategoryName()%></button></a>
					<%
						}
					%>
			</div>
			<div class="col-sm-9">
				<img src="<%=request.getContextPath()%>/images/rtx.jpg">
			</div>
		</div>
	</div>
	<!-- 추천 카테고리  -->
	<div class="text-align : center" style="margin:5px;">
		<%
			for(Category c : categoryList2){
		%>
		<a class="col-sm-9" href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>"><img src="<%=request.getContextPath()%>/image/<%=c.getCategoryPic()%>" class="rounded-circle" width="200" height="200"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;
		<%
			}
		%>
	</div>
	
	<%
		Calendar today = Calendar.getInstance(); // new Calendar()
	%>
	<!-- 추천상품 -->
	<div>
	<table>
		<tr>
			<td><h3 class="font-weight-bold">Hot deal </h3></td>
			<td>&nbsp;</td>
			<td><h5><span class="badge badge-pill badge-dark"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH)+1%>.<%=today.get(Calendar.DAY_OF_MONTH)%></span></h5></td>
		</tr>
	</table>
		
	</div>
	
	<div class="row">
	<table width="100%">
			<tr>		
		<%
			for(Category c : categoryList1){
		%>
				<td>
					<a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>" class="btn btn-dark nav-link"><%=c.getCategoryName()%></a>
				</td>
		<%
			}
		%>
			</tr>		
	</table>
	</div>
	
	<%
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
	%>
	<!--상품 목록 -->
	<div style="margin: 10px;"></div>
	<table class="table table-border">
		<tr>
			<%
				int i = 0;
				for(Product p : productList){
					i=i+1;
			%>
					<td>
						<div class="card" style="width:300px">
	  						<div class="card-body">
								<h5 class="card-title font-weight-bold">
									<a class="text-information" href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName()%></a>
								</h5>
								<p class="card-dark font-weitght-bold"><%=p.getProductPrice()%>원</p>
					 		</div>
						</div>
					</td>
			<%
					if(i%3==0){
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>

</body>
</html>