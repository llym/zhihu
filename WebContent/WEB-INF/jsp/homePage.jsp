<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link href="common/tool/bootstrap4/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="common/tool/jquery/jquery.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="common/tool/bootstrap4/js/bootstrap.js"></script>
    <link href="common/tool/layui/css/layui.css" rel="stylesheet">
    <script src="common/tool/layui/layui.js"></script>
   <title>首页</title>
    <style>
        body {
            background-color: rgb(248, 248, 248);
        }

        .left {
            float: left;
            margin-left: 100px;
            background: white;
            width: 600px;
        }

        .right1 {
            margin-right: 100px;
            float: left;
            height: 100px;
            width: 300px;
            background: white;
        }

        .right2 {
            margin-right: 100px;
            float: left;
            height: 200px;
            width: 300px;
            background: white;
        }

        .right3 {
            margin-right: 100px;
            float: left;
            height: 200px;
            width: 300px;
            background: white;
        }

        .content {
            height: 300px;
        }

        #title,
        #author {
            font-size: 18px;
            font-weight: bold;
        }

        #commentName {

            font-size: 16px;
        }

        #agree {
            background-color: rgb(209, 234, 255);
        }

        .tip1,
        .tip2,
        .tip3 {
            padding-left: 10px;
            padding-right: 20px;
            font-size: 16px;
            color: grey;
        }

        .collect {
            display: inline-block;
        }

        .sharing {
            display: inline-block;
        }

        #collectName,
        #contentNum {
            padding-right: 200px;
        }
    </style>
    <script>
    $(function () {
        var num = $("#num").text();
        var favoritesname = $("#favoritesname").val();//收藏标题
        var description = $("#description").val();//收藏描述

        $("#agree").click(function () {
            $("#num").text(num);
            $("#agree").text("已赞同" + (parseInt(num) + 1));
            $("#agree").attr('disabled', true);
        });
        $("#cancel").click(function () {
            $("#num").text(num);
            $("#agree").text("赞同" + (parseInt(num)));
            $("#agree").attr('disabled', false);
        });
        $("#affirm").click(function () {   //确认创建收藏夹
            var favoritesname = $("#favoritesname").val();
            var description = $("#description").val();
            var publics = $('input:radio[id="public"]:checked').val();//公开
            var privates = $('input:radio[id="private"]:checked').val();//私密
            var status;
            alert(favoritesname);
            alert(description);
            if (publics != null) {
                status = "公开";
                alert(status);
            }
            if (privates != null) {
                status = "私密";
                alert(status);
            }
            $.ajax({
                type: "post",
                data: { 'favoritesname': favoritesname, 'description': description, 'status': status },
                url: '',

            });
            layer.close(layer.index);
        });
        $("#shared").click(function () {
            $("#shared").attr('disabled', true);
            $("#shared").text("已分享");
            var friendName = $("#friendName").text();//要分享的好友名
            alert(friendName);
            $.ajax({
                type: 'post',

            });
        });
        $('a[data-toggle="popover"]').popover({
            placement: 'bottom',
            trigger: "focus",
            html: true,
            content: $('#shareList')
        });

        // 收藏标题
        var counter1 = favoritesname.length;
        $("#detail1_num").text(counter1);
        /*添加触发事件进行动态计算输入框的字数*/
        $("#favoritesname").on('blur keyup input', function () {
            var text = $("#favoritesname").val();
            var counter = text.length;
            $("#detail1_num").text(counter);
        });
        /* 收藏描述*/
        var counter2 = text2.length;
        $("#detail2_num").text(counter2);
        $("#description").on('blur keyup input', function () {
            var text = $("#description").val();
            var counter = text.length;
            $("#detail2_num").text(counter);
        });


    })

    function openComment() {   //查看评论
        $("#comments").toggle();
    }
    function openShare() {   //分享
        $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['400px', '300px'],//定义宽和高
                title: false,//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#sharing')//打开的内容
            });
        })
    }
    function openModak() {
        $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['500px', '400px'],//定义宽和高
                title: false,//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#collect')//打开的内容
            });
        })
    }
    function openCreate() {
        $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['500px', '400px'],//定义宽和高
                title: false,//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#create')//打开的内容
            });
        })
    }
    //赞同
    var times1 = 0;
    function like() {
        times1 = times1 + 1;
        var n = $("#like").text();
        if (times1 % 2 != 0) {
            $("#like").text((parseInt(n) + 1));
        } else if (times1 % 2 == 0) {
            $("#like").text((parseInt(n) - 1));
        }
    }
    var times2 = 0;
    function replyLike() {
        times2 = times2 + 1;
        var n = $("#replyLike").text();
        if (times2 % 2 != 0) {
            $("#replyLike").text((parseInt(n) + 1));
        } else if (times2 % 2 == 0) {
            $("#replyLike").text((parseInt(n) - 1));
        }
    }
    //回复评论
    var t1 = 0;
    function reply1() {
        t1 = t1 + 1;
        if (t1 % 2 != 0) {
            $("#reply1").text("✎取消回复");
        } else if (t1 % 2 == 0) {
            $("#reply1").text("✎回复");
        }
        $("#replyText1").toggle();
    }
    var t2 = 0;
    function reply2() {
        t2 = t2 + 1;
        if (t2 % 2 != 0) {
            $("#reply2").text("✎取消回复");
        } else if (t2 % 2 == 0) {
            $("#reply2").text("✎回复");
        }
        $("#replyText2").toggle();
    }
    function submitReply1() {
        var text1 = $("#text1").val();
        alert(text1);
    }
    function submitReply2() {
        var text2 = $("#text2").val();
        alert(text2);
    }
    function collecting() {
        $("#collecting").attr('disabled', true);
        $("#collecting").text("已收藏");
    }
    function affirmCreate() {
        var favoritesname = $("#favoritesname").val();
        alert(favoritesname);
        var description = $("#description").val();
        alert(description);
    }
    function writeIdeas() {
        $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
        layui.use(['layer'], function () {
            var layer = layui.layer, $ = layui.$;
            layer.open({
                type: 1,//类型
                area: ['600px', '500px'],//定义宽和高
                title: false,//题目
                shadeClose: false,//点击遮罩层关闭
                content: $('#writeIdeas')//打开的内容
            });
        })
    }
    function previewImage(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        $("#deletePhoto").show();
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
            var img = document.getElementById('imghead');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
                //                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) { img.src = evt.target.result; }
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
            div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }
    }
    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = { top: 0, left: 0, width: width, height: height };
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
    function publish(){
        var idea=$("#idea").val();
        alert(idea);
    }
    // 此次代码待改进
    function station(){
        alert('1');
        $("#science").removeClass("btn-primary");
        $("#digital").removeClass("btn-primary");
        $("#physical").removeClass("btn-primary");
        $("#fashion").removeClass("btn-primary");
        $("#movie").removeClass("btn-primary");
        $("#station").addClass("btn-primary");
    }
    function science(){
        $("#science").addClass("btn-primary");
        $("#digital").removeClass("btn-primary");
        $("#physical").removeClass("btn-primary");
        $("#fashion").removeClass("btn-primary");
        $("#movie").removeClass("btn-primary");
        $("#station").removeClass("btn-primary");

    }
    function digital(){
        $("#science").removeClass("btn-primary");
        $("#digital").addClass("btn-primary");
        $("#physical").removeClass("btn-primary");
        $("#fashion").removeClass("btn-primary");
        $("#movie").removeClass("btn-primary");
        $("#station").removeClass("btn-primary");
    }
    function physical(){
        $("#science").removeClass("btn-primary");
        $("#digital").removeClass("btn-primary");
        $("#physical").addClass("btn-primary");
        $("#fashion").removeClass("btn-primary");
        $("#movie").removeClass("btn-primary");
        $("#station").removeClass("btn-primary");
    }
    function fashion(){
        $("#science").removeClass("btn-primary");
        $("#digital").removeClass("btn-primary");
        $("#physical").removeClass("btn-primary");
        $("#fashion").addClass("btn-primary");
        $("#movie").removeClass("btn-primary");
        $("#station").removeClass("btn-primary");
    }
    function movie(){
        $("#science").removeClass("btn-primary");
        $("#digital").removeClass("btn-primary");
        $("#physical").removeClass("btn-primary");
        $("#fashion").removeClass("btn-primary");
        $("#movie").addClass("btn-primary");
        $("#station").removeClass("btn-primary");
    }
    </script>
