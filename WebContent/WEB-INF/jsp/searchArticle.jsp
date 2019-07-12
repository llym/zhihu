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
            padding-left: 10%;
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
            margin-left: 10%;
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

        function agreeArticle() {
            var n = $("#agreeArticle").text();
            $("#agreeArticle").text((parseInt(n) + 1));
            $("#agreeA").attr('disabled', true);
        }
        // 取消赞同
        function cancelArticle() {
            var n = $("#agreeArticle").text();
            $("#agreeArticle").text((parseInt(n) - 1));
            $("#agreeA").attr('disabled', false);
        }

    </script>
</head>

<body>
 <jsp:include page="navigation.jsp" flush="true"></jsp:include> 
    <div class="topHeader mt-1">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link"  href="searchq.do">问题</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active"  href="searcharticle.do">文章</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"  href="searchuser.do">用户</a>
            </li>
        </ul>
    </div>
    <div class="tab-content">
      
        <div id="searchArticle" class="container tab-pane active"><br>
            	<c:forEach items="${arlist}" var="ar" >
            
            <div class="article">
                <p style="font-size:18px;font-weight:bold">${ar.articlename}</p>
                
                <p class="mt-1">
                    <image src="/pic/a.jpg" style="width:20px;height:20px"></image> ${ar.userid}
                    <span class="text-muted"><fmt:formatDate  value="${ar.createtime}" pattern="yyyy-MM-dd"/></span>
                </p>
               
                <div class="mt-2" style="font-size:16px"><image src='${ar.photo}' style="width:160px;height:150px;"></image> ${ar.articlecontent}
                </div>
                
                <button type="button" class="btn btn-sm agree mt-2" onclick="agreeArticle()" id="agreeA">赞同<span
                        id="agreeArticle">${ar.prisenumb}</span></button>
                <button type="button" class="btn btn-sm cancel mt-2" onclick="cancelArticle()">▼</button>
                
            </div>
            	</c:forEach>
            
            
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