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
	function fh(id){
		console.log("fh"+id);
		$.post("closeUser.do",{
			userid:id
			},function(data){
				if(data=="success"){
					window.location.href="adminHome.do";
				}
			});
	}
	function jf(id){
		console.log("jf"+id);
		$.post("openUser.do",{
			userid:id
			},function(data){
				if(data=="success"){
					window.location.href="adminHome.do";
				}
			});
	}
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
					<li class="nav-item"><a class="nav-link" href="success.do">用户管理</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="borrow.do">借阅记录</a>
					</li>
				</ul>
				<hr class="d-sm-none">
			</div>

			<div class="col-sm-10 ">
				<div class="row">
					<div class="mb-5">
						<img style="height: 20px; weight: 20px;"
							src="common/image/home.png">用户管理
					</div>
					<div class="row">
						<form role="form" class="form-inline" id="billQueryForm"
							action="search.do" method="post">
							<div class="form-group m-auto">
								<!-- <button id="addBook" name="addBook"
									class="btn btn-info btn-sm m-1" type="button" onclick="add()">新增图书</button> -->

								<span>图书名称：</span> <input id="idForQuery" name="nameForQuery"
									type="text" class="form-control m-1" placeholder="请输入用户id" />
								<button id="queryUser" name="queryUser"
									class="btn btn-info btn-sm m-1" type="submit">查询</button>
							</div>
						</form>
					</div>
					<table id="userTable"
						class="table table-condensed table-hover table-striped">
							<div id="edit${b.id}" style="display: none">
								<h3>编辑图书</h3>
								<hr/>
								<p>
									<span>图书名称:</span><input value="${b.bookname}" type="text"
										class="form-control" id="name${b.id}"
										style="width: 300px; margin-left: 50px;" />
								</p>
								出版社:<input type="text" value="${b.press}" class="form-control"
									id="publisher${b.id}" style="width: 300px; margin-left: 50px;" />
								作者:<input type="text" value="${b.author}" class="form-control"
									id="author${b.id}" style="width: 300px; margin-left: 50px;" />
								库存:<input type="text" value="${b.inventory}"
									class="form-control" id="num${b.id}"
									style="width: 300px; margin-left: 50px;" />
								<button type="button" class="btn btn-sm mt-2" onclick="cancel()"
									style="float: right; margin-right: 50px;">取消</button>
								<button type="button" class="btn btn-primary btn-sm mt-2"
									onclick="save(${b.id})" style="float: right">保存</button>
							</div>
					</table>
					<div id="pageDemo"></div>
					<script type="text/javascript">
						layui.use([ 'laypage', 'layer' ],function() {
											var laypage = layui.laypage, layer = layui.layer;
											//测试数据
											var data = ${userList};
											//调用分页
											laypage.render({
														elem : 'pageDemo',
														count : data.length,
														layout : [ 'count','prev', 'page','next','limit','refresh','skip'],
														jump : function(obj) {
															//模拟渲染
															document.getElementById('userTable').innerHTML = function() {
																var arr = [], thisData = 
																	data.concat().splice(obj.curr*obj.limit - obj.limit,obj.limit);
																arr.push('<tr><th>用户id</th>'+'<th>用户名</th><th>性别</th>'+
																		'<th>手机号码</th><th>邮箱</th>'+
																		'<th>头像地址</th><th>状态</th>'+
																		'<th>操作</th>'+
																		'</tr>');
																
																layui.each(thisData,function(index,item) {
																		arr.push('<tr><td>'+ item.userid + '</td>'+
																				'<td>'+ item.name + '</td>'+
																				'<td>'+ item.sex + '</td>'+
																				'<td>'+ item.telnum + '</td>'+
																				'<td>'+ item.adress + '</td>'+
																				'<td>'+ item.photo + '</td>'+
																				'<td>'+ item.status + '</td>'+
																				'<td><button onclick="fh('+item.userid+
																						')">封号</button>'+
																				'<button onclick="jf('+item.userid+
																						')">解封</button></td>'+		
																				'</tr>'
																		);
																				});
																return arr.join('');
															}();
														}
													});

										});
					</script>

					<div id="addtext" style="display: none">
						<h3>编辑图书</h3>
						<hr />
						<p>
							<span>图书名称:</span><input type="text" class="form-control"
								id="bookname" style="width: 300px; margin-left: 50px;" />
						</p>
						出版社:<input type="text" class="form-control" id="press"
							style="width: 300px; margin-left: 50px;" /> 作者:<input
							type="text" class="form-control" id="authors"
							style="width: 300px; margin-left: 50px;" /> 库存:<input
							type="text" class="form-control" id="inventory"
							style="width: 300px; margin-left: 50px;" />
						<button type="button" class="btn btn-sm mt-2" onclick="cancel()"
							style="float: right; margin-right: 50px;">取消</button>
						<button type="button" class="btn btn-primary btn-sm mt-2"
							onclick="insert()" style="float: right">保存</button>

					</div>


				</div>
			</div>
		</div>
</body>
</html>