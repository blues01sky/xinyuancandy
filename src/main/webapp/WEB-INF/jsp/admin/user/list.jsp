<%@page import="user.entity.User"%>
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
<script type="text/javascript">
		</script>
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
			<li role="presentation" class="active"><a href="<%=basePath%>user/index">用户管理</a></li>
			<li role="presentation"><a href="<%=basePath%>goods/index">商品管理</a></li>
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
		action="<%=basePath%>${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>用户列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="5%">id</td>
									<td align="center" width="10%">用户名</td>
									<td align="center" width="10%">收货人名</td>
									<td align="center" width="10%">密码</td>
									<td align="center" width="10%">电话</td>
									<td align="center" width="15%">地址</td>
									<td align="center" width="5%">性别</td>
									<td align="center" width="18%">创建时间</td>
									<td align="center" width="17%">更新时间</td>
									<td width="8%" align="center">编辑</td>
									<td width="8%" align="center">删除</td>
							</tr>
							
							<%
								List<User> users = (List<User>)request.getAttribute("list");
								int i =1;
								for(User user : users){
									%>
									<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=i %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getName() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getConsignee() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									w><%=user.getPassword() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getPhone() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getAddress() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getSex() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getCreatetime() %></td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									><%=user.getUpdatetime() %></td>
								<td align="center" style="HEIGHT: 22px"><a
									href="<%=basePath %>user/edit?userid=<%=user.getId() %>">
										<img
										src="<%=basePath %>static/images/i_edit.gif"
										border="0" style="CURSOR: hand">
								</a></td>

								<td align="center" style="HEIGHT: 22px"><a href="
								javascript:if(confirm('删除用户<%=user.getName() %>吗？')) location.href='<%=basePath %>user/del?userid=<%=user.getId() %>'"> <img
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

