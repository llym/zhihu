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
    <link rel="stylesheet" href="common/tool/assets/design/css/trumbowyg.css"> 
    <script src="common/tool/assets/jquery.min.js"></script>
    <script src="common/tool/assets/trumbowyg.js"></script>
    <script src="common/tool/assets/plugins/base64/trumbowyg.base64.js"></script>
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
    	//热榜的按钮分类
        $(".btn-outline-primary").click(function () {
            var string=$(this).text().toString();
		    var id=1;
		    if(string.substring(33,35)=="科学"){
		    	id=1;window.location.href ='hotopic.do?top='+id;
		    }
		    else if (string.substring(33,35)=="数码"){
		    	id=2;window.location.href ='hotopic.do?top='+id;
		    }
		    else if (string.substring(33,35)=="体育"){
		    	id=3;window.location.href ='hotopic.do?top='+id;
		    }
		    else if (string.substring(33,35)=="时尚"){
		    	id=4;window.location.href ='hotopic.do?top='+id;
		    }
		    else if (string.substring(33,35)=="影视"){
		    	id=5;
		    	window.location.href ='hotopic.do?top='+id;
		    }
		    else if (string.substring(33,35)=="全站"){
		    	window.location.href ="hot.do";
		    }
		    
        });
    	
    	
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

     function openComment(id){   //查看评论
        $("#comments"+id).toggle();
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
    
    function writeque(id){
    	alert(id);
    	window.location.href ='test.do?questionid='+id;
    }
    </script>
</head>

<body>
      <jsp:include page="navigation.jsp" flush="true"></jsp:include> 

    <div class="container mt-3">
        <div class="left" style="background-color:white;float:left;">
            <ul class="nav" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" href="homePage.do">推荐</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#follow">关注</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="hot.do">热榜</a>
                </li>
            </ul>
                <div id="hot"><br>
                    <div id="hotList">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-primary active ml-2">
                                <input type="radio" name="options" id="option1" autocomplete="off" checked>全站
                            </label>
                            <label class="btn btn-outline-primary ml-2">
                                <input type="radio" name="options" id="option2" autocomplete="off">科学
                            </label>
                            <label class="btn btn-outline-primary ml-2">
                                <input type="radio" name="options" id="option3" autocomplete="off">数码
                            </label>
                            <label class="btn btn-outline-primary ml-2">
                                <input type="radio" name="options" id="option3" autocomplete="off">体育
                            </label>
                            <label class="btn btn-outline-primary ml-2">
                                <input type="radio" name="options" id="option3" autocomplete="off">时尚
                            </label>
                            <label class="btn btn-outline-primary ml-2">
                                <input type="radio" name="options" id="option3" autocomplete="off">影视
                            </label>
                        </div>
                    </div>
                    <hr />
                       <c:forEach items="${quelist}" var="que" varStatus="userStatus">
                    <div id="hotContent" >
                    	<c:forEach items="${numlist}" var="num">
                    	  <c:if   test="${que.questionid eq num.questionid}">
                        <div id="hotNum" style="float:left;color: darkorange;font-size:25px;font-weight:bold">${userStatus.count}</div>         
                        <div id="hotTitle" style="float:left;margin-left:10px;width:400px;">
                            <p onclick="writeque(${que.questionid})" style="font-size:18px;font-weight:bold">${que.questionname}</p>
                            <p class="text-muted mt-1" style="width:400px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${que.questiondescribe}</p>
                            <div id="">
                                <p class="text-muted mt-1" style="float:left">♨<span id="heat">${que.browsenumb}</span>热度</p>
                                <p class="text-muted mt-1" onclick="openShare()" style="float:right">➢分享</p>
                            </div>
                        </div>
                        <!--如果有图片的话-->
                          <c:if   test="${not empty num.photo}">
                        <div id="hotImg" style="float:right;width:130px;">
                            <image src='${num.photo}' alt = "无图片" style="width:130px;height:100px;"></image>
                        </div>
                         </c:if>
                         </c:if>
                        </c:forEach>
                        <hr />
                    </div>
                      </c:forEach>
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