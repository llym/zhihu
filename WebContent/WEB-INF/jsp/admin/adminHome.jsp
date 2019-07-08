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
<script type="text/javascript">
	function getPhotoPath(id){
		$.post("getPhotoPath.do",{
			id:id
		},function(data){
			$("#"+id).attr('src',data);
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
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 30px;">
					<legend>将一段已知数组分页展示</legend>
				</fieldset>

				<div id="demo20"></div>
				<ul id="biuuu_city_list"></ul>
	<script>
	var s =${userList};
	console.log(s)
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
	
	
	<img id="img1" src="/pic/logo1.png" style="
                            width:30px;height:30px;float:left;"/>
	<script>
		getPhotoPath(1);
	</script>
			</div>
			<div class="layui-tab-item">内容2</div>
			<div class="layui-tab-item">内容3</div>
			<div class="layui-tab-item">内容4</div>
		</div>
	</div>
</body>
</html>