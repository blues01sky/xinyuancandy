<%@page import="admin.entity.Admin"%>
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
<link href="<%=basePath%>static/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="<%=basePath%>static/js/public.js"></script>
<%
	List<Admin> admins = (List<Admin>) request.getAttribute("list");
%>
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
			<li role="presentation" class="active"><a href="<%=basePath%>admin/list">管理员管理</a></li>
			<li role="presentation"><a href="<%=basePath%>user/index">用户管理</a></li>
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
		<form action="<%=basePath%>" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center"
				bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3"><strong>管理员列表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right"><a href="<%=basePath%>admin/addpage"><button
									type="button" id="add" name="add" value="添加" class="button_add">&#28155;&#21152;</button>
						</a></td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">

								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
									<td align="center" width="5%">id</td>
									<td align="center" width="10%">管理员名</td>
									<td align="center" width="10%">密码</td>
									<td align="center" width="10%">电话</td>
									<td align="center" width="15%">地址</td>
									<td align="center" width="18%">创建时间</td>
									<td align="center" width="17%">更新时间</td>
									<td width="5%" align="center">编辑</td>
									<td width="5%" align="center">删除</td>
								</tr>
								<%
								int i = 1;
									for (Admin admin : admins) {
								%>
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=i %></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=admin.getAdminname() %></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=admin.getPassword() %></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=admin.getPhone() %></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=admin.getAddress() %></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=admin.getCreatetime() %></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										><%=admin.getUpdatetime() %></td>
									<td align="center" style="HEIGHT: 22px"><a
									href="<%=basePath %>admin/edit?adminnameid=<%=admin.getId() %>">
											<img
											src="<%=basePath %>static/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 22px"><a href="javascript:if(confirm('删除用户<%=admin.getAdminname() %>吗？')) location.href='<%=basePath%>admin/del?adminid=<%=admin.getId() %>'"> <img
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

