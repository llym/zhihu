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
        function getPhotoPath(obj){
    		//obj传入的DOM对象
    		console.log(obj)
    		console.log(obj.id);
    		console.log(obj.src);
    		console.log(obj.onload);
    		var path
    		$.post("getPhotoPath.do",{
    			id:obj.id
    		},function(data){
    			console.log(data)
    			obj.src=data
    			obj.onload=""
    				console.log(obj.onload)
    			console.log(obj.src)
    			
    		});
    		
    	}
        //判断有没有关注
        var queid=${question.questionid};
        $.post("testcare.do",
			    {
			'queid':queid
					},
 			        function(data,status){
 			        if(data=="1"){
 			        	$("#followQuestion").text("取消关注");
 			        }
 			        else{
 			        	 $("#followQuestion").text("关注问题");
 			        }
 			        //window.location.reload();
			    });
        
        $(function () {
            var editor = new Simditor({
                textarea: $('#editor')
                //optional options
            });
        });
        function followQuestion() {
            if ($("#followQuestion").text() == "关注问题") {
                $("#followQuestion").text("取消关注");
                var a=${question.questionid};
                $.post("insertcq.do",
        			    {
        			'queid':a
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
                
                
            } else if ($("#followQuestion").text() == "取消关注") {
                $("#followQuestion").text("关注问题");
                	var a=${question.questionid};
                    $.post("cancelcq.do",
            			    {
            			'queid':a
            					},
             			        function(data,status){
             			        alert(data);
             			        //window.location.reload();
            			    });
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
            var questionid=${question.questionid};
            alert(questionid);
            $.post("insertanswer.do",
    			    {
    			'queid':questionid,
    			'content':$("#editor").val()
    					},
     			        function(data,status){
     			        alert(data);
     			        //window.location.reload();
    			    });
            
        }
        //问题的评论框
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
        
       //回答的评论框
        function  anreadComment(id) {
            $("[name='testname']").val("xxxxxxxxxxxxxxx");
            var a="#anreadComment"+id;
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
                $.post("qpriseac.do",
        			    {
        			'commentid':id
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
            } else if ($(".praise"+id).css('color') == 'rgb(0, 0, 255)') {
                $(".praise"+id).css('color', 'gray');
                $("#praiseNum"+id).text(parseInt(num) - 1);
                $.post("qreduceac.do",
        			    {
        			'commentid':id
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
            }
        }
        //点赞回复评论的
        function praiseReply(id) {
            var num = $("#praiseReplyNum"+id).text();
            if ($(".praiseReply"+id).css('color') == 'rgb(128, 128, 128)') {
                $(".praiseReply"+id).css('color', 'blue');
                $("#praiseReplyNum"+id).text(parseInt(num) + 1);
                $.post("qpriserac.do",
         			    {
         			'rcommentid':id
         					},
          			        function(data,status){
          			        alert(data);
          			        //window.location.reload();
         			    });
            } else if ($(".praiseReply"+id).css('color') == 'rgb(0, 0, 255)') {
                $(".praiseReply"+id).css('color', 'gray');
                $("#praiseReplyNum"+id).text(parseInt(num) - 1);
                $.post("qreducerac.do",
        			    {
        			'rcommentid':id
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
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
         	var queid=id.getAttribute('uc');
            var text = $("#replyContent"+commentid).val();
            alert(commentid+text+queid);
            $.post("qinsertr.do",
    			    {
            	'commentcontent':text,
    			'commentid':commentid,
    			'queid':queid
    					},
     			        function(data,status){
     			        alert(data);
     			        //window.location.reload();
    			    });
            
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
        	var queid=id.getAttribute('uc');
            var text=$("#replyCommentText"+rcommentid).val();
            alert(text+queid);
            $.post("qinsertr.do",
    			    {
            	'commentcontent':text,
    			'commentid':rcommentid,
    			'queid':queid
    					},
     			        function(data,status){
     			        alert(data);
     			        //window.location.reload();
    			    });
        }
        //发布对问题的评论
        function publish(){
            var text=$("#commentText").val();
            var questionid=${question.questionid};
            alert(text+questionid);
            $.post("qinsert.do",
    			    {
           	'commentcontent':text,
    			'answerid':questionid
    			    },
    			        function(data,status){
    			        alert(data);
    			        window.location.reload();
    			    });
        }
        
        
        
        //上面是问题，下面是回答
        
        
        
     // 点赞评论
        function anpraise(id) {
            var num = $("#anpraiseNum"+id).text();
            if ($(".praise"+id).css('color') == 'rgb(128, 128, 128)') {
                $(".praise"+id).css('color', 'blue');
                $("#anpraiseNum"+id).text(parseInt(num) + 1);
                $.post("priseac.do",
        			    {
        			'commentid':id
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
            } else if ($(".praise"+id).css('color') == 'rgb(0, 0, 255)') {
                $(".praise"+id).css('color', 'gray');
                $.post("reduceac.do",
        			    {
        			'commentid':id
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
                $("#anpraiseNum"+id).text(parseInt(num) - 1);
            }
        }
        //点赞回复评论的
        function anpraiseReply(id) {
            var num = $("#anpraiseReplyNum"+id).text();
            if ($(".praiseReply"+id).css('color') == 'rgb(128, 128, 128)') {
            	 $.post("priserac.do",
         			    {
         			'rcommentid':id
         					},
          			        function(data,status){
          			        alert(data);
          			        //window.location.reload();
         			    });
                $(".praiseReply"+id).css('color', 'blue');
                $("#anpraiseReplyNum"+id).text(parseInt(num) + 1);
            } else if ($(".praiseReply"+id).css('color') == 'rgb(0, 0, 255)') {
                $(".praiseReply"+id).css('color', 'gray');
                $.post("reducerac.do",
        			    {
        			'rcommentid':id
        					},
         			        function(data,status){
         			        alert(data);
         			        //window.location.reload();
        			    });
                $("#anpraiseReplyNum"+id).text(parseInt(num) - 1);
            }
        }
        //回复评论  
        function anreply(id) {
            if ($("#anreplyFlag1"+id).text() == '回复') {
                $("#anreplyFlag1"+id).text("取消回复");
                $("#anreply"+id).show();
            } else if ($("#anreplyFlag1"+id).text() == '取消回复') {
                $("#anreplyFlag1"+id).text("回复");
                $("#anreply"+id).hide();
            }
        }
        //发布回复评论的内容
        function anpublishReply(id) {
        	var answerid=id.getAttribute('an');
        	 var commentid=id.getAttribute('co');
        	 var queid=id.getAttribute('uc');
            var text = $("#anreplyContent"+commentid).val();
            alert(commentid+text+queid);
            $.post("insertr.do",
    			    {
            	'commentcontent':text,
    			'commentid':commentid,
    			'queid':queid
    					},
     			        function(data,status){
     			        alert(data);
     			        //window.location.reload();
    			    });
        }
        //回复评论中的回复
        function anreplyComment(id) {
            if ($("#anreplyFlag2"+id).text() == '回复') {
                $("#anreplyFlag2"+id).text("取消回复");
                $("#anreplyCommentArea"+id).show();
            } else if ($("#anreplyFlag2"+id).text() == '取消回复') {
                $("#anreplyFlag2"+id).text("回复");
                $("#anreplyCommentArea"+id).hide();
            }
        }
        //发布回复评论中的内容
        function anpublishReplyComment(id){
        	 var rcommentid=id.getAttribute('rc');
         	 var queid=id.getAttribute('uc');
             var commentid=id.getAttribute('co');
             var text=$("#anreplyCommentText"+rcommentid).val();
            alert(text+queid+commentid);
            $.post("insertr.do",
    			    {
            	'commentcontent':text,
    			'commentid':rcommentid,
    			'queid':queid
    					},
     			        function(data,status){
     			        alert(data);
     			        //window.location.reload();
    			    });
        }
        //发布对回答的评论
        function anpublish(id){
           
            var answerid=id.getAttribute('an');
            var text=$("#ancommentText"+answerid).val();
            alert(text);
            $.post("insert.do",
    			    {
           	'commentcontent':text,
    			'answerid':answerid
    			    },
    			        function(data,status){
    			        alert(data);
    			        window.location.reload();
    			    });
        }
        
    </script>
</head>
<body>
	 <jsp:include page="navigation.jsp" flush="true"></jsp:include>
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
                            style="font-size: 14px; color: rgb(125, 131, 136);"></i><span id="num">${question.commentnumb}</span>条评论</a>
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
                <p style="font-weight:bold;font-size:16px"><span id="answerNum">${question.answernumb}</span>个回答</p>
            </div>
            <hr />
            <div>
            <c:forEach items="${anlist}" var="an">
                <!-- 头像 -->
                <image id="${an.userid}" src="/pic/a.jpg" style="width:30px;height: 30px" onload="getPhotoPath(this)"/>
                <!-- 用户名 -->
                <span id="answerUser" style="font-weight: bold;font-size:16px;padding-left:10px">${an.userid}</span>
                <div>
                    <p id="answerContent" class="mt-2" style="font-size:16px">${an.answercontent}</p>
                    <p class="text-muted mt-2">发布于<span id="answerTime"><fmt:formatDate value="${an.createtime}" pattern="yyyy-MM-dd"/></span></p>
                </div>
                <div class="mt-2">
                    <button type="button" class="btn btn-sm agree">赞同</button>
                    <button type="button" class="btn btn-sm cancel">▼</i></button>
                    <button onclick="anreadComment(${an.answerid})" type="button" class="btn btn-sm comment">✉<span id="commentNum">${an.commentnumb}</span>条评论</button>
                    <button type="button" class="btn btn-sm share">分享</button>
                    <button type="button" class="btn btn-sm collect">收藏</button>
                </div>
                
                  <div id="anreadComment${an.answerid}" style="display:none;">
				        <p style="font-weight:bold;font-size:16px"><span id="num">${an.commentnumb}</span>条评论</p>
				        <hr>
				         <c:forEach items="${comlist}" var="com">
				          <c:if   test="${com.answerid eq an.answerid}">
				        <div id="ancomment" style="font-size:16px;">
				            <p>
				                <image id ="${com.userid}" src="common/image/pic.jpg" style="width:30px;height:30px" onload="getPhotoPath(this)"></image>
				                <span id="ancommentUser" style="font-size:16px" class="ml-2">${com.userid}</span>
				                <!-- 评论的内容 -->
				                <p id="ancommentContent" style="padding-left:40px" class="mt-2">${com.commentcontent}</p>
				                <p style="padding-left:40px;" class="mt-2">
				                    <!-- 点赞 -->
				                    <i class="layui-icon layui-icon-praise praise${com.commentid}" style="font-size: 16px; color: gray;"
				                        onclick="anpraise(${com.commentid})"></i>
				                    <span id="anpraiseNum${com.commentid}">${com.prisenumb}</span>
				
				                    <i class="layui-icon layui-icon-edit" style="font-size: 16px; color: gray;"></i>
				                    <span onclick="anreply(${com.commentid})" id="anreplyFlag1${com.commentid}">回复</span>
				                </p>
				                <div style="padding-left:40px;display:none" id="anreply${com.commentid}">
				                    <textarea id="anreplyContent${com.commentid}" class="form-control"
				                        style="float:left;width:500px;height:40px;"></textarea>
				                    <button type="button" class="btn btn-primary ml-2"an="${an.answerid}" uc="${com.userid}" co="${com.commentid}" onclick="anpublishReply(this)">发布</button>
				                </div>
				            </p>
				           
				          		 
				            <!-- 该评论下的回复 -->
				            <c:forEach items="${rcomlist}" var="rcom">
				         		 <c:if   test="${com.commentid eq rcom.commentid}">
				            <div id="anreplyanComment" style="padding-left:40px;">
				            
				                <p>
				                
				                    <image id="${rcom.userid}" src="common/image/pic.jpg" style="width:30px;height:30px" onload="getPhotoPath(this)"></image>
				                    <span id="anreplyCommentUser">${rcom.userid}</span>
				                    <span class="text-muted">回复</span>
				                    <span id="ancommentUser">${rcom.commentuserid}</span>
				                    <p id="anreplyCommentContent" class="mt-2" style="padding-left:40px">
				                       ${rcom.commentcontent}
				                    </p>
				                    <p style="padding-left:40px;" class="mt-2">
				                        <!-- 点赞 -->
				                        <i class="layui-icon layui-icon-praise praiseReply${rcom.rcommentid}" style="font-size: 16px; color: gray;"
				                            onclick="anpraiseReply(${rcom.rcommentid})"></i>
				                        <span id="anpraiseReplyNum${rcom.rcommentid}">${rcom.prisenumb}</span>
				                        <i class="layui-icon layui-icon-edit" style="font-size: 16px; color: gray;"></i>
				                        <span onclick="anreplyComment(${rcom.rcommentid})" id="anreplyFlag2${rcom.rcommentid}">回复</span>
				                    </p>
				                    <div style="padding-left:40px;display:none" id="anreplyCommentArea${rcom.rcommentid}">
				                        <textarea id="anreplyCommentText${rcom.rcommentid}" class="form-control"
				                            style="float:left;width:500px;height:40px;"></textarea>
				                        <button type="button" class="btn btn-primary ml-2"an="${an.answerid}" uc="${rcom.userid}" rc="${rcom.rcommentid}"  co="${com.commentid}" onclick="anpublishReplyComment(this)">发布</button>
				                    </div> 
				                    
				                </p>
				            </div>
							 </c:if>        
                        </c:forEach>
				        </div>
				        </c:if>
				        <hr>
				        </c:forEach>
				        <div style="position:absolute;padding-top:270px">
				            <textarea class="form-control" style="float:left;width:550px;height:40px;" id="ancommentText${an.answerid}"></textarea>
				            <buttont type="button" class="btn btn-primary ml-2"  an="${an.answerid}"  onclick="anpublish(this)">发布</buttont>
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
                <image id="${que.userid}" src="common/image/pic.jpg" style="width:30px;height:30px" onload="getPhotoPath(this)"></image>
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
                    <button type="button" class="btn btn-primary ml-2"  co="${que.commentid}" uc="${que.userid}" onclick="publishReply(this)">发布</button>
                </div>
            </p>
            <!-- 该评论下的回复 -->
           
               <c:forEach items="${rquestioncomment}" var="rque">
               <br>
                        <c:if   test="${que.commentid eq rque.commentid}">
            <div id="replyComment" style="padding-left:40px;">
                <p>
                    <image id="${rque.userid}" src="common/image/pic.jpg" style="width:30px;height:30px" onload="getPhotoPath(this)"></image>
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
                        <button type="button" class="btn btn-primary ml-2" rc="${rque.rcommentid}" uc="${rque.userid}" onclick="publishReplyComment(this)">发布</button>
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