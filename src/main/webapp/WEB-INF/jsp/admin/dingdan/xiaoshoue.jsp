<%@page import="java.util.List"%>
<%@page import="xiaoshoue.entity.Xioashoue"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>static/css/Style1.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" src="<%=basePath%>static/js/public.js"></script>
<body>
	<div>
		<img width="100%" src="<%=basePath %>static/images/top_100.jpg">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" valign="bottom"
					background="<%=basePath %>static/images/mis_01.jpg">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="85%" align="left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td width="15%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="16"
											background="<%=basePath %>static/images/mis_05b.jpg"><img
											src="<%=basePath %>static/images/mis_05a.jpg" width="6"
											height="18"></td>
										<td width="155" valign="bottom"
											background="<%=basePath %>static/images/mis_05b.jpg">
											用户名： <%
											String adminname = (String)session.getAttribute("AdminName");
										%> <font color="blue"><%=adminname %></font>&nbsp;&nbsp;&nbsp;
											<a href="<%=basePath%>admin/logout">退出登录</a>
										</td>
										<td width="10" align="right"
											background="<%=basePath %>static/images/mis_05b.jpg"><img
											src="<%=basePath %>static/images/mis_05c.jpg" width="6"
											height="18"></td>
									</tr>
								</table>
							</td>
							<td align="right" width="5%"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div class="nav col-lg-1">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation"><a href="<%=basePath%>admin/home">主页</a></li>
			<li role="presentation"><a href="<%=basePath%>admin/list">管理员管理</a></li>
			<li role="presentation"><a href="<%=basePath%>user/index">用户管理</a></li>
			<li role="presentation"><a href="<%=basePath%>goods/index">商品管理</a></li>
			<li role="presentation"><a href="<%=basePath%>aftermain/order">订单管理</a></li>
			<li role="presentation"><a
				href="<%=basePath%>setting/gonggaolist">公告管理</a></li>
			<li role="presentation"><a
				href="<%=basePath%>setting/addgonggaopage">发布公告</a></li>
			<li role="presentation"><a href="<%=basePath%>aftermain/rizhi">日志管理</a></li>
			<li role="presentation" class="active"><a
				href="<%=basePath%>aftermain/xiaoshoue">销售额</a></li>

			<li role="presentation"><a
				href="javascript:if(confirm('确认要退出吗？')) location.href='<%=basePath %>admin/logout'">退出</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="col-lg-3" style="text-align: center;">分类</div>
		<div class="col-md-3" style="text-align: center;">销售额</div>
		<div class="col-md-3" style="text-align: center;">净利润</div>
		<div class="col-md-2" style="text-align: center;"></div>
	</div>
	<%
		List<Xioashoue> list = (List<Xioashoue>) request.getAttribute("list");
		double zongjia = 0.0;
		for(Xioashoue xioashoue : list){
			zongjia = zongjia + xioashoue.getLiushui();
			%>
	<div class="row">
		<div class="col-md-3" style="text-align: center;"><%=xioashoue.getFenlei() %></div>
		<div class="col-md-3" style="text-align: center;"><%=xioashoue.getLiushui() %></div>
		<div class="col-md-3" style="text-align: center;"><%=xioashoue.getLirun() %></div>
		<div class="col-md-2" style="text-align: center;"></div>
	</div>
		<%
		}
	%>	
	<div class="row">
		<div class="col-md-8" style="text-align: center;"></div>
		<div class="col-md-3" style="text-align: right;">总计：<%=zongjia %></div>
	</div>	

</body>
</HTML>

