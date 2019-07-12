<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的主页</title>

<link rel="stylesheet" href="common/tool/bootstrap4/css/bootstrap.css">
<link rel="stylesheet" href="common/tool/layui/css/layui.css"
	media="all">
<script src="common/tool/jquery/jquery.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>

<script src="common/tool/layui/layui.js" charset="utf-8"></script>


<style>
.image1{
	width:10%;
	height:10%;
}
.image2{
	width:30%;
	height:30%;
}

.normalFace {
	width: 220px;
	height: 220px;
	background-size: cover;
	display: block;
	border-radius: 110px;
	-webkit-border-radius: 110px;
	-moz-border-radius: 110px
}
</style>

<script type="text/javascript">
function getIdeaPhotoPath(obj){
	//obj传入的DOM对象
	console.log(obj)
	console.log(obj.id);
	console.log(obj.src);
	console.log(obj.onload);
	var path
	$.post("getIdeaPhotoPath.do",{
		id:obj.id
	},function(data){
		console.log(data)
		obj.src=data
		obj.onload=""
		console.log(obj.onload)
		console.log(obj.src)
		
	});
	
}



	function fold() {
		var val = $('#change-text').text();
		if (val == "﹀ 查看详细资料") {
			$('#change-text').text('︿ 收起详细资料');
		} else {
			$('#change-text').text('﹀ 查看详细资料');
		}
	}

	
	layui.use('upload',function() {
						var $ = layui.jquery, upload = layui.upload;
						var usernaem=${username}
						console.log(username)
						//头像图片上传
						var uploadInst = upload
								.render({
									elem : '#test2',
									url : '/upload/',
									auto : false,
									choose :function(obj){
										obj.preview(function(index, file,result) {
											$('#'+username).attr('src', result); //图片链接（base64）
										});
									}
									
									
								});
					});
</script>


