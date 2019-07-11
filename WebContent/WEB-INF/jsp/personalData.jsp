<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link href="common/tool/bootstrap4/css/bootstrap.css" rel="stylesheet">
    <link href="common/tool/layui/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" href="common/tool/assets/design/css/trumbowyg.css"> 
    <script type="text/javascript" src="common/tool/jquery/jquery.js"></script>
    <script src="common/tool/bootstrap4/js/bootstrap.js"></script>
    <script src="common/tool/layui/layui.js"></script>
    <script type="text/javascript" src="common/tool/layui/layui.js"></script>  
    <link rel="stylesheet" href="common/tool/assets/design/css/trumbowyg.css"> 
    <script src="common/tool/assets/jquery.min.js"></script>
    <script src="common/tool/assets/trumbowyg.js"></script>
    <script src="common/tool/assets/plugins/base64/trumbowyg.base64.js"></script>
    <link rel="stylesheet" type="text/css" href="common/tool/styles/simditor.css" />
    <script src="common/tool/scripts/module.min.js"></script>
    <script src="common/tool/scripts/hotkeys.min.js"></script>
    <script src="common/tool/scripts/uploader.min.js"></script>
    <script src="common/tool/scripts/simditor.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="common/tool/layui/layui.js"></script>

<script>

function saveuser(){
	var a=$("#inputname").val();
	var b=$("#inputschool").val();
	var c=$("#inputemail").val();
	var d=$("#inputword").val();
	var e=$("#comment").val();
	var sex = $('input[name=sex]:checked').val()
	 $.post("upduser.do",
			    {
     	      'name':a,
			'school':b,
		     'email':c,
		     'word':d,
		     'introduce':e,
		     'sex':sex
					},
			        function(data,status){
			        alert(data);
			        //window.location.reload();
			    });
}

</script>


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
								<input  type="radio" name="sex" checked="checked" value="男">男</label>
								<label class="radio-inline">
								<input type="radio" name="sex" value="女">女</label>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">昵称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputname" value="${user.name}"
									placeholder="昵称">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">学校</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputschool" value="${user.school}"
									placeholder="学校">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">邮箱</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputemail" value="${user.adress}"
									placeholder="邮箱">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">一句话介绍</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="inputword"  value="${user.autograph}"
									placeholder="个性签名">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label">个人简介</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="5" id="comment" value="${user.introduce}"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 col-form-label"></label>
							<div class="col-sm-8">
								<button onclick="saveuser()" type="button" class="btn btn-primary">保存</button>
							</div>
						</div>
					</form>




					
				</div>
			</div>

		</div>


	</div>

</body>
</html>