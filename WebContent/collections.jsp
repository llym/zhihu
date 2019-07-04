<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="common/tool/layui/css/layui.css">
<link rel="stylesheet" href="common/tool/bootstrap4/css/bootstrap.css">
<script src="common/tool/jquery/jquery.js"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>
<script src="common/tool/layui/layui.js"></script>
<title>我的收藏</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-white navbar-white justify-content-center mb-1">
        <a class="navbar-brand text-primary text-lg" href="#">知乎</a>
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
        <ul class="nav ml-2 mr-5">
            <li class="nav-item"><a class="nav-link" href="#">首页</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">发现</a></li>
            <li class="nav-item"><a class="nav-link" href="#">等你来答</a></li>
            
        </ul>
        <button class="btn btn-primary ml-5" type="button">提问</button>
        <ul class="nav">
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown" src="common/image/sculpture.jpg" style="
                width:30px;height:30px;" />
                <div class="dropdown-menu">
                        <a class="dropdown-item" href="#"><input type="image" src="common/image/my.png" style="
                        width:20px;height:20px;">&nbsp;&nbsp;我的主页</a>
                        <a class="dropdown-item" href="#"><input type="image" src="common/image/setting.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;设置</a>
                        <a class="dropdown-item" href="#"><input type="image" src="common/image/out.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;退出</a>
                </div>
            </li>
        </ul>
    </nav>
		
	<!-- 主体内容 -->
	<div class="container mt-3">
        <div class="left" style="background-color:white;float:left;">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#commend">推荐</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#follow">关注</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hot">热榜</a>
                </li>
            </ul>
            <hr>
            <div class="tab-content">
                <div id="commend" class="container tab-pane active"><br>
                    <div class="content">
                        <p id="title">陈都灵和章泽天实际上各是什么样的人？</p>
                        <input class="head mt-2" type="image" src='common/image/sculpture.jpg'" style="
                            width:30px;height:30px;float:left;" />
                        <p id="author" class="mt-2">&nbsp;雨蒙</p><br />
                        <p class="text-secondary mt-2">118人赞同了该回答</p>
                        <p class="mt-2">陈都灵是学姐同学， 厦门一中的。<br /><br />
                            校花身份红的时候学姐就讲过她不是那种乖乖女或者好学生。比较叛逆，有一点社会感……总之通过这件事觉得娱乐圈很多明星人设都是包装的吧<br /><br />
                            章泽天就不了解了，记得当年的奶茶照真的直男斩啊</p>
                        <p class="text-secondary mt-2">发布于2019-06-16</p>
                        <button class="btn btn-sm mt-2" type="submit" id="agree">赞同<span id="num">123</span></button>
                        <button class="btn btn-primary btn-sm mt-2" id="cancel">▼</button>
                        <span class="tip1 mt-2" onclick="openComment()">✉100评论</span><span class="tip2 mt-2"
                            onclick="openShare()">➢分享</span><span class="tip3 mt-2" onclick="openModak()">★收藏</span>
                    </div>
                </div>
                <div id="follow" class="container tab-pane fade"><br>
                    <h3>关注</h3>
                </div>
                <div id="hot" class="container tab-pane fade"><br>
                    <h3>热榜</h3>
                </div>
                <div id="comments" style="display: none;border:1px solid #D9D9D9;margin-left:15px;margin-right:15px ">
                    <div id="commentNum" style="font-weight: bold">39条评论</div>
                    <hr>
                    <div id="comment" class="ml-4">
                        <input class="mt-2" type="image" src='F:\大三下\课程设计\login\images\sculpture.jpg' style="
                            width:30px;height:30px;float:left;" />
                        <p id="commentName" class="ml-2" style="padding-top:10px;">&nbsp;一株禾<span id="commentTime"
                                style="padding-left:350px">20小时前</span></p>
                        <br />
                        <p id="content" style="padding-left: 40px;padding-top:5px;font-size:16px">totally 赞同!!!</p>
                        <div class="mt-2">
                            <span onclick="like()" style="padding-left:40px;padding-top:10px">👍<span
                                    id="like">53</span></span>
                            <span id="reply1" onclick="reply1()" style="padding-left: 5px;">✎回复</span>
                        </div>
                        <div id="replyText1" style="display: none">
                            <textarea id="text1" class="form-control" row="5" style="width:500px;"></textarea>
                            <button type="button" class="btn btn-primary btn-sm mt-2" onclick="submitReply1()"
                                style="margin-left:450px">发布</button>
                        </div>
                        <hr>
                        <div style="padding-left:40px;">
                            <input class="mt-2" type="image" src='F:\大三下\课程设计\login\images\sculpture.jpg'" style="
                                width:30px;height:30px;float:left;" />
                            <p id="replyer" class="ml-2" style="padding-top:10px;">&nbsp;一株禾<span
                                    class="text-muted">回复</span><span id="replyed">北儿京儿人儿</span>
                                <span id="replyTime" style="padding-left: 200px">2小时前</span></p>
                            <p id="replyContent" style="padding-left: 40px;padding-top:20px;font-size:14px">赞同+1</p>
                            <div class="mt-2">
                                <span onclick="replyLike()" style="padding-left:40px;padding-top:10px">👍<span
                                        id="replyLike">1</span></span>
                                <span id="reply2" onclick="reply2()" style="padding-left: 5px;">✎回复</span>
                            </div>
                        </div>
                        <div id="replyText2" style="display: none">
                            <textarea id="text2" class="form-control" row="5" style="width:500px;"></textarea>
                            <button type="button" class="btn btn-primary btn-sm mt-2" onclick="submitReply2()"
                                style="margin-left:450px">发布</button>
                        </div>
                    </div>
                </div>
                <hr>
            </div>

        </div>

        <div class="right" style="background-color:white;float:right">
            <div style="padding-left:40px;padding-top:20px;float:left">
                <input type="image" src="common/image/commend.png" style="width:30px;height:30px">
                <p class="mt-2"><a href="#">写回答</a></p>
            </div>
            <div style="padding-left:50px;padding-top:20px;float:left">
                <input type="image" src="common/image/article.png" style="width:30px;height:30px">
                <p class="mt-2"><a href="#">写文章</a></p>
            </div>
            <div style="padding-left:50px;padding-top:20px;float:left">
                <input type="image" src="common/image/idea.png" style="width:30px;height:30px">
                <p class="mt-2"><a href="#">写想法</a></p>
            </div>
            <br/>
            <div id="" style="background-color:rgb(255, 255, 255);height:50px;width:300px;float:right">
                <input type="image"  src="common/image/clock.png" style="width:20px;height:20px;margin-left: 20px;margin-top:20px;">
                <a href="#" class="text-muted">&nbsp;我的稍后答</a>    
            </div>
        </div>
    </div>
</body>
</html>