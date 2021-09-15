<%@page import="setting.entity.Setting"%>
<%@page import="order.entity.Order"%>
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
		<title>我的订单</title>
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
			List<Order> orders = (List<Order>) request.getAttribute("list");
			String username = (String) session.getAttribute("username");
			Setting setting = (Setting) request.getAttribute("setting");
		%>
		<script>
		
		<%
		int i =1;
		for(Order order : orders){
		%>
		 function setnum<%=i%>(){
		  var goodsid = $("#orderid<%=i%>").val();
		  var num = $("#goodsnum<%=i%>").val();
		  var shuliang = parseInt(num);
		  if(shuliang<1){
			  alert('数量不合理请重新输入！');
			  window.location.reload();
			  return;
		  }
	    var params = {
				"shuliang":shuliang,
				"goodsid":goodsid
				};
	    $.ajax({
	  		type: 'POST',
				cache: true,
	  	    ansyv: false,
	  	    data:params,
	  	    datatype:'json',
	  	    url: '<%=basePath%>order/setnum',
	  	    success:function(data){
	  	    	if(data=='Success'){
		  	    		$("#goodsnum<%=i %>").val(shuliang);
		  	    		$("#zongjia<%=i %>").val(shuliang*<%=order.getSingleprice() %>);
		  	    		 window.location.href="<%=basePath%>order/cart";
					}else if(data=='error'){
						alert('库存量不足！');
						window.location.reload();	
					}
	  	    },
	  	    error:function(data){
	  	    	window.location.reload();	
	  	    }
	  	})
	  }
		$(document).ready(function(){
			
			  $("#add<%=i%>").click(function(){
				  var goodsid = $("#orderid<%=i%>").val();
				  var num = $("#goodsnum<%=i%>").val();
				  var shuliang = parseInt(num);
				  shuliang = shuliang +1;
			    var params = {
						"shuliang":shuliang,
						"goodsid":goodsid
						};
			    $.ajax({
			  		type: 'POST',
						cache: true,
			  	    ansyv: false,
			  	    data:params,
			  	    datatype:'json',
			  	    url: '<%=basePath %>order/addnum',
			  	    success:function(data){
			  	    	if(data=='Success'){
								 $("#goodsnum<%=i%>").val(shuliang);
								 $("#zongjia<%=i %>").val(shuliang*<%=order.getSingleprice() %>);
								
							}else if(data=='error'){
								alert('库存量不足！');
							}
			  	    },
			  	    error:function(data){
			  	    	window.location.reload();	
			  	    }
			  	})
			  });
			  $("#jian<%=i%>").click(function(){
				  var goodsid = $("#orderid<%=i%>").val();
				  var num = $("#goodsnum<%=i%>").val();
				  var shuliang = parseInt(num);
				  shuliang = shuliang - 1;
				  if(num ==1){
					  alert("不能再减少了！");
					 return;
				  }
			    var params = {
						"shuliang":shuliang,
						"goodsid":goodsid
						};
			    $.ajax({
			  		type: 'POST',
						cache: true,
			  	    ansyv: false,
			  	    data:params,
			  	    datatype:'json',
			  	    url: '<%=basePath %>order/jiannum',
			  	    success:function(data){
			  	    	if(data=='Success'){
								 $("#goodsnum<%=i%>").val(shuliang);
								 $("#zongjia<%=i %>").val(shuliang*<%=order.getSingleprice() %>);
							}else if(data=='error'){
								alert('不能再减少了！');
							}
			  	    },
			  	    error:function(data){
			  	    	window.location.reload();	
			  	    }
			  	})
				  
			  });
			});
		<%i++;}%>
		</script>
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
						<li class="active"><a href="<%=basePath%>order/cart">购物车</a></li>
						
						<li><a href="<%=basePath%>main/liuyan">留言</a></li>
						<li><a href="<%=basePath%>main/login">登录</a></li>
						<li><a href="<%=basePath%>main/regist">注册</a></li>
						<%
							} else {
						%>
						<li><a href="<%=basePath%>main/index">主页</a></li>
						<li><a href="<%=basePath%>aftermain/goods">商品</a></li>
						<li><a href="<%=basePath%>main/order">我的订单</a></li>
						<li class="active"><a href="<%=basePath%>order/cart">购物车</a></li>
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
				<div style="margin:0 auto; margin-top:10px;width:90%;">
					<strong style="font-size:16px;margin:5px 0;">购物车</strong>
					<%
						if(orders==null){
							%>
							<script type="text/javascript">
								alert("我的订单为空，先添加商品在访问吧！");
							</script>
							<% 
						}else{
							%>
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th>商品序号</th>
								<th>商品名</th>
								<th>优惠价</th>
								<th>数量</th>
								<th>总价</th>
								<th>操作</th>
							</tr>
							<%
								int j= 1;
								for(Order order : orders){
									%>
							<tr class="active">
								<td width="5%">
									<%=j %>
								</td>
								<td width="15%">
									<a href="<%=basePath %>goods/goodsdetail?goodsid=<%=order.getTemp5() %>"><%=order.getGoodsname() %></a>
								</td>
								<td width="10%">
									<%=order.getSingleprice() %>
								</td>
								<td width="20">
									<input type="button" id="jian<%=j%>" name="jian<%=j%>" value="-">
									<input type="text" onchange="setnum<%=j%>()" id="goodsnum<%=j%>" name="goodsnum<%=j%>" value="<%=order.getGoodsnum() %>" />
									<input id="orderid<%=j%>" name="orderid<%=j%>" type="text" value="<%=order.getId() %>" hidden="hidden">
									<input id="add<%=j%>" name="add<%=j%>" type="button" value="+">
								</td>
								<td width="10%">
									<input id="zongjia<%=j%>" value="<%=order.getSumprice() %>" style="border: none;" type="text"/>
								</td>
								<td  width="10%">
									<a href="javascript:if(confirm('删除<%=order.getGoodsname() %>的商品吗？')) location.href='<%=basePath%>order/userdelcart?orderid=<%=order.getId() %>'" class="delete">删除</a>
								</td>
							</tr>
							<%
								j++;
								}
						}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<div style="margin-right:130px;">
				<div style="text-align:right;">
					金额: <strong style="color:#ff6600;" >
						<%
						double sum = 0;
								for(Order order : orders){
									sum += order.getGoodsnum()*order.getSingleprice() ;
								}
									%>
					<span id="zongjia" name="zongjia"><%=sum %></span>
					</strong>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="<%=basePath%>order/carttocheckout">
						<input type="button" width="100" value="提交订单" name="submit" style="background: url('<%=basePath %>static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
					</a>
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

</body>

</html>