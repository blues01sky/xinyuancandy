<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>安全访问系统</title>
<script type="text/javascript">
	window.onload = function(){
		alert('欢迎访问！');
		window.location.href="<%=basePath%>main/index";
	}
	
</script>
</head>
<body>
</body>
</html>
