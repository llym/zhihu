<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="common/tool/bootstrap4/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="common/tool/jquery/jquery.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="common/tool/bootstrap4/js/bootstrap.js"></script>
    <link href="common/tool/layui/css/layui.css" rel="stylesheet">
    <script src="common/tool/layui/layui.js"></script>
	<title>搜索结果</title>
	<style>
        body {
            background-color: rgb(248, 248, 248);
        }

        .topHeader {
            padding-left: 200px;
            width: 100%;
            height: 50px;
            padding-top: 10px;
            background-color: white;
        }

        .top {
            font-size: 18px;
        }

        .hotSearch {
            margin-right: 14%;
            float: right;
            width: 300px;

        }

        .agree,
        .cancel {
            background-color: rgb(199, 234, 255);
            color: blue;
        }

        .tab-content {
            margin-top: 5px;
            float: left;
            margin-left: 15%;
            width: 600px;

        }

        .searchQuestion {
            background-color: white;
        }

        .searchResult,
        .searchUser {
            padding: 10px;

        }

        .user {
            background-color: white;
            height: 80px;
        }

        .article {
            padding: 10px;
            background-color: white;
        }
    </style>
    <script>
        $(function () {
            $("#question").click(function () {
                $(this).css("font-weight", "bold");
                $("#article").css("font-weight", "normal");
                $("#topic").css("font-weight", "normal");
                $("#user").css("font-weight", "normal");
            })
            $("#article").click(function () {
                $(this).css("font-weight", "bold");
                $("#question").css("font-weight", "normal");
                $("#topic").css("font-weight", "normal");
                $("#user").css("font-weight", "normal");
            })
            $("#topic").click(function () {
                $(this).css("font-weight", "bold");
                $("#question").css("font-weight", "normal");
                $("#article").css("font-weight", "normal");
                $("#user").css("font-weight", "normal");
            })
            $("#user").click(function () {
                $(this).css("font-weight", "bold");
                $("#question").css("font-weight", "normal");
                $("#article").css("font-weight", "normal");
                $("#topic").css("font-weight", "normal");
            })
        })

        //打开评
        function openComment(id) {
            var texts = $("#openComment"+id).text();
            if (texts == "查看评论") {
                $("#comments"+id).show();
                $("#openComment"+id).text("收起评论");
            } else if (texts == "收起评论") {
                $("#comments"+id).hide();
                $("#openComment"+id).text("查看评论");
            }
        }
        // 点赞某一条评论
        var t = 0;
        function like() {
            var n = $("#like").text();
            if (t % 2 == 0) {
                $("#like").text((parseInt(n) + 1));
                $("#like").css('color', 'blue');
                $(".layui-icon-praise").css('color', 'blue');
            }
            else if (t % 2 != 0) {
                var n = $("#like").text();
                $("#like").text((parseInt(n) - 1));
                $("#like").css('color', 'black');
                $(".layui-icon-praise").css('color', 'gray');
            }
            t = t + 1;
        }
        // 回复某一条评论
        function reply1() {
            if ($("#reply1").text() == "✎回复") {
                $("#textDiv1").show();
                $("#reply1").text("取消回复");
            } else if ($("#reply1").text() == "取消回复") {
                $("#textDiv1").hide();
                $("#reply1").text("✎回复");
            }
        }
        //回复某一条评论的回复
        function reply2() {
            if ($("#reply2").text() == "✎回复") {
                $("#textDiv2").show();
                $("#reply2").text("取消回复");
            } else if ($("#reply2").text() == "取消回复") {
                $("#textDiv2").hide();
                $("#reply2").text("✎回复");
            }
        }
        //发布评论
        function publish1() {
            alert($("#replyContent1").val());
        }
        // 点赞某一条评论的回复
        var t1 = 0;
        function likeReply() {
            var n = $("#likeReply").text();
            if (t1 % 2 == 0) {
                $("#likeReply").text((parseInt(n) + 1));
                $("#likeReply").css('color', 'blue');
                $(".layui-icon-praise").css('color', 'blue');
            }
            else if (t1 % 2 != 0) {
                var n = $("#likeReply").text();
                $("#likeReply").text((parseInt(n) - 1));
                $("#likeReply").css('color', 'black');
                $(".layui-icon-praise").css('color', 'gray');
            }
            t1 = t1 + 1;
        }
        //发布某一条评论下的评论
        function publish2() {
            alert($("#replyContent2").val());
        }
        function answerQuestion(id) {
            alert(id);
            window.location.href ='test.do?questionid='+id;
        }
    </script>
</head>

