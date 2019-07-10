<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>写私信</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

   

    <style>
    .privateLetterIdImg{
    width: 40px;
    height: 40px;
    border-radius:20px;
}

input:focus{
  outline:none;
}
.content{
  width: 700px;
  height: 800px;
  margin-left: 340px;
}
.inputId-webkit-input-placeholder{
  font-size: 2rem;
  font-weight: bold;
}

.comment { width: 680px; margin: 20px auto; position: relative; background: #fff; padding: 20px 50px 50px; border: 1px solid #DDD; border-radius: 5px; }
.comment h3 { height: 28px; line-height: 28px }
.com_form { width: 100%; position: relative }
.input { width: 99%; height: 60px; border: 1px solid #ccc }
.com_form p { height: 28px; line-height: 28px; position: relative; margin-top: 10px; }

span.emotion:hover { background-position: 2px -28px }
.qqFace { margin-top: 4px; background: #fff; padding: 2px; border: 1px #dfe6f6 solid; }
.qqFace table td { padding: 0px; }
.qqFace table td img { cursor: pointer; border: 1px #fff solid; }
.qqFace table td img:hover { border: 1px #0066cc solid; }
 #show { width: 770px; margin: 20px auto; background: #fff; padding: 5px; border-top: 1px solid #DDD;border-bottom: 1px solid #DDD; vertical-align: top; } 

.chat-bg{
    margin-right: 50%;
    float: right;
    background-color: #f6f6f6;
    }

    </style>
    <script>
    function fold(){
        var val=$('#change-text').text();       
        if(val=="∨"){
            $('#change-text').text('＞');
        }
        else {
            $('#change-text').text('∨');
        }
    }

   
    
    </script>

<script  src="common/tool/qqFace/js/jquery.min.js"></script>
<script type="text/javascript" src="common/tool/qqFace/js/jquery.qqFace.js"></script>
<script type="text/javascript">

$(function(){

	$('.emotion').qqFace({

		id : 'facebox', 

		assign:'saytext', 

		path:'common/tool/qqFace/arclist/'	//表情存放的路径

	});

	$(".sub_btn").click(function(){

		var str = $("#saytext").val();

		$("#show").html(replace_em(str));

	});

});

//查看结果

function replace_em(str){

	str = str.replace(/\</g,'&lt;');

	str = str.replace(/\>/g,'&gt;');

	str = str.replace(/\n/g,'<br/>');

	str = str.replace(/\[em_([0-9]*)\]/g,'<img src="common/tool/qqFace/arclist/$1.gif" border="0" />');

	return str;

}

</script>
</head>
<body style="background-color: #f6f6f6">
	 
    <div class="container mt-3" style="margin-left: 20%;">
        <div class="row">
            <div class="left" style="background-color:white;width: 260px;height: 680px; border-right: 1px solid;border-color: #e2e0e0">
                <div class="mt-4 ml-3"><img style="height: 25px;width: 25px;" src="common/image/search.png">
                    <input  style="width: 200px;border:0" type="text" placeholder="搜索联系人"/>
                </div>
                    <div class="dropdown-divider "></div>
                <div class="mt-4 ml-3"><a data-toggle="collapse" style="text-decoration:none;color:#333" href="#demo" onclick="fold()">最近联系
                    <span class="mr-5" id="change-text" style="float: right;" >∨</span></a></div>
                <div id="demo" class="collapse show mt-4 " style=" overflow-y:auto;width: 100%;height: 400px;" >
                    <div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="v-pills-home-tab"
							data-toggle="pill" href="#v-pills-home" role="tab"
                            aria-controls="v-pills-home" aria-selected="true">
                            <img class="privateLetterIdImg" src="common/image/privateLetter1.jpg"/>&nbsp;知乎大学小管家
                            <img src="common/image/privateLetter2.png" style="width:15px;height:15px;"/></a> <br/>
							<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
							href="#v-pills-profile" role="tab"
                            aria-controls="v-pills-profile" aria-selected="false">
                            <img class="privateLetterIdImg" src="common/image/privateLetter3.jpg"/>知乎读书会团员</a><br/>
					</div>
                </div>
            </div>
            <div class="right" style="background-color:white;width: 680px;height: 680px;">
                    <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home"
                                role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <h6 class="mt-4 font-weight-bold text-center">知乎大学小管家<img src="common/image/privateLetter2.png" style="width:15px;height:15px;"/></h6>
                            <div style=" overflow-y:auto;width: 100%;height: 400px;" id="show"><!--固定滚动框大小-->
                            <time dateTime="2018-11-19T03:36:37.000Z"><p class="text-center text-muted mt-3">18/11/19 11:36</p></time>                    
                            <div style="float:left"><img class="privateLetterIdImg ml-4" src="common/image/privateLetter1.jpg"/>
                            <div class="ml-5 chat-bg"> <!--chat-bg为对方聊天气泡样式-->
                                <p class="font-weight-light">亲爱的 虾米 你好：<br/>

                                    感谢你一直以来对知乎大学的关注和支持，近期我们正在进行一次针对知乎大学使用体验的调研，希望通过这份问卷，了解你的感受和建议。后续我们将根据收集到的反馈，对相关产品及策略进行改进和优化。
                                    
                                    问卷仅需 5 分钟， <a href="#">戳这里填写</a>。再次感谢你的参与~
                                    
                                    爱你的知乎大学小管家</p>
                                    
                                  </div>
                                </div>
                                        <div style="float:right">
                                <img class="privateLetterIdImg ml-4" src="common/image/sculpture.jpg" />
                                <div class=" chat-bg">
                                    <p style="margin-right: 20px">哦哦</p>
                                </div>
                            </div>


                            </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                                aria-labelledby="v-pills-profile-tab">
                                <h6 class="mt-4 font-weight-bold text-center">知乎读书会团队</h6>
                            <div  style=" overflow-y:auto;width: 100%;height: 400px;" id="show"><!--固定滚动框大小-->
                            <time dateTime="2018-11-19T03:36:37.000Z"><p class="text-center text-muted mt-3">18/10/07 07：35</p></time>                    
                            <div style="float:left"><img class="privateLetterIdImg ml-4" src="common/image/privateLetter3.jpg"/>
                            <div class="ml-5 chat-bg">
                                    <p class="font-weight-light">亲爱的 虾米 你好：<br/>

                                        欢迎来到知乎读书会。《编程小白学 Python》已经放入你的书架，你可以在最新版客户端「更多」栏目 「我的书架」中阅读。你购买或下载的电子书都会放在书架中。

                                        如果你在使用过程中遇到了疑问，可以查看常见问题解答，也可以通过客户端「摇一摇」或者回复此私信反馈给我们。
                                        
                                        谢谢你的支持！
                                        
                                        爱你的知乎读书会团队</p>
                                    
                                  </div>
                                </div>
                                <div style="float:right">
                                <img class="privateLetterIdImg ml-4" src="common/image/sculpture.jpg" />
                                <div class=" chat-bg">
                                    <p style="margin-right: 20px">不客气</p>
                                </div>
                            </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
                                aria-labelledby="v-pills-messages-tab">...</div>
                            <div class="tab-pane fade" id="v-pills-private" role="tabpanel"
                                aria-labelledby="v-pills-settings-tab">...</div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
                                aria-labelledby="v-pills-settings-tab">...</div>
                        </div>

                        <div><button class="emotion" style="border:0px;background-color:transparent;">
                            <img style="height: 25px; width: 25px;" src="common/image/smile.png"/></button></div>
                        <div>
                        <textarea class="input mt-1 ml-3" id="saytext" name="saytext" style="width: 600px;height: 90px;">

                        </textarea></div>
                        <button type="button" class="btn btn-primary sub_btn" style="float: right;">
                            发送
                        </button>
                
            </div>
          </div>
    </div>
    <div class="mt-4">
            <p class=" text-center text-muted">刘看山·知乎指南·知乎协议·应用·工作·联系我们 © 2019 知乎</p>
    </div>

</body>

</html>