<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="common/tool/assets/design/css/trumbowyg.css">
    <link rel="stylesheet" href="common/tool/layui/css/layui.css" media="all" />
    <script type="text/javascript" src="common/tool/layui/layui.js"></script>  
    <script src="common/tool/assets/jquery.min.js"></script>
    <script src="common/tool/assets/trumbowyg.js"></script>
    <script src="common/tool/assets/plugins/base64/trumbowyg.base64.js"></script>

<style>
textarea::-webkit-input-placeholder {
            color: rgb(163, 163, 163);
            font-size: 18px;
        }

</style>
<script>
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
	function askQuestion(){
        $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['700px', '600px'],//定义宽和高
                title: false,//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#askQuestion')//打开的内容
            });
        })
	}
	function publish(){
		var val=$('input:radio[name="optradio"]:checked').val();
		var questionName=$("#questionName").val();
		if(val=='on'){
			alert('匿名');
		}
		var description=$(".editor").text();
		alert(description);
		alert(questionName);
		alert($("#sel1").val());
	}
	
	
// 	function getPrivmess(){
// 		var queid=${username};
// 		alert(queid);
// 		$.post("privatem.do",
// 			    {
// 			'queid':queid
// 					},
// 				        function(data,status){
				        
// 				        alert(data);
// 				        alert(${pmlist[1].privmesscontent})
// 				        //window.location.reload();
// 					});
		
