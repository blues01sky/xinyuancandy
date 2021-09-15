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
		<LINK href="<%=basePath%>static/css/Style1.css" type="text/css" rel="stylesheet">
		<link href="<%=basePath%>static/css/bootstrap.css" rel="stylesheet" type="text/css" />
	</HEAD>
	<%
		List<Goods> list = (List<Goods>) request.getAttribute("list");
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
		<form action="<%=basePath%>goods/add" method="post" enctype="multipart/form-data">
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>增加商品</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="goodsname" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						分类：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="type">
							<%
								for(Goods goods : list){
							%>
							<option value="<%=goods.getFenlei() %>"><%=goods.getFenlei() %></option>
							<%
							}%>
						</select>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						是否热门：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="temp5">
							<option value="hot">是</option>
							<option value="nohot">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						售价：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="saleprice" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						进价：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="jinjia" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						受欢迎度：(默认100)
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="temp4" value="100" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						计量方式：(称重或数数)
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="temp2" value="称重" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						甜度：(默认100)
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="temp3" value="100" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						优惠价：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="youhui" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input name="imglocation" type="file" id="imglocation"/>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						库存量：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="goodsnum" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
						商品简介：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="temp1" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>