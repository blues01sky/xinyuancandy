<%@page import="setting.entity.Setting"%>
<%@page import="goods.entity.Goods"%>
<%@page import="java.util.List"%>
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
<title>商品</title>
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css" type="text/css" />
<script src="<%=basePath%>static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="<%=basePath%>static/css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>
<%
	List<Goods> lists = (List<Goods>) request.getAttribute("lists");
	int pagenum = (int) request.getAttribute("pagenum");
	int count = (int) request.getAttribute("count");
	int pagesize = (int) request.getAttribute("pagesize");
	int Previous = 0;
	int next = 0;
	if(pagenum==0){
		Previous = 0;
		next = pagenum+2;
	}else if(pagenum<=pagesize){
		Previous = pagenum-1;
		next = pagenum;
	}else{
		Previous = pagenum-1;
		next = pagenum+1;
	}
	String username = (String) session.getAttribute("username");
	Setting setting = (Setting) request.getAttribute("setting");
%>
<script type="text/javascript">
	$(document).ready(function(){
	  $('#yeshu<%=pagenum%>').attr("class","active");
	});
</script>
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
						<li class="active"><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li><a href="<%=basePath%>main/order">我的订单</a></li>
						<li><a href="<%=basePath%>order/cart">购物车</a></li>
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/login">登录</a></li>
						<li><a href="<%=basePath%>main/regist">注册</a></li>
						<%
							} else {
						%>
						<li><a href="<%=basePath%>main/index">主页</a></li>
						<li class="active"><a href="<%=basePath%>aftermain/goods">商品</a></li>
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
	<div class="row" style="width: 1210px; margin: 0 auto;">
		<div class="col-md-12"></div>
		<%
			for(Goods goods : lists){
		%>
		<div class="col-md-2">
			<a href="<%=basePath %>goods/goodsdetail?goodsid=<%=goods.getId() %>"> <img src="<%=basePath %>static/<%=goods.getImg() %>"
				width="170" height="170" style="display: inline-block;">
			</a>
			<p>
				<a href="<%=basePath%>product_info.jsp" style='color: green'><%=goods.getCoursename() %></a>
			</p>
			<p>
				<font color="#FF0000">商城价：&yen;<%=goods.getSingleprice() %></font>
			</p>
		</div>
		<%
			}
		%>

	</div>

	<!--分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
			<li><a href="<%=basePath%>goods/page?pagenum=<%=Previous %>&count=<%=count%>" aria-label="Previous"><span
					aria-hidden="true">&laquo;</span></a></li>
					<%
					for(int i= 1;i<=pagesize;i++){
						%>
					<li id="yeshu<%=i %>"><a href="<%=basePath%>goods/page?pagenum=<%=i %>&count=<%=count%>"><%=i %></a></li>
					<%
					}
					%>
			<li><a href="<%=basePath%>goods/page?pagenum=<%=next %>&count=<%=count%>" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</div> 
	<!-- 分页结束 -->

	

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