// 	}
</script>
</head>
<body onload="getPrivmess()">
    <nav class="navbar navbar-expand-lg bg-white navbar-white justify-content-center ">
        <a class="navbar-brand text-primary text-lg" href="homePage.do">知乎</a>
        <ul class="nav  ml-5 mr-5">
            <li class="nav-item"><a class="nav-link active font-weight-bold" href="homePage.do">首页</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">发现</a></li>
            <li class="nav-item"><a class="nav-link" href="#">等你来答</a></li>
            
        </ul>
        <form class="form-inline">
           <div class="input-group">
      			<input type="text" class="form-control" placeholder="Search">		
      			<div class="input-group-prepend">
      				<button class="input-group-text" id="basic-addon1">
      				<i class="layui-icon layui-icon-search" style="font-size: 16px; color: #1E9FFF;"></i>
					</button>
    			</div>    			
    		</div>
            
        </form>
        <button class="btn btn-primary ml-2" type="button" onclick="askQuestion()">提问</button>
        <ul class="nav">
            <!-- 通知 -->
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown"
                    src='common/image/message.png' style="
                width:30px;height:30px;" />
                <div class="dropdown-menu" style="width:300px;height:400px">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" style="padding-left:35px">
                            <a class="nav-link active" data-toggle="tab" href="#answer"><input type="image"
                                    src='common/image/answer.png' style="
                                    width:20px;height:20px;" /></a>
                        </li>
                        <li class="nav-item" style="padding-left:35px">
                            <a class="nav-link" data-toggle="tab" href="#friend"><input type="image"
                                    src='common/image/friend.png' style="
                                            width:20px;height:20px;" /> </a>
                        </li>
                        <li class="nav-item" style="padding-left:35px">
                            <a class="nav-link" data-toggle="tab" href="#like"><input type="image"
                                    src='common/image/like.png' style="
                                            width:20px;height:20px;" /></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="answer" class="container tab-pane active">
                            <div id="contentAnswer"
                                style="height:310px;font-size:14px;overflow-y:scroll;border-top:1px solid gray;border-bottom:1px solid gray;padding-top:10px">
                                <p>
                                    <span id="user" class="text-primary">clm</span>回答了问题<span id="question"
                                        class="text-primary">恋练有词我用起来觉得不好，你们是怎么用的？</span>
                                </p>
                                <hr />
                                <p>
                                    <span id="user" class="text-primary">姜明</span>回答了问题<span id="question"
                                        class="text-primary">你写过什么有趣的程序？</span>
                                </p>
                                <hr />
                                <p>
                                    <span id="user" class="text-primary">与你</span>回答了问题<span id="question"
                                        class="text-primary">你看过什么好看的电影？</span>
                                </p>
                            </div>
                            <div id="" style="float:left">
                                <input type="image" src="common/image/setting.png"
                                    style="width:20px;height:20px"><span class="text-muted">&nbsp;设置</span></p>
                            </div>
                            <span class="text-muted" style="padding-left:100px">查看全部通知</span>
                        </div>
                        <div id="friend" class="container tab-pane fade" align="center">
                            <div id="contentFriend"
                                style="height:310px;font-size:14px;overflow-y:scroll;border-top:1px solid gray;border-bottom:1px solid gray;padding-top:10px">
                                <div align="center" style="padding-top:50px">
                                    <input type="image" src='common/image/mess.png' style="
                                        width:50px;height:50px;" />
                                    <p>还没有消息</p>
                                </div>
                            </div>

                            <div id="" style="float:left">
                                <input type="image" src="common/image/setting.png"
                                    style="width:20px;height:20px"><span class="text-muted">&nbsp;设置</span></p>
                            </div>
                            <span class="text-muted" style="padding-left:100px">查看全部通知</span>
                        </div>
                        <div id="like" class="container tab-pane fade">
                            <div id="contentLike"
                                style="height:310px;font-size:14px;overflow-y:scroll;border-top:1px solid gray;border-bottom:1px solid gray;padding-top:10px">
                                <!-- 如果没有消息的话 -->
                                <!-- <div align="center" style="padding-top:50px">
                                    <input type="image" src='commom/image/mess.png' style="width:50px;height:50px;" />
                                    <p>还没有消息</p>
                                </div> -->
                                <p><span id="person" class="text-primary">clm</span>赞了你的评论<span id="question"
                                        class="text-primary">恋练有词我用起来觉得不好，你们是怎么用的？</span></p>
                                <hr />
                                <p><span id="person" class="text-primary">clm</span>赞了你的评论<span id="question"
                                        class="text-primary">恋练有词我用起来觉得不好，你们是怎么用的？</span></p>
                                <hr />
                            </div>
                            <div id="" style="float:left">
                                <input type="image" src="common/image/setting.png"
                                    style="width:20px;height:20px"><span class="text-muted">&nbsp;设置</span></p>
                            </div>
                            <span class="text-muted" style="padding-left:100px">查看全部通知</span>
                        </div>
                    </div>

                </div>

            </li>
            <!-- 私信 -->
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown"
                    src='common/image/letter.png' style="
                width:30px;height:30px;" />
                <div class="dropdown-menu" style="width:300px;height:400px">
                    <p class="text-dark mb-2" align="center">我的私信</p>
                    <!-- 收到的私信 -->
                    <div id="privateMess"
                        style="width:300px;height:310px;overflow-y:scroll;border-top:1px solid gray;border-bottom:1px solid gray">
                        <div id="message">
                            <div class="list-group">
                             <c:forEach items="${pmlist}" var="pm">
                                <a href="#" class="list-group-item list-group-item-action" style="font-size:14px">
                                    <image src="common/image/zhi.jpg"
                                        style="width:30px;height:30px;float:left" />
                                    <!-- 私信方 -->
                                    <p id="" style="padding-left:40px">${pm.senduserid}</p>
                                    <!-- 私信的内容 最少显示16各字以内 -->
                                    <p id="messContent" class="text-muted" style="padding-left:40px">${pm.privmesscontent}
                                    </p>
                                </a>
                                 </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div style="padding:10px 10px;font-size: 16px; color: gray;">
                        <span><i class="layui-icon layui-icon-edit"></i> 写新私信</span>
                        <span style="padding-left:60px">查看全部私信</span>
                    </div>

                </div>
            </li>
            <!-- 头像 -->
            <li class="nav-item dropdown">
                <input id = "${username}" type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown"
                    src="common/image/sculpture.jpg" style="
                width:30px;height:30px;" onload="getPhotoPath(this)"/>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="myPage.do"><input type="image" src="common/image/my.png" style="
                        width:20px;height:20px;">&nbsp;&nbsp;我的主页</a>
                    <a class="dropdown-item" href="personalSetting.do?username=${username}"><input type="image" src="common/image/setting.png"
                            style="
                            width:20px;height:20px;">&nbsp;&nbsp;设置</a>
                    <a class="dropdown-item" href="logout.do"><input type="image" src="common/image/out.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;退出</a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="askQuestion" style="display:none;" align="center">
    	<div id="" class="mt-5">
            <input type="image" src="common/image/sculpture.jpg" style="width: 50px;height:50px">
            <textarea id="questionName" maxlength="50" style="width:400px;height:50px;border:0px"
                placeholder="写下你的问题，准确地描述更容易得到解答"></textarea>
            <p class="text-muted" style="float:right;padding-top:50px"><span id="question_num">0</span>/<span>50</span>
            </p>
        </div>
        <div id="odiv" style="display:none;position:absolute;z-index:100;">
            <img src="common/tool/assets/pic/sx.png" title="缩小" border="0" alt="缩小" onclick="sub(-1);" />
            <img src="common/tool/assets/pic/fd.png" title="放大" border="0" alt="放大" onclick="sub(1)" />
            <img src="common/tool/assets/pic/cz.png" title="重置" border="0" alt="重置" onclick="sub(0)" />
            <img src="common/tool/assets/pic/sc.png" title="删除" border="0" alt="删除" onclick="del();odiv.style.display='none';" />
        </div>
        <div onmousedown="show_element(event)" style="clear:both" id="customized-buttonpane" class="editor"></div> 
        <div class="form-group" style="float:left">
        	<label for="sel1" style="margin-left:20px">请选择话题:</label>
     		<select class="form-control" id="sel1" style="width:300px;margin-left:20px">
        		<option>科学</option>
       			<option>影视</option>
        		<option>娱乐</option>
        		<option>音乐</option>
      		</select>
      		<div class="radio mt-2">
            	<label><input type="radio" name="optradio">匿名提问</label>
            </div>
        </div>
        <div style="float:right">
        	 <button type="button" class="btn btn-primary" style="margin-top:30px;margin-right:10px;"
            onclick="publish()">发布问题</button> 
        </div>
        

    </div>
</body>
</html>