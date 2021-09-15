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
	Goods goods = (Goods) request.getAttribute("goods");
	String username = (String) session.getAttribute("username");
%>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#add").click(function(){
		  var num = $("#goodsnum").val();
		  var shuliang = parseInt(num);
		  shuliang = shuliang +1;
		  if(num ==<%=goods.getKucunliang() %>){
			  alert("超出库存不能再增加！");
			 return;
		  }
	    $("#goodsnum").val(shuliang);
	  });
	  $("#jian").click(function(){
		  var num = $("#goodsnum").val();
		  var shuliang = parseInt(num);
		  shuliang = shuliang - 1;
		  if(num ==1){
			  alert("不能再减少了！");
			 return;
		  }
		  $("#goodsnum").val(shuliang);
	  });
	});
	
	 function addcart(){
		 <%
		 	if(username==null){
		 		%>
		 		alert("请先登录后再进行购物！");
		 		window.location.href="<%=basePath%>main/login";
		 		<%
		 	}
		 %>
			var goodsid = document.getElementById('goodsid').value;
			if(goodsid==""){
				alert('商品为空，请输入账号后再试');
				window.location.reload();
			}else{
				console.log('商品检测通过！');
			}
			var goodsnum = document.getElementById('goodsnum').value;
			if(goodsnum==""){
				alert('商品数量为空，请再试');
				window.location.reload();
			}else if(goodsnum ><%=goods.getKucunliang() %>){
				  alert("超出库存！已为您设置为最大库存");
				  $("#goodsnum").val(<%=goods.getKucunliang() %>);
					 return;
				 }else{
				console.log('商品数量检测通过!');
			}
			var params = {
					"goodsid":goodsid,
					"goodsnum":goodsnum
					};
			
		 $.ajax({
	  		type: 'POST',
				cache: true,
	  	    ansyv: false,
	  	    data:params,
	  	    datatype:'json',
	  	    url: '<%=basePath %>order/addcart',
	  	    success:function(data){
	  	    	if(data=='AddSuccess'){
						alert('添加购物车成功，即将调到我的购物车！');
						window.location.href="<%=basePath%>order/cart";
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
	<div class="container">
		<div class="row">
			<div
				style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="<%=basePath%>/main/index">首页&nbsp;&nbsp;&gt;</a> <a href="<%=basePath%>fenlei.goods?fenlei=<%=goods.getFenlei() %>"><%=goods.getFenlei() %></a>
			</div>

			<div style="margin: 0 auto; width: 950px;">
				<div class="col-md-6">
					<img style="opacity: 1; width: 200px; height: 200px;" title=""
						class="medium"
						src="<%=basePath%>static/<%=goods.getImg() %>">
				</div>
				
				<div class="col-md-6">
					<div>
						<input type="text" value="<%=goods.getId() %>" id="goodsid" hidden/>
						<strong><%=goods.getCoursename() %></strong>
					</div>
					<div style="margin: 10px 0 10px 0;">
						价格：<strong style="color: #ef0101;">￥：<%=goods.getYouhui() %></strong> 参 考 价：
						<del>￥<%=goods.getSingleprice() %></del>
					</div>
					
					<div style="margin: 10px 0 10px 0;">
						商品分类: <a target="_blank"><%=goods.getFenlei() %></a>
					</div>

					<div style="margin: 10px 0 10px 0;">
						促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)"
							style="background-color: #f07373;">限时抢购</a>；库存量：<%=goods.getKucunliang() %>
					</div>

					<div style="margin: 10px 0 10px 0;">
							购买数量: <input type="button" id="jian" name="jian" value="-">
							<input id="goodsnum" name="goodsnum" type="text" value="1">
							<input id="add" name="add" type="button" value="+">
					</div>
					<div style="margin: 10px 0 10px 0;">
							<input type="button" value="添加到购物车" onclick="addcart()" />
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div style="width: 950px; margin: 0 auto;">
				<div
					style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong>商品介绍:</strong>
					<span><%=goods.getTemp1() %></span>
				</div>
				
				<div>
					<br><br><br>
					<h2>商品大图</h2>
					<img title=""
						class="medium"
						src="<%=basePath%>static/<%=goods.getImg() %>">
				</div>

				<div
					style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong>商品参数</strong>
				</div>
				<div style="margin-top: 10px; width: 900px;">
					<table class="table table-bordered">
						<tbody>
							<tr class="active">
								<th colspan="2">基本参数</th>
							</tr>
							<tr>
								<th width="10%">受欢迎度</th>
								<td width="30%"><%=goods.getTemp4() %>%</td>
							</tr>
							<tr>
								<th width="10%">计量方式</th>
								<td><%=goods.getTemp2() %></td>
							</tr>
							<tr>
								<th width="10%">甜度</th>
								<td><%=goods.getTemp3() %>%</td>
							</tr>
						</tbody>
					</table>
				</div>

				

				
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