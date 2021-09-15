<%@page import="goods.entity.Goods"%>
<%@page import="java.util.List"%>
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
<link href="<%=basePath%>static/css/Style1.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script language="javascript"
	src="<%=basePath%>static/js/public.js"></script>

</HEAD>
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
										background="<%=basePath %>static/images/mis_05b.jpg">
										<img
										src="<%=basePath %>static/images/mis_05a.jpg"
										width="6" height="18">
									</td>
									<td width="155" valign="bottom"
										background="<%=basePath %>static/images/mis_05b.jpg">
										用户名：
										<%
											String adminname = (String)session.getAttribute("AdminName");
										%>
				 <font color="blue"><%=adminname %></font>&nbsp;&nbsp;&nbsp; <a href="<%=basePath%>admin/logout">退出登录</a>
									</td>
									<td width="10" align="right"
										background="<%=basePath %>static/images/mis_05b.jpg">
										<img
										src="<%=basePath %>static/images/mis_05c.jpg"
										width="6" height="18">
									</td>
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
			<li role="presentation" class="active"><a href="<%=basePath%>goods/index">商品管理</a></li>
			<li role="presentation"><a href="<%=basePath%>aftermain/order">订单管理</a></li>
			<li role="presentation"><a href="<%=basePath%>setting/gonggaolist">公告管理</a></li>
			<li role="presentation"><a href="<%=basePath%>setting/addgonggaopage">发布公告</a></li>
			<li role="presentation"><a href="<%=basePath%>aftermain/rizhi">日志管理</a></li>
			<li role="presentation"><a href="<%=basePath%>aftermain/xiaoshoue">销售额</a></li>
			<li role="presentation"><a href="<%=basePath%>aftermain/liuyan">留言</a></li>
			
			<li role="presentation"><a href="javascript:if(confirm('确认要退出吗？')) location.href='<%=basePath %>admin/logout'">退出</a></li>
		</ul>
	</div>
	<div class="col-lg-11">
		<form id="Form1" name="Form1"
		action="<%=basePath%>"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<a href="<%=basePath%>goods/add">添加</a>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="2%">编号</td>
								<td align="center" width="8%">商品名</td>
								<td align="center" width="3%">热门</td>
								<td align="center" width="5%">售价</td>
								<td align="center" width="5%">优惠价</td>
								<td align="center" width="5%">进价</td>
								<td align="center" width="5%">库存</td>
								<td align="center" width="15%">商品图片地址</td>
								<td align="center" width="5%">分类</td>
								<td align="center" width="13%">添加时间</td>
								<td align="center" width="13%">更新时间</td>
								<td width="5%" align="center">补库存</td>
								<td width="3%" align="center">编辑</td>
								<td width="3%" align="center">删除</td>
							</tr>
							
							<%
								List<Goods> goods = (List<Goods>)request.getAttribute("lists");
							int i =1;
								for(Goods good : goods){
									%>
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=i %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getCoursename() %></td>
									<%
										if(good.getTemp5().equals("hot")){
											%><td style="CURSOR: hand; HEIGHT: 22px" align="center"
									>是</td><%
										}else{
											%><td style="CURSOR: hand; HEIGHT: 22px" align="center"
													>否</td><%
										}
									%>
								
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getSingleprice() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getYouhui() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getJinjia() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getKucunliang() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getImg() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getFenlei() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getCreatetime() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=good.getUpdatetime() %></td>
								<td align="center" style="HEIGHT: 22px;"><a style="color: blue;"
									href="<%=basePath %>goods/editnum?goodsid=<%=good.getId() %>">增加库存</a></td>
									<td align="center" style="HEIGHT: 22px"><a
									href="<%=basePath %>goods/edit?goodsid=<%=good.getId() %>">
										<img
										src="<%=basePath %>static/images/i_edit.gif"
										border="0" style="CURSOR: hand">
								</a></td>
								<td align="center" style="HEIGHT: 22px"><a href="javascript:if(confirm('删除用户<%=good.getCoursename() %>吗？')) location.href='<%=basePath%>goods/del?goodsid=<%=good.getId() %>'"> <img
										src="<%=basePath %>static/images/i_del.gif"
										width="16" height="16" border="0" style="CURSOR: hand">
								</a></td>
							</tr>
							<%
							i++;
								}
							%>
						</table>
					</td>
				</tr>

			</TBODY>
		</table>
	</form>
	</div>
</body>
</HTML>

