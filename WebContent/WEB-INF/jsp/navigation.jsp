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
        <a class="navbar-brand text-primary text-lg" href="homePage.do">知乎</a>
        <ul class="nav  ml-5 mr-5">
            <li class="nav-item"><a class="nav-link active font-weight-bold" href="homePage.do">首页</a>
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
                    	<!-- 别人回答了你关注的问题收到的消息 -->
                        <div id="answer" class="container tab-pane active" align="center">
                            <!-- 嵌入jsp页面 -->
                            <iframe src="contentAnswer.jsp" style="width:100%;height:300px;border:0px"></iframe>
                            <div id="" style="float:left">
                                <input type="image" src="common/image/setting.png" style="width:20px;height:20px"><span class="text-muted">&nbsp;设置</span></p>
                            </div> 
                            <span class="text-muted" style="padding-left:100px">查看全部通知</span>
                        </div>
                        <!-- 好友私信消息 -->
                        <div id="friend" class="container tab-pane fade" align="center">
                            <iframe src="contentFriend.jsp" style="width:100%;height:300px;border:0px"></iframe>
                            <div id="" style="float:left">
                                <input type="image" src="common/image/setting.png" style="width:20px;height:20px"><span class="text-muted">&nbsp;设置</span></p>
                            </div> 
                            <span class="text-muted" style="padding-left:100px">查看全部通知</span>
                        </div>
                        <!-- 别人点赞了你的评论 -->
                        <div id="like" class="container tab-pane fade">
                            <iframe src="contentLike.jsp" style="width:100%;height:300px;border:0px"></iframe>
                            <div id="" style="float:left">
                                <input type="image" src="common/image/setting.png" style="width:20px;height:20px"><span class="text-muted">&nbsp;设置</span></p>
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
                    <p class="text-dark" align="center">我的私信</p>
                    <hr />
                    <iframe src="privateMess.jsp" style="width:100%;height:300px;border:0px"></iframe>
                    <div id="" style="float:left">
                        <input type="image" src="common/image/column.png" style="width:20px;height:20px"><span class="text-muted">&nbsp;写新私信</span></p>
                        </div> 
                    <span class="text-muted" style="padding-left:100px">查看全部私信</span>
                </div>
            </li>
            <!-- 头像 -->
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown"
                    src="common/image/sculpture.jpg" style="
                width:30px;height:30px;" />
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="myPage.do"><input type="image" src="common/image/my.png" style="
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