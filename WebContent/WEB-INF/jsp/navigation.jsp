<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-white navbar-white justify-content-center ">
        <a class="navbar-brand text-primary text-lg" href="#">知乎</a>
        <ul class="nav  ml-5 mr-5">
            <li class="nav-item"><a class="nav-link active font-weight-bold" href="#">首页</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">发现</a></li>
            <li class="nav-item"><a class="nav-link" href="#">等你来答</a></li>
            </li>
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
        <button class="btn btn-primary ml-2" type="button">提问</button>
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
                        <div id="answer" class="container tab-pane active" align="center">
                            <input type="image" src='common/image/mess.png' style="
                                width:50px;height:50px;margin-top:100px" />
                            <p>还没有消息</p>
                        </div>
                        <div id="friend" class="container tab-pane fade" align="center">
                            <input type="image" src='common/image/mess.png' style="
                                width:50px;height:50px;margin-top:100px" />
                            <p>还没有消息</p>
                        </div>
                        <div id="like" class="container tab-pane fade">
                            <p><span id="person" class="text-primary">clm</span>赞了你的评论<span id="question"
                                    class="text-primary">恋练有词我用起来觉得不好，你们是怎么用的？</span></p>
                            <hr />
                            <p><span id="person" class="text-primary">clm</span>赞了你的评论<span id="question"
                                    class="text-primary">恋练有词我用起来觉得不好，你们是怎么用的？</span></p>
                            <hr />
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
                    <p class="text-dark" align="center">我的私信</p>
                    <hr />

                    <a class="dropdown-item">
                        <div id="head" style="float:left"><input type="image" src="common/image/zhi.jpg"
                                style="
                                    width:40px;height:40px;"> </div>
                        <div id="userAndContent" style="padding-left:50px">
                            <p id="sendUser">知乎小伙伴</p>

                            <p id="privmesscontent">亲爱的士大夫地方打发士大夫士</p>
                        </div>
                    </a>
                </div>
            </li>
            <!-- 头像 -->
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown"
                    src="common/image/sculpture.jpg" style="
                width:30px;height:30px;" />
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/my.png" style="
                        width:20px;height:20px;">&nbsp;&nbsp;我的主页</a>
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/setting.png"
                            style="
                            width:20px;height:20px;">&nbsp;&nbsp;设置</a>
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/out.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;退出</a>
                </div>
            </li>
        </ul>
    </nav>
</body>
</html>