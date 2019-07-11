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
	function closeT(id){
		console.log("close"+id);
		$.post("closeTopic.do",{
			topicid:id
			},function(data){
				if(data=="success"){
					window.location.href="adminTopic.do";
				}
			});
	}
	function openT(id){
		console.log("regain"+id);
		$.post("openTopic.do",{
			topicid:id
			},function(data){
				if(data=="success"){
					window.location.href="adminTopic.do";
				}
			});
	}
	function addT(){
		window.location.href="addTopic.do";
	}
	
	function update(id){
		window.location.href="updateT.do?topicid="+id;
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
					<div class="mb-5">
						<img style="height: 20px; weight: 20px;"
							src="common/image/home.png">话题管理
					</div>
					<div class="row">
						<form role="form" class="form-inline" id="billQueryForm"
							action="search.do" method="post">
							<div class="form-group m-auto">
								<button class="btn btn-info btn-sm m-1" 
								type="button" onclick="addT()">新增话题</button>

								<!-- <span>话题：</span> <input id="idForQuery" name="nameForQuery"
									type="text" class="form-control m-1" placeholder="请输入话题" />
								<button id="queryUser" name="queryUser"
									class="btn btn-info btn-sm m-1" type="submit">查询</button> -->
							</div>
						</form>
					</div>
					<table id="questionTable"
						class="table table-condensed table-bordered table-hover m-2 table-striped">
						
					</table>
					<div id="pageDemo"></div>
					<script type="text/javascript">
						layui.use([ 'laypage', 'layer' ],function() {
											var laypage = layui.laypage, layer = layui.layer;
											//测试数据
											var data = ${topicList};
											console.log(data)
											//调用分页
											laypage.render({
														elem : 'pageDemo',
														count : data.length,
														layout : [ 'count','prev', 'page','next','limit','refresh','skip'],
														jump : function(obj) {
															//模拟渲染
															document.getElementById('questionTable').innerHTML = function() {
																var arr = [], thisData = 
																	data.concat().splice(obj.curr*obj.limit - obj.limit,obj.limit);
																arr.push('<tr><th>话题id</th>'+'<th>话题</th><th>描述</th>'+
																		'<th>状态</th><th>操作</th>'+
																		'</tr>');
																
																layui.each(thisData,function(index,item) {
																		arr.push('<tr><td>'+ item.topicid + '</td>'+
																				'<td>'+ item.topicname + '</td>'+
																				'<td>'+ item.topicdescribe + '</td>'+
																				'<td>'+ item.photo + '</td>'+
																				'<td><button onclick="update('+item.topicid+
																				')">修改</button>'+
																				'<button onclick="closeT('+item.topicid+')">关闭</button>'+
																				'<button onclick="openT('+item.topicid+
																						')">恢复</button></td>'+		
																				'</tr>'
																		);
																				});
																return arr.join('');
															}();
														}
													});
										});
					</script>




				</div>
			</div>
		</div>
	</div>
</body>
</html>