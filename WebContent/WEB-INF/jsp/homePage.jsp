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

        .right {
            margin-right: 200px;
            float: left;
            height:100px;
            width:200px;
            background: white;
        }

        .content{
           
            height:300px;
        }
        #title,#author{
            font-size: 18px;
            font-weight:bold;
        }
        #agree{
            background-color: rgb(209, 234, 255);
        }
        .tip{
            padding-left:10px;
            padding-right: 20px;
            font-size: 16px;
            color:grey;
        } 
        .collect{
            display:inline-block;  
        } 
        .collectName{
            padding-right:100px;
        } 
    </style>
    <script>
        $(function(){
            var num=$("#num").text(); 
            $("#agree").click(function(){  
                $("#num").text(num);
                $("#agree").text("已赞同"+(parseInt(num)+1));
                $("#agree").attr('disabled',true);
            });
            $("#cancel").click(function(){    
                $("#num").text(num);
                $("#agree").text("赞同"+(parseInt(num)));
                $("#agree").attr('disabled',false);
            })
        })
        function openModak(){
            $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
            layui.use(['layer'],function () {
                var layer = layui.layer,$=layui.$;
                layer.open({
                    type:1,//类型
                    area:['500px','400px'],//定义宽和高
                    title:false,//题目
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#motaikunag')//打开的内容
                });
            })
        }

    </script>
</head>

<body>
    <nav class="navbar navbar-expand-lg bg-white navbar-white justify-content-center ">
        <a class="navbar-brand text-primary text-lg" href="#">知乎</a>
        <ul class="nav nav-tabs ml-5 mr-5">
            <li class="nav-item"><a class="nav-link active font-weight-bold" href="#">首页</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">发现</a></li>
            <li class="nav-item"><a class="nav-link" href="#">等你来答</a></li>
            </li>
        </ul>
        <form class="form-inline">
            <input class="form-control mr-2" type="text" placeholder="Search">
            <button class="btn btn-primary ml-2" type="button">提问</button>
        </form>
    </nav>

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
                        <input class="head mt-2" type="image" src='F:\大三上\JavaScript\login\images\sculpture.jpg'" style="width:30px;height:30px;float:left;"/>
                        <p id="author" class="mt-2">&nbsp;雨蒙</p><br/>
                        <p class="text-secondary mt-2">118人赞同了该回答</p>
                        <p class="mt-2">陈都灵是学姐同学， 厦门一中的。<br/><br/>
                        校花身份红的时候学姐就讲过她不是那种乖乖女或者好学生。比较叛逆，有一点社会感……总之通过这件事觉得娱乐圈很多明星人设都是包装的吧<br/><br/>    
                        章泽天就不了解了，记得当年的奶茶照真的直男斩啊</p>
                        <p class="text-secondary mt-2">发布于2019-06-16</p>
                        <button class="btn btn-sm mt-2" type="submit" id="agree">赞同<span id="num">123</span></button>
                        <button class="btn btn-primary btn-sm mt-2" id="cancel">▼</button>
                        <a href="#" class="tip mt-2">✉评论</a><a href="#" class="tip mt-2">➢分享</a><a href="#" class="tip mt-2" onclick="openModak()">★收藏</a>
                    </div>                        
                </div>
                <div id="follow" class="container tab-pane fade"><br>
                    <h3>关注</h3>
                </div>
                <div id="hot" class="container tab-pane fade"><br>
                    <h3>热榜</h3>
                </div>
            </div>
        </div>
        <div class="right" style="background-color:white;float:right">   
        </div>
    </div>
    <div id="motaikunag" style="display: none;" align="center">
        <h3 class="mt-5">添加收藏</h3>
        <p class="text-muted mt-2">请选择你想添加的收藏夹</p>
        <div class="collect mt-4">
            <p class="collectName" style="float:left">hhh</p>
            <button class="btn btn-sm btn-outline-primary" >收藏</button>
        </div>
        <hr>
        <div class="collect mt-4">
            <p class="collectName" style="float:left">hhh</p>
            <button class="btn btn-sm btn-outline-primary" >收藏</button>
        </div>
        <!-- <button type="button" class="btn btn-primary">创建收藏夹</button> -->
    </div>
</body>

</html>