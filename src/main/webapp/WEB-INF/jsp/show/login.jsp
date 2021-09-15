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
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
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

.container .row div {
	/* position:relative;
				 float:left; */
	
}

font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}
</style>
<script type="text/javascript">
function login(){
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
	
	var params = {
			"name":username,
			"password":password
			};
 $.ajax({
		type: 'POST',
		cache: true,
	    ansyv: false,
	    data:params,
	    datatype:'json',
	    url: '${pageContext.request.contextPath}/user/login',
	    success:function(data){
	    	if(data=='LoginSuccess'){
				alert('登录成功，即将跳到主页！');
				window.location.href="<%=basePath%>main/index";
			}
	    },
	    error:function(data){
	    	window.location.reload();	
	    }
	}) 
} 
</script>
</head>
<%
	Setting setting = (Setting) request.getAttribute("setting");
String username = (String) session.getAttribute("username");
%>
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
						<li class="active"><a href="<%=basePath%>main/login">登录</a></li>
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
		style="width: 100%; height: 460px; background: #FF2C4C url('<%=basePath %>static/images/login1.jpg') no-repeat;">
		<div class="row">
			<div class="col-md-7">
				<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
			</div>

			<div class="col-md-5">
				<div
					style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
					<font>会员登录</font>
					<div>
						<span style="color: red">${loginInfo }</span>
					</div>
					<form class="form-horizontal" action="<%=basePath%>user/login" method="post">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username"
									placeholder="请输入用户名">
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
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
							<input value="登录" type="button" onclick="login()" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
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