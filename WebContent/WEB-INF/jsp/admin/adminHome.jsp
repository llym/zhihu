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
	function getPhotoPath(obj){
		//obj传入的DOM对象
		console.log(obj)
		console.log(obj.id);
		console.log(obj.src);
		console.log(obj.onload);
		var path
		$.post("getPhotoPath.do",{
			id:obj.id
		},function(data){
			console.log(data)
			obj.src=data
			obj.onload=""
				console.log(obj.onload)
			console.log(obj.src)
			
		});
		
	}
	
	
</script>

</head>
<body>
	<div class="layui-tab">
		<ul class="layui-tab-title">
			<li class="layui-this">用户管理</li>
			<li>权限分配</li>
			<li>商品管理</li>
			<li>订单管理</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show" id="user control">

				<table id="userTable"
					class="table table-condensed table-hover table-striped">
					<tr>
						<th>id</th>
						<th>登录id</th>
						<th>住址</th>
						<th>手机号</th>
						<th>邮箱</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${books}" var="b" varStatus="st">
						<tr>
							<td id="${b.id}">${b.bookname}</td>
							<td>${b.press}</td>
							<td>${b.author}</td>
							<td>${b.inventory}</td>
							<td><a href="#" onclick="edit(${b.id})">编辑 </a> <a href="#"
								id="deleteBill" onclick="del(${b.id})">删除</a></td>
						</tr>
						<div id="edit${b.id}" style="display: none">
							<h3>编辑图书</h3>
							<hr />
							<p>
								<span>图书名称:</span><input value="${b.bookname}" type="text"
									class="form-control" id="name${b.id}"
									style="width: 300px; margin-left: 50px;" />
							</p>
							出版社:<input type="text" value="${b.press}" class="form-control"
								id="publisher${b.id}" style="width: 300px; margin-left: 50px;" />
							作者:<input type="text" value="${b.author}" class="form-control"
								id="author${b.id}" style="width: 300px; margin-left: 50px;" />
							库存:<input type="text" value="${b.inventory}" class="form-control"
								id="num${b.id}" style="width: 300px; margin-left: 50px;" />
							<button type="button" class="btn btn-sm mt-2" onclick="cancel()"
								style="float: right; margin-right: 50px;">取消</button>
							<button type="button" class="btn btn-primary btn-sm mt-2"
								onclick="save(${b.id})" style="float: right">保存</button>

						</div>

					</c:forEach>
				</table>

				<div id="demo20"></div>
				<ul id="biuuu_city_list"></ul>
				<script>
	var s =${userList};
	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
	//测试数据
	  var data = ${userList};
	  
	  //调用分页
	  laypage.render({
	    elem: 'demo20'
	    ,count: data.length
	    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
	    ,jump: function(obj){
	      //模拟渲染
	      document.getElementById('biuuu_city_list').innerHTML = function(){
	        var arr = []
	        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
	        layui.each(thisData, function(index, item){
	          arr.push('<li>'+ item.id +'</li>');
	        });
	        return arr.join('');
	      }();
	    }
	  });
	  
	
});
	</script>


				<img id="1" src="/pic/logo1.png"
					style="width: 30px; height: 30px; float: left;" 
					onload="getPhotoPath(this)"/>
				
			</div>
			<div class="layui-tab-item">内容2</div>
			<div class="layui-tab-item">内容3</div>
			<div class="layui-tab-item">内容4</div>
		</div>
	</div>
</body>
</html>