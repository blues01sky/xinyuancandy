<%@page import="setting.entity.Setting"%>
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
<title>会员注册</title>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css"
	type="text/css" />
<script src="<%=basePath%>static/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="<%=basePath%>static/css/style.css"
	type="text/css" />

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
<script type="text/javascript">
function zhuce(){
	var username = document.getElementById('username').value;
	if(username==""){
		alert('用户名为空，请重试');
		window.location.reload();
	}else{
		console.log('用户检测通过！');
	}
	
	var password = document.getElementById('password').value;
	if(password==""){
		alert('密码为空，请重试');
		window.location.reload();
	}else{
		console.log('密码检测通过！');
	}
	
	var sex = document.getElementById('sex').value;
	if(sex==""){
		alert('性别为空，请重试');
		window.location.reload();
	}else{
		console.log('性别检测通过！');
	}
	
	var address = document.getElementById('address').value;
	
	if(address==""){
		alert('地址为空，请重试');
		window.location.reload();
	}else{
		console.log('地址检测通过！');
	}
	
	var phone = document.getElementById('phone').value;
	if(phone==""){
		alert('电话号码为空，请再试');
		window.location.reload();
	}else{
		console.log('电话号码检测通过!');
	}
	var consignee = document.getElementById('phone').value;
	if(phone==""){
		alert('收货人为空，请再试');
		window.location.reload();
	}else{
		console.log('收货人检测通过!');
	}
	
	var params = {
			"username":username,
			"password":password,
			"sex":sex,
			"address":address,
			"phone":phone,
			"consignee":consignee
			};
 $.ajax({
		type: 'POST',
		cache: true,
	    ansyv: false,
	    data:params,
	    datatype:'json',
	    url: '${pageContext.request.contextPath}/user/regist',
	    success:function(data){
	    	if(data=='AddSuccess'){
				alert('新增用户成功，即将跳到登录页！');
				window.location.href="<%=basePath%>user/login";
				}
			},
			error : function(data) {
				window.location.reload();
			}
		})
	}
</script>
<%
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
						<li class="active"><a href="<%=basePath%>main/regist">注册</a></li>
						<%
							} else {
						%>
						<li><a href="<%=basePath%>main/index">主页</a></li>
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
				<h4 style="text-align: right;color: red;"><%=setting.getGonggao() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
		<div class="container"
			style="width: 100%; background: url('image/regist_bg.jpg');">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8"
					style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
					<font>会员注册</font>
					<form class="form-horizontal" style="margin-top: 5px;" action="<%=basePath%>user/update" method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">收货人</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="consignee"
								placeholder="请输入收货人名字">
						</div>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<select id="sex">
								<option value="男" selected="selected">请选择（默认为男）</option>
								<option value="男">男</option>
								<option value="女">女</option>

							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="address"
								placeholder="请输入地址">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="phone"
								placeholder="请输入电话">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" width="150" value="注册" onclick="zhuce()">
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>

			</div>
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