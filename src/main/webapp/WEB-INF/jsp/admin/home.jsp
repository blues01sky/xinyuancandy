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
		<script>
			function gettime() {
				var now = new Date();
				var year = now.getFullYear();
				var month = now.getMonth() + 1;
				var day = now.getDate();
				var hour = now.getHours();
				var minutes = now.getMinutes();
				var seconds = now.getSeconds();

				var day = now.getDay();
				var weeks = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
				var week = weeks[day];

				if(month < 10) {
					month = "0" + month;
				}
				if(day < 10) {
					day = "0" + day;
				}
				if(seconds < 10) {
					seconds = "0" + seconds;
				}
				if(hour < 10) {
					hour = "0" + hour;
				}
				if(minutes < 10) {
					minutes = "0" + minutes;
				}
				var time = year + "年" + month + "月" + day + "日" + " " + hour + "时" + minutes + "分" + seconds + "秒" + " " + week;
				var showTime = document.getElementById("showtime");
				showTime.innerHTML = time;
			}
			setInterval("gettime()", 1000);
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
			<li role="presentation" class="active"><a href="<%=basePath%>admin/home">主页</a></li>
			<li role="presentation"><a href="<%=basePath%>admin/list">管理员管理</a></li>
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
		<form name="Form1" method="post" action="<%=basePath%>name.aspx" id="Form1">

	<table width="100%" border="0" height="88" border="1" background="<%=basePath %>static/images/back1.JPG">
		<tr>
			<td colspan=3 class="ta_01" align="center" bgcolor="#afd1f3"><strong>系统首页</strong></td>
		</tr>

		<tr>
			
			</tr>
			<tr></tr>
			<tr>
			<td width="65%" height="200px" align="center" valign="middle" style="margin-top:200px;">
			<a href="javascript:void()">现在时间是：<span id="showtime"></span>
					</a></td>
		</tr>
		<tr><td height=2></td></tr>
	</table>

	</form>
	</div>
</body>
</HTML>

