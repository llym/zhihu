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
<title>如何评价...</title>
	    <style>
        body {
            background-color: rgb(248, 248, 248);
        }

        .topHeader {
            width: 100%;
            background-color: white;
        }

        .question {
            margin-left: 15%;
            margin-right: 15%;
            background-color: white;
        }

        .topic,
        .agree,
        .cancel {
            background-color: rgb(199, 234, 255);
            color: blue;
        }

        .top {
            width: 900px;
        }

        .recommendUser,
        .answer,
        .write,
        .writeAnswer {
            float: left;
            background-color: white;
            margin-left: 14%;
            width: 550px;
        }

        .btns {
            background-color: white;
        }

        .comment,
        .share,
        .collect {
            background-color: white;
        }

        #submit {
            margin-left: 500px;
        }

        .other {
            float: right;
            margin-right: 14%;
            width: 330px;
            background-color:aquamarine;
        }
    </style>
        <script>
        $(function () {
            var editor = new Simditor({
                textarea: $('#editor')
                //optional options
            });
        });
        function followQuestion() {
            if ($("#followQuestion").text() == "关注问题") {
                $("#followQuestion").text("取消关注");
            } else if ($("#followQuestion").text() == "取消关注") {
                $("#followQuestion").text("关注问题");
            }

        }
        function invite() {
            var userName = $("#username").text();
            alert("用户名:" + userName);
            $("#invite").attr('disabled', true);
            $("#invite").text("已邀请")
        }
        function writeAnswer() {
            $(".writeAnswer").show();
        }
        function submit(){
            alert($("#editor").val());
        }
        
    </script>
