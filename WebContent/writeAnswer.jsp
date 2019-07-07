<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="common/tool/layui/css/layui.css" media="all" />
    <script type="text/javascript" src="common/tool/layui/layui.js"></script>  
	<title>回答问题</title>
	<style>
	    .left {
            float: left;
            margin-left: 100px;

            width: 600px;
            height: 600px;
        }

        .right {
            float: right;
            margin-right: 100px;

            width: 280px;

        }
	</style>
	
</head>
<body>
    <nav class="navbar navbar-dark bg-primary justify-content-center ">
        <a class="navbar-brand  text-lg" href="#">知乎</a>
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
        <ul class="nav  ml-5 mr-5">
            <li class="nav-item"><a class="nav-link active text-white" href="#">首页</a>
            </li>
            <li class="nav-item"><a class="nav-link text-white" href="#">发现</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="#">等你来答</a></li>
            </li>
        </ul>
        <ul class="nav">
            <li class="nav-item"><button type="button" class="btn btn-light ">提问</button></li>
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown"
                    src="common/image/sculpture.jpg" style="
                    width:30px;height:30px;" />
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/my.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;我的主页</a>
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/privateMess.png"
                            style="
                            width:20px;height:20px;">&nbsp;&nbsp;私信</a>
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/setting.png"
                            style="
                            width:20px;height:20px;">&nbsp;&nbsp;设置</a>
                    <a class="dropdown-item" href="#"><input type="image" src="common/image/out.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;退出</a>
                </div>
            </li>
        </ul>
    </nav>
    <div class="container mt-3">
        <div class="left">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#recommendForYou">为你推荐</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hotInStation">全站热门</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#invitationAnswer">邀请回答
                        <span class="badge badge-secondary badge-pill" id="num">129</span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="recommendForYou" class="container tab-pane active"><br>
                    <p class="text-muted">添加你擅长的话题，为你推荐可能感兴趣的问题</p>
                    <div class="input-group mb-3 input-group-sm mt-4" style="width:200px">
                        <input type="text" class="form-control" placeholder="添加擅长话题">
                    </div>
                </div>
                <div id="hotInStation" class="container tab-pane fade"><br>
                    <div class="alert  alert-dismissible fade show">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <a href="#" class="text-primary"
                            style="font-weight: bold;">如何看待前npm首席技术官提出的Entropic-去中心化的NPM替代品?</a>
                        <p class="text-muted mt-2"><span id="answerNum">2</span>个回答•<span id="followNum">196</span>人关注
                        </p>
                        <hr />
                    </div>
                    <div class="alert  alert-dismissible fade show">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <a href="#" class="text-primary" style="font-weight: bold;">如何评价Hinton等人的《Stacked Capsule
                            Autoenciders》论文？</a>
                        <p class="text-muted mt-2"><span id="answerNum">还没有</span>个回答•<span id="followNum">139</span>人关注
                        </p>
                        <hr />
                    </div>
                </div>
                <div id="invitationAnswer" class="container tab-pane fade"><br>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="list-group list-group-flush">
                <button type="button" class="list-group-item list-group-item-action">
                    <i class="layui-icon layui-icon-star" style="font-size: 15px; color: rgb(83, 84, 85);"></i>我的收藏
                </button>
                <button type="button" class="list-group-item list-group-item-action">
                    <i class="layui-icon layui-icon-ok" style="font-size: 15px; color: rgb(83, 84, 85);"></i>我关注的问题
                </button>
                <button type="button" class="list-group-item list-group-item-action">
                    <i class="layui-icon layui-icon-file" style="font-size: 15px; color: rgb(83, 84, 85);"></i>邀请我回答的问题
                    <span class="badge badge-secondary badge-pill" id="num">129</span>
                </button>
                <button type="button" class="list-group-item list-group-item-action">
                    <i class="layui-icon layui-icon-home" style="font-size: 15px; color: rgb(83, 84, 85);"></i>社区服务中心
                </button>
                <button type="button" class="list-group-item list-group-item-action">
                    <i class="layui-icon layui-icon-chat" style="font-size: 15px; color: rgb(83, 84, 85);"></i>版权服务中心
                </button>
                <button type="button" class="list-group-item list-group-item-action">
                    <p style="font-weight: bold;font-size:16px">知乎专栏</p>
                    <i class="layui-icon layui-icon-tabs" style="font-size: 15px; color: rgb(144, 243, 140);"></i>版权服务中心
                </button>
            </div>
            <p class="ml-3 mt-3"><span style="font-weight: bold;font-size: 16px;">知乎Live</span>
                <image src="common/image/live.png" style="
            width:30px;height:30px;"><a href="#" class="text-primary" style="margin-left:70px">查看全部<i
                            class="layui-icon layui-icon-next"
                            style="font-size: 15px; color: rgb(146, 180, 243)"></i></a>
            </p>
            <div class="list-group list-group-flush">
                <a href="#" class="list-group-item list-group-item-action">手把手教你做学历学位认证</a>
                <a href="#" class="list-group-item list-group-item-action">如何零基础通过基金从业资格考试</a>
                <a href="#" class="list-group-item list-group-item-action">日常运动种膝关节如何防伤与强化</a>
            </div>
            <p class="ml-3 mt-3"><span style="font-weight: bold;font-size: 16px;">知乎圆桌</span>
                <a href="#" class="text-primary" style="margin-left:70px">查看全部<i class="layui-icon layui-icon-next"
                        style="font-size: 15px; color: rgb(146, 180, 243)"></i></a>
            </p>
            <div class="list-group list-group-flush">
                <a href="#" class="list-group-item list-group-item-action">买对化妆品 不花冤枉钱</a>
            </div>
        </div>

    </div>

</body>
</html>