<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>写文章</title>

<link rel="stylesheet" href="common/tool/bootstrap4/css/bootstrap.css">
<link rel="stylesheet" href="common/tool/layui/css/layui.css"
	media="all">
<script src="common/tool/jquery/jquery.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>
<script src="common/tool/layui/layui.js" charset="utf-8"></script>

<!-- <link rel="stylesheet" type="text/css" href="common/tool/styles/simditor.css" />
<script type="text/javascript" src="common/tool/scripts/module.min.js"></script>
<script type="text/javascript" src="common/tool/scripts/hotkeys.min.js"></script>
<script type="text/javascript" src="common/tool/scripts/uploader.min.js"></script>
<script type="text/javascript" src="common/tool/scripts/simditor.min.js"></script> -->

<style type="text/css">
input:focus {
	outline: none;
}

.content {
	width: 700px;
	height: 800px;
	margin-left: 20%;
}

.inputId-webkit-input-placeholder {
	font-size: 2rem;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {//设置标题字数超过50个字弹窗提醒
		$("#inputId").keyup(function() {
			if ($.trim(this.value).length > 50) {
				alert("输入字符大于50个,请重新输入!");
			}
		});
	});
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});

	layui.use('upload',function() {
						var $ = layui.jquery, upload = layui.upload;

						//普通图片上传
						var uploadInst = upload.render({
									elem : '#articlePhoto',
									url : '/upload/',
									auto : false,
									choose :function(obj){
										obj.preview(function(index, file,result) {
											$('#demo1').attr('src', result); //图片链接（base64）
										});
									}
						});
					});
</script>
</head>
<body>
	<!--导航栏-->
	<ul class="nav">
		<li class="nav-item"><a class="nav-link text-primary "
			style="margin-left: 200px; border-right: solid 1px #F6F6F6;" href="#"><h2>知乎</h2></a>
		</li>
		<li class="nav-item"><a class="nav-link mt-3" href="#">写文章</a></li>
		<li class="nav-item">

			<div class="dropdown">
				<button type="button"
					class="nav-link btn btn-outline-primary dropdown-toggle mt-3"
					style="margin-left: 600px" data-toggle="dropdown" href="#">发布</button>
				<div class="dropdown-menu"
					style="height: 340px; width: 320px; margin-right: 200px">
					<h4 class="ml-3">发布文章</h4>
					<p class="font-weight-light m-2">绑定适合的话题，能方便分类检索，文章也更容易让读者发现。</p>
					<div class="m-2">
						<img style="height: 30px; width: 30px;"
							src="common/image/search.png"> <input type="text"
							placeholder="搜索话题..." style="border: 0; width: 270px;"></input>
					</div>
					<div class="dropdown-divider "></div>
					<button class="btn btn-outline-primary"
						style="margin-top: 120px; margin-left: 220px">下一步</button>

				</div>
			</div>
		</li>
		<li class="nav-item">
			<div class="dropdown">
				<img src="common/image/ellipsis.png"
					class="dropdown-toggle ml-4 mt-3"
					style="height: 40px; width: 40px;" data-toggle="dropdown">
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">草稿</a> <a class="dropdown-item"
						href="#">我的文章</a> <a class="dropdown-item" href="#">专栏.发现</a>
				</div>
			</div>
		</li>
	</ul>
	<div class="dropdown-divider"></div>
	<!--正文-->
	<div class="content">
		<form method="post" action="publishArticle.do" enctype="multipart/form-data">
			<div class="layui-upload">
				<input type="file" accept="image/*" id="articlePhoto"  title="添加题图" name="image"
					style="display: none; border: 0"> 
					<img class="layui-upload-img" id="demo1"
					style="height: 300px; width: 700px; background-color: #F6F6F6;"
					onclick="$('#articlePhoto').click();">
				<div class="layui-upload-list">
					<p id="demoText"></p>
				</div>
			</div>
			<div>
				<input type="text" id="inputId" maxlength=50 name="articleTitle"
					placeholder="请输入标题（最多50个字）"
					style="border: 0; height: 80px; width: 600px; font-size: 2rem; font-weight: bold" />
				<div class="dropdown-divider "></div>
			</div>
			<!-- 富文本框 -->
			<textarea id="editor" name="articleContent" placeholder="请输入正文" autofocus></textarea>

			<button type="submit" id="publish" data-type="content">发布</button>
		</form>
		
		<script>
			layui.use('layedit', function() {
				var layedit = layui.layedit, $ = layui.jquery;
				var index = layedit.build('editor'); //建立编辑器

				$("button#publish").click(function() {
					$("#editor").val(layedit.getContent(index))
					
					console.log($("#editor").val())
					console.log(layedit.getContent(index))
				})

			});
		</script>
	</div>
</body>
</html>