<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${username}</title>
<link rel="stylesheet" href="common/tool/layui/css/layui.css">
<link rel="stylesheet" href="common/tool/bootstrap4/css/bootstrap.css">
<script src="common/tool/jquery/jquery.js"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="common/tool/layui/layui.js"></script>

</head>
<body>
	<jsp:include page="navigation.jsp" flush="true"></jsp:include>
	<div class="container">
		<div class="card img-fluid"
			style="margin-left: 100px; margin-right: 100px">
			<img src="common/image/2.jpg" class="card-img-top">
			<div class="card-img-overlay">
				<a href="#" class="btn btn-primary float-right">上传封面图片</a>
			</div>
		</div>
		<div class="card" style="margin-left: 100px; margin-right: 100px">
			<div>
				<div class="card float-left">
					<img src="common/image/2.jpg" class="card-img ml-3"
						style="width: 200px; height: 200px; margin-top: -30px">
					<div class="card-img-overlay">
						<a href="#" class="">修改头像</a>
					</div>
				</div>
				<a href="myPage.do" class="float-right">返回个人主页</a>
				<div class="float-left" style="margin-left: 20px;">
					<h1>${username}</h1>

					<form>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-4 col-form-label">性别</label>
							<div class="col-sm-8">
								<label class="radio-inline">
								<input type="radio" name="optradio" checked="checked">男</label>
								<label class="radio-inline">
								<input type="radio" name="optradio">女</label>
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">地址</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputPassword"
									placeholder="地址">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">学校</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputPassword"
									placeholder="学校">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">邮箱</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputPassword"
									placeholder="邮箱">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">一句话介绍</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputPassword"
									placeholder="一句话介绍">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">个人简介</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="5" id="comment"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label"></label>
							<div class="col-sm-8">
								<button type="button" class="btn btn-primary">保存</button>
							</div>
						</div>
					</form>




					
				</div>
			</div>

		</div>


	</div>

</body>
</html>