</head>

<body>
      <jsp:include page="navigation.jsp" flush="true"></jsp:include> 

    <div class="container mt-3">
        <div class="left" style="background-color:white;float:left;">
            <ul class="nav" role="tablist">
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
                    <div id="" style="height:400px;">
                        <h3>关注</h3>
                    </div>
                </div>
                <div id="hot" class="container tab-pane fade"><br>
                    <div id="hotList">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm ml-2 btn-priamry" onclick="station()" id="station">全站</button>
                            <button type="button" class="btn btn-sm ml-2" onclick="science()" id="science">科学</button>
                            <button type="button" class="btn btn-sm ml-2" onclick="digital()" id="digital">数码</button>
                            <button type="button" class="btn btn-sm ml-2" onclick="physical()" id="physical">体育</button>
                            <button type="button" class="btn btn-sm ml-2" onclick="fashion()" id="fashion">时尚</button>
                            <button type="button" class="btn btn-sm ml-2" onclick="movie()" id="movie">影视</button>
                        </div>
                    </div>
                    <hr />
                    <div id="hotContent">
                        <div id="hotNum" style="float:left;color: darkorange;font-size:25px;font-weight:bold">1</div>
                        <div id="hotTitle" style="float:left;margin-left:10px;width:400px;">
                            <p style="font-size:18px;font-weight:bold">地球上是否存在没有天敌的动物？</p>
                            <p class="text-muted mt-1">所谓天敌只是针对动物，例如老鼠的天敌是猫。不包括生病，气候变化，火山喷发之类的</p>
                            <div id="">
                                <p class="text-muted mt-1" style="float:left">♨<span id="heat">6675万</span>热度</p>
                                <p class="text-muted mt-1" onclick="openShare()" style="float:right">➢分享</p>
                            </div>
                        </div>
                        <!--如果有图片的话-->
                        <div id="hotImg" style="float:right;width:130px;">
                            <image src="common/image/bg.jpg" style="width:130px;height:100px;"></image>
                        </div>
                        <hr />
                        <div id="hotNum" style="float:left;color: darkorange;font-size:25px;font-weight:bold">2</div>
                        <div id="hotTitle" style="float:left;margin-left:10px;width:400px;">
                            <p style="font-size:18px;font-weight:bold">为什么鲁迅在他那个年代骂人成名了，而现实中大多数骂人只能落个网络喷子的下场?</p>
                            <p class="text-muted mt-1">二者差距在哪</p>
                            <div id="">
                                <p class="text-muted mt-2" style="float:left">♨<span id="heat">4684万</span>热度</p>
                                <p class="text-muted mt-2" onclick="openShare()" style="float:right">➢分享</p>
                            </div>
                        </div>
                        <hr />
                    </div>
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

        <div class="right1" style="background-color:white;float:right">
            <div style="padding-left:40px;padding-top:20px;float:left">
                <input type="image" src="common/image/commend.png" style="width:30px;height:30px">
                <p class="mt-2"><a href="#">写回答</a></p>
            </div>
            <div style="padding-left:50px;padding-top:20px;float:left">
                <input type="image" src="common/image/article.png" style="width:30px;height:30px">
                <p class="mt-2"><a href="#">写文章</a></p>
            </div>
            <div style="padding-left:50px;padding-top:20px;float:left" onclick="writeIdeas()">
                <input type="image" src="common/image/idea.png" style="width:30px;height:30px">
                <p class="mt-2"><a href="#">写想法</a></p>
            </div>
            <br/>
            <div id="" style="background-color:rgb(255, 255, 255);height:50px;width:300px;float:right">
                <input type="image"  src="common/image/clock.png" style="width:20px;height:20px;margin-left: 20px;margin-top:20px;">
                <a href="#" class="text-muted">&nbsp;我的稍后答</a>    
            </div>
        </div>
                <div class="right2" style="float:right;margin-top: 50px;">
            <div style="padding-left:45px;padding-top:20px;float:left">
                <input type="image" src="common/image/live.png" style="width:40px;height:40px">
                <p class="mt-2"><a href="#">Live</a></p>
            </div>
            <div style="padding-left:45px;padding-top:20px;float:left">
                <input type="image" src="common/image/bookstore.png" style="width:40px;height:40px">
                <p class="mt-2"><a href="#">书店</a></p>
            </div>
            <div style="padding-left:45px;padding-top:20px;float:left">
                <input type="image" src="common/image/roundtable.png" style="width:40px;height:40px">
                <p class="mt-2"><a href="#">圆桌</a></p>
            </div>
            <div style="padding-left:45px;padding-top:20px;float:left">
                <input type="image" src="common/image/column.png" style="width:40px;height:40px">
                <p class="mt-2"><a href="#">专栏</a></p>
            </div>
            <div style="padding-left:45px;padding-top:20px;float:left">
                <input type="image" src="common/image/payment.png" style="width:40px;height:40px">
                <p class="mt-2"><a href="#">付费咨询</a></p>
            </div>
        </div>
        <div class="right3" style="float:right;margin-top: 20px;">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <td><input type="image" src="common/image/collect.png" style="width:20px;height:20px">
                        </td>
                        <td>我的收藏</td>
                    </tr>
                    <tr>
                        <td><input type="image" src="common/image/question.png" style="width:20px;height:20px">
                        </td>
                        <td>我关注的问题</td>
                    </tr>
                    <tr>
                        <td><input type="image" src="common/image/invite.png" style="width:20px;height:20px">
                        </td>
                        <td>我的邀请</td>
                    </tr>
                    <tr>
                        <td><input type="image" src="common/image/service.png" style="width:20px;height:20px">
                        </td>
                        <td>版权服务中心</td>
                    </tr>
                </tbody>

            </table>
        </div>
    </div>


    <!-- 分享功能 -->
    <div id="sharing" style="display:none;" align="center">
        <h3 class="mt-5">选择好友分享</h3>
        <div class="friends mt-2">
            <div class="" style="float:left;padding-left: 100px">
                <p id="friendName" style="font-size: 20px">ttt</p>
            </div>
            <button type="button" class="btn btn-sm btn-primary" id="shared">分享</button>
        </div>
    </div>
    <div id="collect" style="display: none;" align="center">
        <h3 class="mt-5">添加收藏</h3>
        <p class="text-muted mt-2">请选择你想添加的收藏夹</p>
        <div class="collect mt-4">
            <div class="" style="float:left">
                <p id="collectName">hhh</p>
                <p id="contentNum" class="text-muted">24条内容</p>
            </div>
            <button class="btn btn-sm btn-outline-primary" onclick="collecting()" id="collecting">收藏</button>
        </div>
        <hr>
        <button type="button" class="btn btn-primary" onclick="openCreate()">创建收藏夹</button>
    </div>
    <div id="create" style="display: none;" align="center">
        <h3 class="mt-4">创建新抽藏夹</h3>
        <textarea id="favoritesname" class="form-control mt-2" rows="1" placeholder="收藏标题" style="width: 450px"
            maxlength="20"></textarea>
        <p><span id="detail1_num">0</span>/<span>20</span></p>
        <textarea id="description" class="form-control mt-2" rows="5" placeholder="收藏描述(可选)" style="width: 450px"
            maxlength="100"></textarea>
        <p><span id="detail2_num">0</span>/<span>100</span></p>
        <form id="status">
            <div class="radio">
                <label><input type="radio" name="optradio" class="mt-2" id="publics">公开 有其他人关注此收藏夹时不可设置为私密</label>
            </div>
            <div class="radio">
                <label><input type="radio" name="optradio" class="mt-2" id="privates">私密 只有你自己可以查看这个收藏夹</label>
            </div>
        </form>
        <button type="button" class="btn btn-primary" id="affirm">确认创建</button>
    </div>
        <div id="writeIdeas" style="display:none;" align="center">
        <h3 class="mt-5">写想法</h3>
        <p class="text-muted mt-2" >分享你此刻的想法</p>
        <textarea class="form-control mt-2" rows="10" style="width: 500px" id="idea"></textarea>
        <p class="text-primary col-sm-4" style="float:left">选择图片上传</p>
        <div class="big-photo mt-4" style="padding-right:400px">
            <div id="preview">
                <img id="imghead" border="0" src="common/image/photo_icon.png" width="50" height="50"
                    onclick="$('#previewImg').click();">
            </div>
            <input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg">
            <p class="text-primary" style="display:none" onclick="deletePhoto()" id="deletePhoto">删除</p>
        </div>
        <button type="button" class="btn btn-primary btn-sm" style="width:200px" onclick="publish()">发布</button>
    </div>
</body>

</html>