<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
	function login(){
		var name = $("#username").val();
		var password = $("#userpassword").val();
		console.log(name+password);
		$.post("login.do",
			    {
			        username:name,
			        userpassword:password
			    },
			        function(data,status){
			        window.location.href = "loginResult.do";
			    });	
	}
	function register(){
		window.location.href = "register.do";
	}
</script>
<title>登录页</title>
</head>
<body>
	<form action="" >
		<ul>
			<li>用户登录</li>
			<li>用户名：<input name="username" id="username" type="text"></li>
			<li>密码：<input name="userpassword" id="userpassword" type="password"></li>
			<li>
			<button type="button" onclick="login()">登录</button>
			<button type="button" onclick="register()">注册</button>
			</li>
		</ul>
	</form>
</body>
</html>