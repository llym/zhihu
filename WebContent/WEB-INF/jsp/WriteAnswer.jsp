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
            background-color:white;
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
            $(".writeAnswer").toggle();
        }
        function submit(){
            alert($("#editor").val());
        }
        
        function readComment() {
            $("[name='testname']").val("xxxxxxxxxxxxxxx");
            layui.use(['layer'], function () {
                var layer = layui.layer, $ = layui.$;
                layer.open({
                    type: 1,//类型
                    area: ['700px', '600px'],
                    title: false,
                    shadeClose: false,
                    content: $('#readComment')
                });
            })
        }
        
       
        function  anreadComment(id) {
            $("[name='testname']").val("xxxxxxxxxxxxxxx");
            var a="#anreadComment"+id;
            alert(a);
            layui.use(['layer'], function () {
                var layer = layui.layer, $ = layui.$;
                layer.open({
                    type: 1,//类型
                    area: ['700px', '600px'],
                    title: false,
                    shadeClose: false,
                    content: $(a)
                });
            })
        }
        
        // 点赞评论
        function praise(id) {
            var num = $("#praiseNum"+id).text();
            if ($(".praise"+id).css('color') == 'rgb(128, 128, 128)') {
                $(".praise"+id).css('color', 'blue');
                $("#praiseNum"+id).text(parseInt(num) + 1);
            } else if ($(".praise"+id).css('color') == 'rgb(0, 0, 255)') {
                $(".praise"+id).css('color', 'gray');
                $("#praiseNum"+id).text(parseInt(num) - 1);
            }
        }
        //点赞回复评论的
        function praiseReply(id) {
            var num = $("#praiseReplyNum"+id).text();
            if ($(".praiseReply"+id).css('color') == 'rgb(128, 128, 128)') {
                $(".praiseReply"+id).css('color', 'blue');
                $("#praiseReplyNum"+id).text(parseInt(num) + 1);
            } else if ($(".praiseReply"+id).css('color') == 'rgb(0, 0, 255)') {
                $(".praiseReply"+id).css('color', 'gray');
                $("#praiseReplyNum"+id).text(parseInt(num) - 1);
            }
        }
        //回复评论  
        function reply(id) {
            if ($("#replyFlag1"+id).text() == '回复') {
                $("#replyFlag1"+id).text("取消回复");
                $("#reply"+id).show();
            } else if ($("#replyFlag1"+id).text() == '取消回复') {
                $("#replyFlag1"+id).text("回复");
                $("#reply"+id).hide();
            }
        }
        //发布回复评论的内容
        function publishReply(id) {
        	 var commentid=id.getAttribute('co');
            var text = $("#replyContent"+commentid).val();
            alert(text);
        }
        //回复评论中的回复
        function replyComment(id) {
            if ($("#replyFlag2"+id).text() == '回复') {
                $("#replyFlag2"+id).text("取消回复");
                $("#replyCommentArea"+id).show();
            } else if ($("#replyFlag2"+id).text() == '取消回复') {
                $("#replyFlag2"+id).text("回复");
                $("#replyCommentArea"+id).hide();
            }
        }
        //发布回复评论中的内容
        function publishReplyComment(id){
        	var rcommentid=id.getAttribute('rc');
            var text=$("#replyCommentText"+rcommentid).val();
            alert(text);
        }
        //发布对问题的评论
        function publish(){
            var text=$("#commentText").val();
            alert(text);
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
                        <span style="font-weight:bold" id="followerNum">${question.attentionnumb}</span></button>
                    <button type="button" class="btn btns" style="margin-left:20px">浏览者<br>
                        <span style="font-weight:bold" id="browserNum">${question.browsenumb}</span>
                    </button>
                </div>
            </div>
            <div style="width:600px">
                <div class="discription mt-3">
                    <p id="title" style="font-size:20px;font-weight:bold">${question.questionname}
                    </p>
                    <p id="content" style="font-size:16px">
                        ${question.questiondescribe}
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
                    <a href="#" class="btn" onclick="readComment()"><i class="layui-icon layui-icon-dialogue"
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
            <c:forEach items="${anlist}" var="an">
                <!-- 头像 -->
                <image src="/pic/a.jpg" style="width:30px;height: 30px" />
                <!-- 用户名 -->
                <span id="answerUser" style="font-weight: bold;font-size:16px;padding-left:10px">${an.userid}</span>
                <div>
                    <p id="answerContent" class="mt-2" style="font-size:16px">${an.answercontent}</p>
                    <p class="text-muted mt-2">发布于<span id="answerTime"><fmt:formatDate value="${an.createtime}" pattern="yyyy-MM-dd"/></span></p>
                </div>
                <div class="mt-2">
                    <button type="button" class="btn btn-sm agree">赞同</button>
                    <button type="button" class="btn btn-sm cancel">▼</i></button>
                    <button onclick="anreadComment(${an.answerid})" type="button" class="btn btn-sm comment">✉<span id="commentNum">2</span>条评论</button>
                    <button type="button" class="btn btn-sm share">分享</button>
                    <button type="button" class="btn btn-sm collect">收藏</button>
                </div>
                
                
                
                  <div id="anreadComment${an.answerid}" style="display:none;">
				        <p style="font-weight:bold;font-size:16px"><span id="num">3</span>条评论</p>
				        <hr />
				         <c:forEach items="${comlist}" var="com">
				          <c:if   test="${com.answerid eq an.answerid}">
				        <div id="ancomment" style="font-size:16px;">
				            <p>
				                <image src="common/image/pic.jpg" style="width:30px;height:30px"></image>
				                <span id="ancommentUser" style="font-size:16px" class="ml-2">怡红公子</span>
				                <!-- 评论的内容 -->
				                <p id="ancommentContent" style="padding-left:40px" class="mt-2">${com.commentcontent}</p>
				                <p style="padding-left:40px;" class="mt-2">
				                    <!-- 点赞 -->
				                    <i class="layui-icon layui-icon-praise praise" style="font-size: 16px; color: gray;"
				                        onclick="anpraise()"></i>
				                    <span id="anpraiseNum">1</span>
				
				                    <i class="layui-icon layui-icon-edit" style="font-size: 16px; color: gray;"></i>
				                    <span onclick="anreply()" id="replyFlag1">回复</span>
				                </p>
				                <div style="padding-left:40px;display:none" id="reply">
				                    <textarea id="anreplyContent" class="form-control"
				                        style="float:left;width:500px;height:40px;"></textarea>
				                    <button type="button" class="btn btn-primary ml-2" onclick="anpublishReply()">发布</button>
				                </div>
				            </p>
				           
				          		 
				            <!-- 该评论下的回复 -->
				            <hr />
				            
				            <div id="anreplyanComment" style="padding-left:40px;">
				                <p>
				                <c:forEach items="${rcomlist}" var="rcom">
				         		 <c:if   test="${com.commentid eq rcom.commentid}">
				                    <image src="common/image/pic.jpg" style="width:30px;height:30px"></image>
				                    <span id="anreplyCommentUser">天猪</span>
				                    <span class="text-muted">回复</span>
				                    <span id="ancommentUser">怡红公子</span>
				                    <p id="anreplyCommentContent" class="mt-2" style="padding-left:40px">
				                       ${rcom.commentcontent}
				                    </p>
				                    <p style="padding-left:40px;" class="mt-2">
				                        <!-- 点赞 -->
				                        <i class="layui-icon layui-icon-praise praiseReply" style="font-size: 16px; color: gray;"
				                            onclick="praiseReply()"></i>
				                        <span id="anpraiseReplyNum">3</span>
				                        <i class="layui-icon layui-icon-edit" style="font-size: 16px; color: gray;"></i>
				                        <span onclick="anreplyComment()" id="anreplyFlag2">回复</span>
				                    </p>
				                    <div style="padding-left:40px;display:none" id="anreplyCommentArea">
				                        <textarea id="anreplyCommentText" class="form-control"
				                            style="float:left;width:500px;height:40px;"></textarea>
				                        <button type="button" class="btn btn-primary ml-2" onclick="anpublishReplyComment()">发布</button>
				                    </div> 
				                     </c:if>
                        </c:forEach>
				                </p>
				            </div>
				
				
				        </div>
				        </c:if>
				        </c:forEach>
				        <div style="position:absolute;padding-top:270px">
				            <textarea class="form-control" style="float:left;width:550px;height:40px;" id="ancommentText"></textarea>
				            <buttont type="button" class="btn btn-primary ml-2" onclick="anpublish()">发布</buttont>
				        </div>
				    </div>
				             
                </c:forEach>
            </div>
            <hr>
        </div>
    </div>
<!--     <div class="write mt-2"> -->
<!--         <button type="button" class="btn btn-block mt-2" style="background-color: white" onclick="writeAnswer()"><i -->
<!--                 class="layui-icon layui-icon-edit" style="font-size: 14px; color: rgb(109, 177, 245);"></i>写回答</button> -->
<!--     </div> -->

	    <div id="readComment" style="display:none;">
	    	
        <p style="font-weight:bold;font-size:16px" class="ml-2"><span id="num">3</span>条评论</p>
        <hr>
        <c:forEach items="${questioncomment}" var="que">
        <div id="comment" class="ml-2" style="font-size:16px;">
            <p>
                <image src="common/image/pic.jpg" style="width:30px;height:30px"></image>
                <span id="commentUser" style="font-size:16px" class="ml-2">${que.userid}</span>
                <!-- 评论的内容 -->
                <p id="commentContent" style="padding-left:40px" class="mt-2">${que.commentcontent}</p>
                <p style="padding-left:40px;" class="mt-2">
                    <!-- 点赞 -->
                    <i class="layui-icon layui-icon-praise praise${que.commentid}" style="font-size: 16px; color: gray;"
                        onclick="praise(${que.commentid})"></i>
                    <span id="praiseNum${que.commentid}">${que.prisenumb}</span>

                    <i class="layui-icon layui-icon-edit" style="font-size: 16px; color: gray;"></i>
                    <span onclick="reply(${que.commentid})" id="replyFlag1${que.commentid}">回复</span>
                </p>
                <div style="padding-left:40px;display:none" id="reply${que.commentid}">
                    <textarea id="replyContent${que.commentid}" class="form-control"
                        style="float:left;width:80%;height:40px;"></textarea>
                    <button type="button" class="btn btn-primary ml-2" co="${que.commentid}" onclick="publishReply(this)">发布</button>
                </div>
            </p>
            <!-- 该评论下的回复 -->
           
               <c:forEach items="${rquestioncomment}" var="rque">
               <br>
                        <c:if   test="${que.commentid eq rque.commentid}">
            <div id="replyComment" style="padding-left:40px;">
                <p>
                    <image src="common/image/pic.jpg" style="width:30px;height:30px"></image>
                    <span id="replyCommentUser">${rque.userid}</span>
                    <span class="text-muted">回复</span>
                    <span id="commentUser">${rque.commentuserid}</span>
                    <p id="replyCommentContent" class="mt-2" style="padding-left:40px">
                        ${rque.commentcontent}
                    </p>
                    <p style="padding-left:40px;" class="mt-2">
                        <!-- 点赞 -->
                        <i class="layui-icon layui-icon-praise praiseReply${rque.rcommentid}" style="font-size: 16px; color: gray;"
                            onclick="praiseReply(${rque.rcommentid})"></i>
                        <span id="praiseReplyNum${rque.rcommentid}">${rque.prisenumb}</span>
                        <i class="layui-icon layui-icon-edit" style="font-size: 16px; color: gray;"></i>
                        <span onclick="replyComment(${rque.rcommentid})" id="replyFlag2${rque.rcommentid}">回复</span>
                    </p>
                    <div style="padding-left:40px;display:none" id="replyCommentArea${rque.rcommentid}">
                        <textarea id="replyCommentText${rque.rcommentid}" class="form-control"
                            style="float:left;width:500px;height:40px;"></textarea>
                        <button type="button" class="btn btn-primary ml-2" rc="${rque.rcommentid}" onclick="publishReplyComment(this)">发布</button>
                    </div> 
                </p>
            </div>
 				</c:if>
           </c:forEach>

        </div>
        <hr>
        </c:forEach>
        <div style="position:absolute;padding-top:270px">
            <textarea class="form-control" style="float:left;width:550px;height:40px;" id="commentText"></textarea>
            <buttont type="button" class="btn btn-primary ml-2" onclick="publish()">发布</buttont>
        </div>
        
    </div>

</body>
</html>