<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link href="common/tool/bootstrap4/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="common/tool/jquery/jquery.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>
<link href="common/tool/layui/css/layui.css" rel="stylesheet">
<script src="common/tool/layui/layui.js"></script>
<script src="common/tool/js/md5.js"></script>
<title>个人设置</title>
<style>
body {
	background-color: rgb(248, 248, 248);
}

.left {
	float: left;
	margin-left: 100px;
	background: white;
	width: 600px;
}

.right1 {
	margin-right: 100px;
	float: left;
	height: 100px;
	width: 300px;
	background: white;
}

input:-webkit-autofill,select:-webkit-autofill {  
    -webkit-box-shadow: 0 0 0px 1000px white  inset !important;  
} 
 
input{
    outline-color: invert ;
	outline-style: none ;
	outline-width: 0px ;
	border: none ;
	border-style: none ;
	text-shadow: none ;
	-webkit-appearance: none ;
	-webkit-user-select: text ;
	outline-color: transparent ;
	box-shadow: none;
}
</style>

<script>
function getUserInfo(obj){
	$.post("getUserInfo.do",{
		username:${username}
	},function(data,status){
	});
}

function updatePassword(){
	var newp = $("#password").val();
	console.log(newp)
	$.post("updatePassword.do",{
		username:${username},
		newPassword:md5(newp)
	},function(data,status){
		alert(data)
		
	});
}

function updateTelNum(){
	var newTel = $("#telNum").val();
	console.log(newTel)
	 $.post("checkTelnum.do",{
         	telnum:newTel
				    },
				function(data,status){
				    	if(data!=""){
				    		alert(data)
				    		return;
				    	}else{
				    		$.post("updateTelNum.do",{
				    			username:${username},
				    			newTelNum:newTel
				    		},function(data,status){
				    			alert(data)
				    			window.location.reload();
				    		});
				    	}
				    });
	
	
}

function updateEmail(){
	var newE = $("#email").val();
	console.log(newE)
	$.post("updateEmail.do",{
		username:${username},
		newEmail:newE
	},function(data,status){
		alert(data)
		window.location.reload();
	});
}
	
	$(function(){
		/*  */
		
		
		
	})
</script>


</head>

<body onload="getUserInfo(this)">
	<jsp:include page="navigation.jsp" flush="true"></jsp:include>

	<div class="container mt-3">
		<div class="left" style="background-color: white; float: left;">
			<div class="row">
				<div class="col-3"  style="border-right: 1px solid;border-color: #f6f6f6">
					<div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="v-pills-home-tab"
							data-toggle="pill" href="#v-pills-home" role="tab"
                            aria-controls="v-pills-home" aria-selected="true">
							<img src="common/image/my.png" style="width:15px;height:15px;"/>账号与密码</a> <br/>
							<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
							href="#v-pills-profile" role="tab"
                            aria-controls="v-pills-profile" aria-selected="false">
                            <img src="common/image/message.png" style="width:15px;height:15px;"/>消息与邮件</a><br/>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill"
							href="#v-pills-messages" role="tab"
                            aria-controls="v-pills-messages" aria-selected="false">
                            <img src="common/image/stop.png" style="width:15px;height:15px;"/>屏蔽</a><br/>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill"
							href="#v-pills-settings" role="tab"
                            aria-controls="v-pills-private" aria-selected="false">
                            <img src="common/image/lock.png" style="width:15px;height:15px;"/>隐私</a><br/>
                        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill"
							href="#v--sepillsttings" role="tab"
                            aria-controls="v-pills-settings" aria-selected="false">
                            <img src="common/image/setting.png" style="width:15px;height:15px;"/>偏好设置</a>
					</div>
				</div>
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade show active" id="v-pills-home"
							role="tabpanel" aria-labelledby="v-pills-home-tab">
						<!--账号与密码-->
						<h4 class="mt-2">账号与密码</h4>
						<input type="text" placeholder="账号设置/个性域名" disabled="true" 
						style="border:0;background-color: white;width: 400px;">
						<div class="dropdown-divider "></div>
						<h5 class="mt-4">账设置号</h5>
						<input type="text" placeholder="绑定手机和邮箱，并设置密码，账号安全" 
						disabled="true" style="border:0;background-color: white;width: 400px;">
						<div class="dropdown-divider "></div>
						<h6 class="mt-4 ml-3">密码</h6>
						<input id="password" class="ml-3" type="password" placeholder="未设置" style="width: 360px;" value="123456">
						<a href="#" onclick="updatePassword()">提交</a>
						<div class="dropdown-divider "></div>
						<h6 class="mt-4 ml-3">绑定手机</h6>
						<input id="telNum" class="ml-3" type="text" placeholder="未绑定"style="width: 360px;"
							value="${userTelNum}">
						<a href="#" onclick="updateTelNum()">提交</a>
						<div class="dropdown-divider "></div>
						<h6 class="mt-4 ml-3">绑定邮箱</h6>
						<input id="email" class="ml-3" type="text" placeholder="未绑定"style="width: 360px;"
							value="${userEmail}">
						<a href="#" onclick="updateEmail()">提交</a>
						<div class="dropdown-divider "></div>
						<h6 class="mt-4 ml-3">个性域名</h6>
						<input class="ml-3" type="text" placeholder="个人主页的地址，个性域名只可更改一次" 
						disabled="true" style="background-color: white;width: 360px;">
						<div class="dropdown-divider "></div><br/>
						</div>
						<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
							aria-labelledby="v-pills-profile-tab">
						<!--账设置号-->
						
						
						</div>
						<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
							aria-labelledby="v-pills-messages-tab">...</div>
						<div class="tab-pane fade" id="v-pills-private" role="tabpanel"
                            aria-labelledby="v-pills-settings-tab">...</div>
                        <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
							aria-labelledby="v-pills-settings-tab">...</div>
					</div>
				</div>
				<div class="ml-5 mt-4" style="background-color: #f6f6f6">
					<span class="text-muted">2019知乎&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;刘看山.知乎指南.移动应用.加入知乎.知乎协议.举报投诉.联系我们</span>
				</div>
			</div>
		</div>
		


		<div class="right1" style="background-color: white; float: right;height: 460px;">
			<h4 class="mt-3 ml-3">常见问题</h4>
			<h6 class="mt-3 ml-3">账号与密码</h6><br/>
					  <a class="mt-5 ml-3 text-muted" href="#">1.为什么要进行二次验证？</a><br/><br/>
					  <a class="mt-5 ml-3 text-muted" href="#">2.二次验证的手机/邮箱？</a><br/><br/>
					  <a class="mt-5 ml-3 text-muted" href="#">3.忘记密码怎么办？</a><br/><br/>
					  <a class="mt-5 ml-3 text-muted" href="#">4.手机丢失，手机号不可用怎么办？</a><br/><br/>
					  <a class="mt5 ml-3 text-muted" href="#">5.我要绑定的手机号提示我已经注册了，怎么办？</a>
					<h6 class="mt-3 ml-3">其他问题</h6><br/>
					  <a class="mt-5 ml-3 text-muted" href="#">6.网站出现了问题？问题反馈</a>
		</div>
	</div>

</body>

</html>