</head>
<body>
	 <%-- <jsp:include page="navigation.jsp" flush="true"></jsp:include>  --%>
    <div class="topHeader mt-2">
        <div class="question">
            <div class="top">
                <div class="topics">
                    <button type="button" class="topic btn btn-sm ml-2">JavaScript</button>
                    <button type="button" class="topic btn btn-sm ml-2">Node.js</button>
                    <button type="button" class="topic btn btn-sm ml-2">npm</button>
                    <button type="button" class="btn btns" style="margin-left:400px" id="btnFollow">关注者<br>
                        <span style="font-weight:bold" id="followerNum">196</span></button>
                    <button type="button" class="btn btns" style="margin-left:20px">浏览者<br>
                        <span style="font-weight:bold" id="browserNum">1695</span>
                    </button>
                </div>
            </div>
            <div style="width:600px">
                <div class="discription mt-3">
                    <p id="title" style="font-size:20px;font-weight:bold">如何看待前 npm 首席技术官提出的 Entropic - 去中心化的 NPM 替代品？
                    </p>
                    <p id="content" style="font-size:16px">
                        JSConf EU 2019 会议上，前 npm 首席技术官 CJ Silverio 发表了题为“开源经济”的演讲。<br />
                        Silverio 认为，JavaScript 的软件包管理不应该被私有资本控制，而中心化体系将不可避免地导致私有控制，因为服务器是需要花钱的。<br />
                        在强烈批判中心化包管理服务的同时，她宣布了一项名为 Entropic 的去中心化软件包管理服务： https://github.com/entropic-dev
                    </p>
                </div>
                <div class="mt-3">
                    <button type="button" class="btn btn-sm btn-primary mr-3" onclick="followQuestion()"
                        id="followQuestion">关注问题</button>
                    <button type="button" class="btn btn-sm btn-outline-primary mr-3"  onclick="writeAnswer()"><i
                            class="layui-icon layui-icon-edit"
                            style="font-size: 14px; color: rgb(109, 177, 245);"></i>写回答</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary mr-3"><i
                            class="layui-icon layui-icon-friends"
                            style="font-size: 14px; color: rgb(125, 131, 136);"></i>邀请回答</button>
                    <a href="#" class="btn"><i class="layui-icon layui-icon-dialogue"
                            style="font-size: 14px; color: rgb(125, 131, 136);"></i><span id="num">3</span>条评论</a>
                </div>
            </div>
        </div>
    </div>
    <div class="writeAnswer mt-2" style="display: none">
        <div class="ml-3 pt-2">
            <image src="common/image/sculpture.jpg" style="width:30px;height:30px"></image>
            <span id="username">用户名</span>
        </div>
        <div style="padding:10px">
            <textarea id="editor" placeholder="Balabala" autofocus></textarea>
        </div>
        <button type="button" class="btn btn-primary btn-sm" id="submit" onclick="submit()">提交回答</button>
    </div>
    <div class="other mt-2">
        <p class="ml-2 mt-2 text-muted" style="font-size:16px"><a href="https://liukanshan.zhihu.com/" class="text-muted">刘看山</a>·知乎指南·知乎协议·知乎隐私保护指引</p>  
        <p class="ml-2 mt-2 text-muted" style="font-size:16px">应用·工作·申请开通知乎机构号</p>  
        <p class="ml-2 mt-2 text-muted" style="font-size:16px">侵权举报·网上有害信息举报专区</p> 
        <p class="ml-2 mt-2 text-muted" style="font-size:16px">违法和不良信息举报</p> 
        <p class="ml-2 mt-2 text-muted" style="font-size:16px">儿童色情信息举报专区</p> 
        <p class="ml-2 mt-2 text-muted" style="font-size:16px">证照中心</p> 
    </div>
    <div class="recommendUser mt-2">
        <p class="pt-2 pl-2" style="font-weight:bold;font-size:20px">你可以邀请下面用户，快速获得回答</p>
        <hr />
        <div class="users">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <!-- 头像         -->
                    <image src="common/image/sculpture.jpg" style="width:30px;height:30px" />
                    <!-- 用户名 -->
                    <span id="username" style="font-size:18px;font-weight: bold">Mr.panda</span>
                    <button type="button" class="btn btn-sm btn-outline-primary" style="float:right" id="invite"
                        onclick="invite()">邀请回答</button>
                </li>
            </ul>
        </div>
    </div>

    <div class="answer mt-2">
        <div style="padding:10px 20px">
            <div>
                <p style="font-weight:bold;font-size:16px"><span id="answerNum">2</span>个回答</p>
            </div>
            <hr />
            <div>
                <!-- 头像 -->
                <image src="F:\大三下\课程设计\login\images\head.jpg" style="width:30px;height: 30px" />
                <!-- 用户名 -->
                <span id="answerUser" style="font-weight: bold;font-size:16px;padding-left:10px">out4b</span>
                <div>
                    <p id="answerContent" class="mt-2" style="font-size:16px">思路挺好的。但私有包要放在哪里呢？</p>
                    <p class="text-muted mt-2">发布于<span id="answerTime">2019-06-21</span></p>
                </div>
                <div class="mt-2">
                    <button type="button" class="btn btn-sm agree">赞同</button>
                    <button type="button" class="btn btn-sm cancel">▼</i></button>
                    <button type="button" class="btn btn-sm comment">✉<span id="commentNum">2</span>条评论</button>
                    <button type="button" class="btn btn-sm share">分享</button>
                    <button type="button" class="btn btn-sm collect">收藏</button>
                </div>
            </div>
            <hr>
            <div>
                <!-- 头像 -->
                <image src="F:\大三下\课程设计\login\images\head.jpg" style="width:30px;height: 30px" />
                <!-- 用户名 -->
                <span id="answerUser" style="font-weight: bold;font-size:16px;padding-left:10px">谢谢的谢</span>
                <div>
                    <p id="answerContent" class="mt-2" style="font-size:16px">时代在变化 有的时候被替代是必然的</p>
                    <p class="text-muted mt-2">发布于<span id="answerTime">2019-06-20</span></p>
                </div>
                <div class="mt-2">
                    <button type="button" class="btn btn-sm agree">赞同</button>
                    <button type="button" class="btn btn-sm cancel">▼</i></button>
                    <button type="button" class="btn btn-sm comment">✉<span id="commentNum"></span>条评论</button>
                    <button type="button" class="btn btn-sm share">分享</button>
                    <button type="button" class="btn btn-sm collect">收藏</button>
                </div>
            </div>
        </div>
    </div>
    <div class="write mt-2">
        <button type="button" class="btn btn-block mt-2" style="background-color: white" onclick="writeAnswer()"><i
                class="layui-icon layui-icon-edit" style="font-size: 14px; color: rgb(109, 177, 245);"></i>写回答</button>
    </div>

</body>
</html>