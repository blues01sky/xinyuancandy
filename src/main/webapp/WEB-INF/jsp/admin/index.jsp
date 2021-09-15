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
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type">
		<title>网上商城管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=basePath%>static/css/general.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/css/main.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>static/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js"
	type="text/javascript"></script>
<style type="text/css">
body {
  color: white;
}
</style>
</head>
<body style="background: #278296">
<form method="post" action="<%=basePath%>admin/login" target="_parent" name='theForm' onsubmit="return validate()">
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tr>
    <td style="padding-left: 50px">
      <table>
      <tr>
        <td>管理员姓名：</td>
        <td><input type="text" id="adminname" /></td>
      </tr>
      <tr>
        <td>管理员密码：</td>
        <td><input type="password" id="password" /></td>
      </tr>
      <tr><td>&nbsp;</td><td>
      
     <a href="JavaScript::(0)" class="btn" onclick="login()"><input type="button" value="进入管理中心" class="button" /></a>
      </td></tr>
      </table>
    </td>
  </tr>
  </table>
</form>
<script>
  document.forms['theForm'].elements['username'].focus();
  /**
   * 检查表单输入的内容
   */
  function validate()
  {
    var validator = new Validator('theForm');
    validator.required('username', user_name_empty);
    //validator.required('password', password_empty);
    if (document.forms['theForm'].elements['captcha'])
    {
      validator.required('captcha', captcha_empty);
    }
    return validator.passed();
  }
  
  function login(){
		var name = document.getElementById('adminname').value;
		if(name==""){
			alert('账号为空，请输入账号后再试');
			window.location.reload();
		}else{
			console.log('账号检测通过！');
		}
		var password = document.getElementById('password').value;
		if(password==""){
			alert('密码为空，请输入密码后再试');
			window.location.reload();
		}else{
			console.log('密码检测通过!');
		}
		var params = {
				"adminname":name,
				"password":password
				};
		
	 $.ajax({
  		type: 'POST',
			cache: true,
  	    ansyv: false,
  	    data:params,
  	    datatype:'json',
  	    url: '${pageContext.request.contextPath}/admin/login',
  	    success:function(data){
  	    	if(data=='AdminLoginSuccess'){
					alert('登录成功，即将调到主页');
					window.location.href="<%=basePath%>admin/home";
				}else if(data=="AdminLoginPasswordError"){
						alert('密码错误，登录失败，请重新登录！');
						window.location.reload();	
				}else if(data=="AdminNameNotExist"){
						alert('用户名不存在，请重试！');
						window.location.reload();
				}else if(parseInt(data)<=5){
						confirm('该错误您已经犯了'+data+'次，如果超过5次将限制您当天的访问请求！');
						window.location.reload();
				}else if(parseInt(data)>5){
						confirm('该错误您已经犯超过5次将限制您当天的访问请求！');
						window.location.href="<%=basePath%>main/error";
				}
  	    },
  	    error:function(data){
  	    	window.location.reload();	
  	    }
  	})
	}
  
</script>
</body>