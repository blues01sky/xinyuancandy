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

	<h4 style="text-align: right; color: red;"><%=setting.getGonggao() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</h4>

	<!-- 轮播图 -->
	<div class="container-fluid">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- 轮播图的中的小点 -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<!-- 轮播图的轮播图片 -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img style="width: 100%; height: 400px"
						src="<%=basePath%>static/img/棒棒3.jpg">
					<div class="carousel-caption">
						<!-- 轮播图上的文字 -->
					</div>
				</div>
				<div class="item">
					<img style="width: 100%; height: 400px"
						src="<%=basePath%>static/img/棒棒2.jpg">
					<div class="carousel-caption">
						<!-- 轮播图上的文字 -->
					</div>
				</div>
				<div class="item">
					<img style="width: 100%; height: 400px"
						src="<%=basePath%>static/img/棒棒4.jpg">
					<div class="carousel-caption">
						<!-- 轮播图上的文字 -->
					</div>
				</div>
			</div>

			<!-- 上一张 下一张按钮 -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">上一张</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">下一张</span>
			</a>
		</div>
	</div>

	<!-- 热门商品 -->
	<div class="container-fluid">
		<div class="col-md-12">
			<h2>热门商品&nbsp;&nbsp;</h2>
		</div>
		<%
				for (Goods goods : list) {
			%>
		<div class="col-md-2"
			style="text-align: center; height: 200px; padding: 10px 0px;">
			<a href="<%=basePath%>goods/goodsdetail?goodsid=<%=goods.getId()%>">
				<img src="<%=basePath%>static/<%=goods.getImg() %>" width="130"
				height="130" style="display: inline-block;">
			</a>
			<p>
				<a href="<%=basePath%>goods/goodsdetail?goodsid=<%=goods.getId()%>"
					style='color: #666'><%=goods.getCoursename()%></a>
			</p>
			<p>
				<font color="#E4393C" style="font-size: 16px">&yen;<%=goods.getSingleprice() %></font>
			</p>
		</div>
		<%
				}
			%>
	</div>

	<!-- 最新商品 -->
	<div class="container-fluid">
		<div class="col-md-12">
			<h2>最新商品&nbsp;&nbsp;</h2>
		</div>
		<%
				for (Goods goods : list2) {
			%>
		<div class="col-md-2"
			style="text-align: center; height: 200px; padding: 10px 0px;">
			<a href="<%=basePath%>goods/goodsdetail?goodsid=<%=goods.getId()%>">
				<img src="<%=basePath%>static/<%=goods.getImg() %>" width="130"
				height="130" style="display: inline-block;">
			</a>
			<p>
				<a href="<%=basePath%>goods/goodsdetail?goodsid=<%=goods.getId()%>"
					style='color: #666'><%=goods.getCoursename()%></a>
			</p>
			<p>
				<font color="#E4393C" style="font-size: 16px">&yen;<%=goods.getSingleprice() %></font>
			</p>
		</div>
		<%
				}
			%>
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