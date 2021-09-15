<%@page import="setting.entity.Setting"%>
<%@page import="java.util.List"%>
<%@page import="goods.entity.Goods"%>
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
<title>糖果销售网站</title>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css"
	type="text/css" />
<script src="<%=basePath%>static/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js"
	type="text/javascript"></script>
<%
	List<Goods> list = (List<Goods>) request.getAttribute("list");
	List<Goods> list2 = (List<Goods>) request.getAttribute("list2");
	String username = (String) session.getAttribute("username");
	Setting setting = (Setting) request.getAttribute("setting");
%>
</head>

<body>

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
					<a class="navbar-brand" href="<%=basePath%>main/index"> <img
						alt="" style="height: 30px;" src="<%=basePath%>static/200736.png">
					</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<%
							if (username == null) {
						%>
						<li class="active"><a href="<%=basePath%>main/index">主页<span
								class="sr-only">(current)</span></a></li>
						<li><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li><a href="<%=basePath%>main/order">我的订单</a></li>
						<li><a href="<%=basePath%>order/cart">购物车</a></li>
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/login">登录</a></li>
						<li><a href="<%=basePath%>main/regist">注册</a></li>
						<%
							} else {
						%>
						<li class="active"><a href="<%=basePath%>main/index">主页</a></li>
						<li><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li><a href="<%=basePath%>main/order">我的订单</a></li>
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

	<h4 style="text-align: right; color: red;"><%=setting.getGonggao()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</h4>



	<div class="container">
		<div class="row">
			<form action="<%=basePath%>liuyan/add" method="post">
				<h4 style="text-align: center;">留下您的宝贵意见</h4>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">名字：</span>
					<input type="text" class="form-control" id="basic-url" name="username"
						aria-describedby="basic-addon3">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">电话：</span>
					<input type="text" class="form-control" id="basic-url" name="phone"
						aria-describedby="basic-addon3">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">邮箱：</span>
					<input type="text" class="form-control" id="basic-url" name="email"
						aria-describedby="basic-addon3">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">地址：</span>
					<input type="text" class="form-control" id="basic-url" name="address"
						aria-describedby="basic-addon3">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">内容：</span>
					<textarea rows="10" cols="100"  name="neirong"></textarea>
				</div>
				<br>
				<button type="submit" class="btn btn-default col-4">提交留言</button>
			</form>

		</div>
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