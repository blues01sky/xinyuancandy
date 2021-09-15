<%@page import="setting.entity.Setting"%>
<%@page import="user.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改信息</title>
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

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
<%
	User user = (User) request.getAttribute("user");
	Setting setting = (Setting) request.getAttribute("setting");
	String username = (String) session.getAttribute("username");
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
						<li><a href="<%=basePath%>main/order">我的订单</a></li>
						<li><a href="<%=basePath%>order/cart">购物车</a></li>
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/login">登录</a></li>
						<li><a href="<%=basePath%>main/regist">注册</a></li>
						<%
							} else {
						%>
						<li><a href="<%=basePath%>main/index">主页</a></li>
						<li><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li><a href="<%=basePath%>main/order">我的订单</a></li>
						<li><a href="<%=basePath%>order/cart">购物车</a></li>
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/logout">退出</a></li>
						<li class="active"><a href="<%=basePath%>user/update">修改信息</a></li>
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
	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>信息修改</font>
				<form class="form-horizontal" style="margin-top: 5px;" action="<%=basePath%>user/update" method="post">
				<div class="form-group">
						<label class="col-sm-2 control-label">当前用户为：</label>
						<div class="col-sm-6"><input type="text" class="form-control" name="password" style="border: hidden;"
								value="<%=user.getName() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="password"
								value="<%=user.getPassword() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">收货人</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="consignee"
								value="<%=user.getConsignee() %>">
						</div>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<select name="sex">
							
								<option value="<%=user.getSex() %>" selected="selected"><%=user.getSex() %></option>
								<option value="男">------</option>
								<option value="男">男</option>
								<option value="女">女</option>
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="address"
								value="<%=user.getAddress() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="phone"
								value="<%=user.getPhone() %>">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="修改" name="submit"
								style="background: url('<%=basePath %>static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							<input type="submit" width="100px" value="返回" onclick=""
								style="background: url('<%=basePath %>static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

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

	</div>
</body>

</html>