</head>
<body style="background-color: #F6F6F6">
	<!--导航栏-->
	<jsp:include page="navigation.jsp" flush="true"></jsp:include>
	<div class="container"
		style="background-color: white; height: 400px; width: 80%;">
		<!--个人主页封面-->
		<div class="layui-upload mt-2">
			<form>
			
			<button type="button" id="test1"
				style="border: 0; outline: 0; background-color: transparent">
				<img class="layui-upload-img" id="${username}"
					src="common/image/personalBg.jpg"
					style="height: 240px; width: 100%; margin-left: -15px" />
			</button>
			</form>
			<div class="layui-upload-list">
				<p id="demoText"></p>
			</div>
		</div>
		<!--个人主页头像-->
		<div>
			<div class="layui-upload col-sm-4 mb-5"
				style="float: left; margin-top: -100px">
				<input type="file" accept="image/*" id="test2"  title="头像" name="image"
					style="display: none; border: 0">
				<button type="button" id="test2"
					style="margin-left: 50px; border: 0; outline: 0; background-color: transparent">
					<img class="layui-upload-img normalFace" id="${username}"
						onclick="$('#test2').click();"
						src="common/image/idImg.jpg" onload="getPhotoPath(this)"/>
				</button>
				<div class="layui-upload-list">
					<p id="demoText2"></p>
				</div>
			</div>

			<div class="col-sm-8" style="float: right">
				<span class="font-weight-bold ml-5" style="margin-top: -200px"><h3>虾米</h3></span>
				<div id="demo" class="collapse">
					<lable class="font-weight-bold">所在的行业</lable>
				</div>
				<a href="#demo" id="change-text" data-toggle="collapse"
					onclick="fold()">﹀ 查看详细资料</a> <a
					class="btn btn-outline-primary edit pull-right"
					style="float: right" href="updatePersonalData.do">编辑个人资料</a>
			</div>
		</div>
	</div>
	<!--正文-->
	<div class="container mt-5"
		style="background-color: white;width: 80%;">
		<div class="row">
			<div class="dropdown-divider "></div>
			<div class="col-8" style="background-color: white;">
				<nav class="navbar navbar-expand-sm bg-light">
					<ul class="nav nva-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#MyAction">动态&nbsp;&nbsp;</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#MyAnswer">回答&nbsp;<span>0&nbsp;&nbsp;</span></a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#MyQuestion">提问&nbsp;<span>0&nbsp;&nbsp;</span></a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#MyArticle">文章&nbsp;<span>${articlesNum}&nbsp;&nbsp;</span></a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#MyColumn">专栏&nbsp;<span>0&nbsp;&nbsp;</span></a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#MyIdea">想法&nbsp;<span>${ideasNum}&nbsp;&nbsp;</span></a></li>
						<li class="nav-item">
							<div class="dropdown">
								<button type="button" class="btn btn-link dropdown-toggle"
									data-toggle="dropdown">更多</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" data-toggle="tab" href="#MyCollect">收藏</a>
									<a class="dropdown-item" data-toggle="tab" href="#MyFocus">关注</a>
								</div>
							</div>
						</li>
					</ul>
				</nav>
				<div class="dropdown-divider "></div>
				<div class="tab-content">
					<div id="MyAction" class="container tab-pane active ">
						<h5 class="ml-3 ">我的动态</h5>
					</div>
					<div id="MyAnswer" class="container tab-pane fade">
						<h5 class="ml-3">我的回答</h5>
					</div>
					<div id="MyQuestion" class=" container tab-pane fade">
						<h5 class="ml-3">我的提问</h5>
					</div>
					<div id="MyArticle" class="container tab-pane fade"><!-- 我的文章 -->
						<jsp:include page="myArticle.jsp" flush="true"></jsp:include>
						
					</div>
					<div id="MyColumn" class="container tab-pane fade">
						<h5 class="ml-3">我的专栏</h5>
					</div>
					<div id="MyIdea" class="container tab-pane fade">
						<jsp:include page="myIdeas.jsp" flush="true"></jsp:include>
					</div>
					<div id="MyCollect" class="container tab-pane fade">
						<h5 class="ml-3">我的收藏夹</h5>
					</div>
					<div id="MyFocus" class="container tab-pane fade">
						<nav class="navbar navbar-expand-sm bg-light ">
							<!-- Links -->
							<ul class="nav nva-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#MyFocusP">我关注的人</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#FcMe">关注我的人</a></li>
								<li class="nav-item">
									<div class="dropdown">
										<a class="nav-link dropdown-toggle visi-menu" href=""
											data-toggle="dropdown"> 我关注的专栏</a>
										<div class="dropdown-menu search-menu" id="menu2">
											<a class="dropdown-item" data-toggle="tab" href="#MyFC">我关注的专栏</a>
											<a class="dropdown-item" data-toggle="tab" href="#Mytop">我关注的话题</a>
											<a class="dropdown-item" data-toggle="tab" href="#MyFQ">我关注的问题</a>
											<a class="dropdown-item" data-toggle="tab" href="#Mycll">我关注的收藏</a>
										</div>
									</div>
								</li>
							</ul>
						</nav>
						<div class="tab-content">
							<!--点击不同的链接根据链接的id跳转到不同的卡片-->
							<div id="MyFocusP" class="container tab-pane active ">
								<!--我关注的人-->
								<h1>111</h1>
							</div>
							<div id="FcMe" class="container tab-pane fade">
								<!--关注我的人-->
								<h1>222</h1>
							</div>
							<div id="MyFC" class=" container tab-pane fade">
								<!--我关注的专栏-->
								<h1>333</h1>
							</div>
							<div id="Mytop" class="container tab-pane fade">
								<!--我关注的话题-->
								<h1>444</h1>
							</div>
							<div id="MyFQ" class="container tab-pane fade">
								<!--我关注的问题-->
								<h1>555</h1>
							</div>
							<div id="Mycll" class="container tab-pane fade">
								<!--我关注的收藏-->
								<h1>666</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--右边导航栏-->
			<div class="col-4">
				<div class="row" style="height: 60px;">
					<div class="col-sm-6 text-center pt-3"
						style="background-color: white; border-right: solid 1px #F6F6F6;">
						<a href="#">关注了</a><br />
						<sapn>0</sapn>
					</div>
					<div class="col-sm-6  text-center pt-3"
						style="background-color: white">
						<a href="#">关注者</a><br /> <span>0</span>
					</div>
				</div>
				<div class="mt-2 text-left">
					<div class="dropdown-divider "></div>
					<a class="mt-5 ml-3 text-muted" href="#">关注的话题<span
						class="ml-5">0</span></a><br /> <br />
					<div class="dropdown-divider "></div>
					<a class="mt-5 ml-3 text-muted" href="#">关注的专栏<span
						class="ml-5">0</span></a><br /> <br />
					<div class="dropdown-divider "></div>
					<a class="mt-5 ml-3 text-muted" href="#">关注的问题<span
						class="ml-5">0</span></a><br /> <br />
					<div class="dropdown-divider "></div>
					<a class="mt-5 ml-3 text-muted" href="#">关注的收藏<span
						class="ml-5">0</span></a><br /> <br />
					<div class="dropdown-divider "></div>
					<a class="mt5 ml-3 text-muted" href="#">主页被浏览<span>0</span>次
					</a><br /> <br />
					<div class="dropdown-divider "></div>
				</div>
				<div class="mt-5" style="height: 400px;">
					<p class="font-weight-light text-muted">
						刘看山.知乎指南.知乎协议知乎隐私保护指引<br> 应用.工作.申请开通知乎机构号<br>
						侵权举报.网上有害信息举报专区<br> 违法和不良信息举报：010-82716601<br>
						儿童色情信息举报专区<br> 证照中心<br> 联系我们 © 2019 知乎<br />
					</p>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>