<body>
    <div class="topHeader mt-1">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#searchQuestion">问题</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#searchArticle">文章</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#searchUser">用户</a>
            </li>
        </ul>
    </div>
    <div class="tab-content">
    
    
        <div id="searchQuestion" class="container tab-pane active"><br>
            <!-- 搜索到的结果，一个结果一个div -->
            <c:forEach items="${qlist}" var="que" varStatus="userStatus">
            <div class="searchResult" style="background-color: white">
                <!-- 搜索的关键词用红色字体 -->
                <p id="title" style="font-size:18px;font-weight:bold;">${que.questionname}
                </p>
                <p class="mt-2" style="width:400px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${que.questiondescribe}
                </p>
               <button type="button" class="btn btn-sm btn-primary mr-3" onclick="answerQuestion(${que.questionid})"
                        id="followQuestion">问题详情</button>
                <a href="#" class="btn btn-sm mt-2" onclick="openComment(${que.questionid})" id="openComment${que.questionid}">查看评论</a>
                <!-- 评论 -->
                  <c:forEach items="${comlist}" var="com">
                   <c:if   test="${com.questionid eq que.questionid}">
                <div id="comments${que.questionid}" class="mt-3"
                    style="padding:10px 15px;border:0.5px solid rgb(212, 210, 210);display:none">
                    <p id="commentNum" style="font-weight:bold;font-size:15px"><span id="num">${que.commentnumb}</span>条评论</p>
                    <hr />
                    <div id="content">
                        <image src="common/image/head.jpg" style="width:20px;height:20px"></image>
                        <span id="commentUser" style="font-size:16px" class="ml-2">${com.userid}</span>
                        <p id="commentContent" style="padding-left:30px" class="mt-2">${com.commentcontent}</p>
                        <p style="padding-left:30px" class="mt-2">
                            <i class="layui-icon layui-icon-praise" style="font-size: 15px; color:gray;"
                                onclick="like()"></i>
                            <span id="like">${com.prisenumb}</span>
                            <span onclick="reply1()" id="reply1">✎回复</span>
                        </p>
                        <div id="textDiv1" style="display:none">
                            <textarea id="replyContent1" class="form-control"
                                style="float:left;margin-left:30px;width:400px;height: 40px"></textarea>
                            <button type="button" class="btn btn-primary ml-1" onclick="publish1()">发布</button>
                        </div>
                        <!-- 评论的回复 -->
                         <c:forEach items="${rcomlist}" var="rcom">
                         <c:if   test="${com.commentid eq rcom.commentid}">
                        <div id="replying" class="mt-2" style="padding-left:30px;">
                            <image src="common/image/head.jpg" style="width:20px;height:20px">
                            </image>
                            <!-- 回复人 -->
                            <span id="replyer" style="font-size:16px" class="ml-2">${rcom.userid}</span>
                            <span class="text-muted">回复</span>
                            <!-- 被回复者 -->
                            <span class="repled">${rcom.commentuserid}</span>
                            <!-- 回复的内容 -->
                            <p id="replyContent" class="mt-2" style="padding-left:30px">${rcom.commentcontent}</p>
                            <p style="padding-left:30px" class="mt-2">
                                <i class="layui-icon layui-icon-praise" style="font-size: 15px; color:gray;"
                                    onclick="likeReply()"></i>
                                <span id="likeReply">${rcom.prisenumb}</span>
                                <span onclick="reply2()" id="reply2">✎回复</span>
                                <div id="textDiv2" style="display:none">
                                    <textarea id="replyContent2" class="form-control"
                                        style="float:left;margin-left:30px;width:400px;height: 40px"></textarea>
                                    <button type="button" class="btn btn-primary ml-1" onclick="publish2()">发布</button>
                                </div>
                            </p>
                        </div>
                        </c:if>
                        </c:forEach>
                    </div>
                   
                </div>
                
                </c:if>
                
                </c:forEach>
               
                <hr>
            </div>   </c:forEach>
        </div>
        
      
    </div>
    <div class="hotSearch mt-3">
        <div style="background-color:white;padding: 20px 15px;">
            <p style=" font-weight: bold;font-size: 16px">知乎热搜</p>
            <hr />
            <p class="mt-2">华为鸿蒙上市反转 <i class="layui-icon layui-icon-fire" style="font-size: 15px; color:red;"></i></p>
            <p class="mt-2">张艺兴首场演唱会 <i class="layui-icon layui-icon-fire" style="font-size: 15px; color:red;"></i></p>
            <p class="mt-2">考研大纲8日公布 <i class="layui-icon layui-icon-fire" style="font-size: 15px; color:red;"></i></p>
            <p class="mt-2">九个孩子的残疾母亲</p>
            <p class="mt-2">梅西染红梅州杯</p>
            <p class="mt-2">花木兰首版预告来袭</p>
            <p class="mt-2">我家两小口</p>
            <p class="mt-2">乐队的夏天</p>
        </div>
        <div class="mt-3">
            <p class="ml-2 mt-2 text-muted" style="font-size:16px"><a href="https://liukanshan.zhihu.com/"
                    class="text-muted">刘看山</a>·知乎指南·知乎协议·知乎隐私保护指引</p>
            <p class="ml-2 mt-2 text-muted" style="font-size:16px">应用·工作·申请开通知乎机构号</p>
            <p class="ml-2 mt-2 text-muted" style="font-size:16px">侵权举报·网上有害信息举报专区</p>
            <p class="ml-2 mt-2 text-muted" style="font-size:16px">违法和不良信息举报</p>
            <p class="ml-2 mt-2 text-muted" style="font-size:16px">儿童色情信息举报专区</p>
            <p class="ml-2 mt-2 text-muted" style="font-size:16px">证照中心</p>
        </div>
    </div>
</body>
</html>