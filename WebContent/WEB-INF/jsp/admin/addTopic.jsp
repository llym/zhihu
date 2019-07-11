<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>知乎-后端管理</title>
<link rel="stylesheet" href="common/tool/layui/css/layui.css">
<link rel="stylesheet" href="common/tool/bootstrap4/css/bootstrap.css">
<script src="common/tool/jquery/jquery.js"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>
<script src="common/tool/layui/layui.js"></script>
<link rel="shortcut icon" href="#" />
<script type="text/javascript">

	function logout(){
		window.location.href="adminLogin.jsp";
	}
</script>

</head>
<body>
	<nav class="navbar navbar-expand-sm  navbar-dark"
		style="background-color: #0069A8">
		<img class="ml-2" src="common/image/zhi.jpg">
		<div style="margin-left: 880px">
			<a href="adminHome.do"><button>
					<img style="height: 20px; width: 20px;" src="common/image/user.png">${username}管理员
				</button></a>
			<button onclick="logout()">
				<img style="height: 20px; width: 20px; border-left: 1px #00FF66"
					src="common/image/poweroff.png">退出
			</button>
		</div>
	</nav>

	<div class="container-fluid" style="margin-top: 0px; height: 600px;">
		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link" href="#">菜单项MENU</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="adminUser.do">用户管理</a></li>
					<li class="nav-item"><a class="nav-link"
						href="adminQuestion.do">问题管理</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="adminTopic.do">话题管理</a></li>
				</ul>
				<hr class="d-sm-none">
			</div>

			<div class="col-sm-10 ">
				<div class="row">
					<div class="row">
						<div class="mb-5">
							<img style="height: 20px; weight: 20px;"
								src="common/image/home.png">新增话题
						</div>
					</div>
					<div class="row mt-5">
						<form role="form" id="billQueryForm"
							action="saveAT.do" method="post">
							<div class="form-group m-auto form-inline">
								<span>话题：</span> <input id="tTitle" name="tTitle" 
									type="text" class="form-control m-1" placeholder="话题" 
									style="height:50px;width:400px"/>
							</div>
							<div class="form-group m-auto form-inline">
								<span>描述：</span> <input id="tDes" 
								name="tDes"  style="height:200px;width:400px"
									type="text" class="form-control m-1" placeholder="请输入描述" />
							</div>
							<button class="btn btn-info btn-sm m-1" type="submit">保存</button>
						</form>
					</div>
					



				</div>
			</div>
		</div>
	</div>
</body>
</html>