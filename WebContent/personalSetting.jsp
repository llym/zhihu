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
<title>首页</title>
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

.right2 {
	margin-right: 100px;
	float: left;
	height: 200px;
	width: 300px;
	background: white;
}

.right3 {
	margin-right: 100px;
	float: left;
	height: 200px;
	width: 300px;
	background: white;
}

.content {
	height: 300px;
}

#title, #author {
	font-size: 18px;
	font-weight: bold;
}

#commentName {
	font-size: 16px;
}

#agree {
	background-color: rgb(209, 234, 255);
}

.tip1, .tip2, .tip3 {
	padding-left: 10px;
	padding-right: 20px;
	font-size: 16px;
	color: grey;
}

.collect {
	display: inline-block;
}

.sharing {
	display: inline-block;
}

#collectName, #contentNum {
	padding-right: 200px;
}
</style>

</head>

<body>
	<jsp:include page="WEB-INF/jsp/navigation.jsp" flush="true"></jsp:include>

	<div class="container mt-3">
		<div class="left" style="background-color: white; float: left;">
			<div class="row">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="v-pills-home-tab"
							data-toggle="pill" href="#v-pills-home" role="tab"
							aria-controls="v-pills-home" aria-selected="true">Home</a> <a
							class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
							href="#v-pills-profile" role="tab"
							aria-controls="v-pills-profile" aria-selected="false">Profile</a>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill"
							href="#v-pills-messages" role="tab"
							aria-controls="v-pills-messages" aria-selected="false">Messages</a>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill"
							href="#v-pills-settings" role="tab"
							aria-controls="v-pills-settings" aria-selected="false">Settings</a>
					</div>
				</div>
				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">
						<div class="tab-pane fade show active" id="v-pills-home"
							role="tabpanel" aria-labelledby="v-pills-home-tab">...</div>
						<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
							aria-labelledby="v-pills-profile-tab">...</div>
						<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
							aria-labelledby="v-pills-messages-tab">...</div>
						<div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
							aria-labelledby="v-pills-settings-tab">...</div>
					</div>
				</div>
			</div>




		</div>



		<div class="right1" style="background-color: white; float: right">



		</div>

	</div>


</body>

</html>