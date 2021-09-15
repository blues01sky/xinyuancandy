<%@page import="setting.entity.Setting"%>
<%@page import="goods.entity.Goods"%>
<%@page import="java.util.List"%>
<%@page import="order.entity.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单</title>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css" type="text/css" />
<script src="<%=basePath%>static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="<%=basePath%>static/css/style.css" type="text/css" />
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>

<%
	List<Order> lists = (List<Order>) request.getAttribute("list");
	String username = (String) session.getAttribute("username");
	Setting setting = (Setting) request.getAttribute("setting");
%>
</head>

<body>
	<div class="container-fluid">


		<div class="container-fluid">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=basePath%>main/index">
					<img alt="" style="height: 30px;" src="<%=basePath%>static/200736.png">
					</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<%
							if (username == null) {
						%>
						<li><a href="<%=basePath%>main/index">主页<span
								class="sr-only">(current)</span></a></li>
						<li><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li class="active"><a href="<%=basePath%>main/order">我的订单</a></li>
						<li><a href="<%=basePath%>order/cart">购物车</a></li>
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/login">登录</a></li>
						<li><a href="<%=basePath%>main/regist">注册</a></li>
						<%
							} else {
						%>
						<li><a href="<%=basePath%>main/index">主页</a></li>
						<li><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li class="active"><a href="<%=basePath%>main/order">我的订单</a></li>
						<li><a href="<%=basePath%>order/cart">购物车</a></li>
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/logout">退出</a></li>
						<li><a href="<%=basePath%>user/update">修改信息</a></li>
						<%
							}
						%>
					</ul>
					<form class="navbar-form navbar-right" role="search"
						action="<%=basePath%>goods/search" method="post">
						<div class="form-group">
							<input name="goodsname" type="text" class="form-control"
								placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		</div>
		<h4 style="text-align: right;color: red;"><%=setting.getGonggao() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<strong>我的订单</strong>
				<table class="table table-bordered">
					<tbody>
						<tr class="warning">
							<th>订单号</th>
							<th>商品名</th>
							<th>数量</th>
							<th>总价</th>
							<th>收货人</th>
							<th>地址</th>
							<th>电话</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
						<%
							for(Order order : lists){
								%>
						<tr class="active">
							<td width="20%"><%=order.getOrderid() %></td>
							<td width="10%"><a href="<%=basePath %>goods/goodsdetail?goodsid=<%=order.getTemp5() %>"><%=order.getGoodsname() %></a></td>
							<td width="5%"><%=order.getGoodsnum() %></td>
							<td width="5%"><%=order.getSumprice() %></td>
							<td width="10%"><%=order.getName() %></td>
							<td width="15%"><%=order.getAddress() %></td>
							<td width="15%"><%=order.getPhone() %></td>
							<%
						if(order.getStatus().equals("4")){
							%>
							<td width="10%"><a href="<%=basePath%>order/pay?orderid=<%=order.getOrderid() %>" >支付</a></td>
							<% 
						}else if(order.getStatus().equals("7")){
							%>
							<td width="10%"><a href="<%=basePath%>order/sure?id=<%=order.getId() %>">确定收货</a></td>
							<%
						}else {
							%><td width="10%"><%=order.getZhushi() %></td>
						<% }
					%>
					<td width="10%">
					
					<%
					if(order.getStatus().equals("3") || order.getStatus().equals("6")|| order.getStatus().equals("8") ){%>
							<a>订单已不可操作</a>
						<%}else{
							%>
							<a href="javascript:if(confirm('确认要删除订单号为：<%=order.getOrderid() %>这个订单吗？')) location.href='<%=basePath %>order/userdelorder?orderid=<%=order.getOrderid() %>'">删除订单</a>
						
						<% }
							}
						%>
						
					</tbody>
					
				</table>
			</div>
		</div>
		<!-- <div style="text-align: center;">
			<ul class="pagination">
				<li class="disabled"><a href="<%=basePath%>#" aria-label="Previous"><span
						aria-hidden="true">&laquo;</span></a></li>
				<li class="active"><a href="<%=basePath%>#">1</a></li>
				<li><a href="<%=basePath%>#">2</a></li>
				<li><a href="<%=basePath%>#">3</a></li>
				<li><a href="<%=basePath%>#">4</a></li>
				<li><a href="<%=basePath%>#">5</a></li>
				<li><a href="<%=basePath%>#">6</a></li>
				<li><a href="<%=basePath%>#">7</a></li>
				<li><a href="<%=basePath%>#">8</a></li>
				<li><a href="<%=basePath%>#">9</a></li>
				<li><a href="<%=basePath%>#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</div> -->
	</div>

	<div style="text-align: center; margin-top: 5px;">
		<ul class="list-inline">
			<li><a>关于我们</a></li>
			<li><a>联系我们</a></li>
			<li><a>支付方式</a></li>
			<li><a>配送方式</a></li>
			<li><a>服务声明</a></li>
			<li><a href="<%=basePath%>aftermain/index">管理</a></li>
		</ul>
	</div>
	<div style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
		Copyright &copy; 2019 刘程泰版权所有</div>

</body>

</html>