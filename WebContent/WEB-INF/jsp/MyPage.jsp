<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的主页</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" 
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
.myface{
    height: 200px;
    width: 1000px;   
}
.face{
    position: absolute;
    top:160px;
}
.name{
    position: absolute;
    left:480px;
    top:300px;
}
.edit{
    position: relative;
    left: 400px;
    top:10px;
}
.content{
    position: relative;
    height: 500px;
    top: 200px;
    left: 50px;
}
.normalFace{
    width: 240px;
    height: 240px;
    background-size:cover;
    display:block; 
    border-radius:120px;
    -webkit-border-radius:120px;
    -moz-border-radius:120px
}
</style>
<script type="text/javascript">
    function fileSelect() {
        document.getElementById("fileToUpload").click(); 
    }
    
    function fileSelected() {
      // 文件选择后触发次函数
    }
    function fold(){
        var val=$('#change-text').text();       
        if(val=="﹀ 查看详细资料"){
            $('#change-text').text('︿ 收起详细资料');
        }
        else {
            $('#change-text').text('﹀ 查看详细资料');
        }
    }
    $(function(){
        var val=$('.visi-menu').text();;
        
        $('.search-menu a').click(function(){
            $(this).parent().each(function(){//移除其余非典中的状态
                $('.search-menu a').removeClass("visi-menu");
            });
            var val1=$(this).text();
                $('.visi-menu').text(val1);//把选中的值赋给当前值
            $(this).addClass("visi-menu");//给所点击中的增加样式
        })
    });
  </script>

</head>
<body style="background-color: #F6F6F6">
        <!--导航栏-->
        <div class="dropdown-divider "></div>
    <br>
<div class="container">
    <!--个人主页封面-->
    <div class="ml-5">
        <p><img class="myface" src="common/image/id-img.jpg" onclick="fileSelect();"></p>
        <form id="form_face" enctype="multipart/form-data" style="width:auto;">
            <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();" style="display:none;">
        </form>
    </div>
    <div >
    <!--个人主页头像-->
    <div class="face ml-5">
            <p><img class="normalFace ml-5" src="common/image/idImg.jpg" onclick="fileSelect();"></p>
            <form id="form_face" enctype="multipart/form-data" style="width:auto;">
             <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();" style="display:none;">
            </form>
    </div>
    <div class="name" >
        <span class="font-weight-bold"><h3>虾米</h3></span>
        <div id="demo" class="collapse"><p class="font-weight-bold">所在的行业</p></div>
        <a href="#demo" id="change-text" data-toggle="collapse" onclick="fold()">﹀ 查看详细资料</a>
        <a class="btn btn-outline-primary edit" href="#">编辑个人资料</a>
    </div>
    </div>       
</div>
<div class="container content">
    <div class="row">
    <div class="dropdown-divider "></div> 
    <div class="col-sm-8" style="background-color: white;height: 500px;">
            <nav class="navbar navbar-expand-sm bg-light">
                    <ul class="nav nva-tabs" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#MyAction">动态&nbsp;&nbsp;</a>
                      </li>
                      <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#MyAnswer">回答&nbsp;<span>0&nbsp;&nbsp;</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#MyQuestion">提问&nbsp;<span>0&nbsp;&nbsp;</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#MyArticle">文章&nbsp;<span>0&nbsp;&nbsp;</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#MyColumn">专栏&nbsp;<span>0&nbsp;&nbsp;</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#MyIdea">想法&nbsp;<span>0&nbsp;&nbsp;</span></a>
                        </li>
                        <li class="nav-item">
                            <div class="dropdown">
                                <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                    更多
                                </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" data-toggle="tab" href="#MyCollect">收藏</a>
                                        <a class="dropdown-item" data-toggle="tab" href="#MyFocus">关注</a>
                                    </div>
                            </div>
                        </li>
                    </ul>
                </nav> 
                <div class="dropdown-divider "></div>
                <div class="tab-content">
                <div id="MyAction" class="container tab-pane active " >                        
                    <h5 class="ml-3 ">我的动态</h5>                        
                </div>
                <div id="MyAnswer" class="container tab-pane fade">                        
                    <h5 class="ml-3">我的回答</h5>                        
                </div>
                <div id="MyQuestion" class=" container tab-pane fade">                        
                    <h5 class="ml-3">我的提问</h5>                        
                </div>
                <div id="MyArticle" class="container tab-pane fade">                        
                    <h5 class="ml-3">我的文章</h5>                        
                </div>
                <div id="MyColumn" class="container tab-pane fade">                        
                    <h5 class="ml-3">我的专栏</h5>                        
                </div>
                <div id="MyIdea" class="container tab-pane fade">                        
                    <h5 class="ml-3">我的想法</h5>                        
                </div>
                <div id="MyCollect" class="container tab-pane fade">                        
                    <h5 class="ml-3">我的收藏夹</h5>                        
                </div>
                <div id="MyFocus" class="container tab-pane fade">                        
                    <nav class="navbar navbar-expand-sm bg-light "> 
                        <!-- Links -->
                        <ul class="nav nva-tabs" role="tablist">
                          <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#MyFocusP">我关注的人</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#FcMe">关注我的人</a>
                          </li>
                          <li class="nav-item">
                                <div class="dropdown">
                                        <a class="nav-link dropdown-toggle visi-menu" href="" data-toggle="dropdown">
                                                我关注的专栏</a>
                                        <div class="dropdown-menu search-menu" id="menu2">
                                          <a  class="dropdown-item" data-toggle="tab" href="#MyFC">我关注的专栏</a>
                                          <a  class="dropdown-item" data-toggle="tab" href="#Mytop">我关注的话题</a>
                                          <a  class="dropdown-item" data-toggle="tab" href="#MyFQ">我关注的问题</a>
                                          <a  class="dropdown-item" data-toggle="tab"  href="#Mycll">我关注的收藏</a>
                                        </div>
                                      </div>
                          </li>
                        </ul>                       
                      </nav>
                      <div class="tab-content">
                        <div id="MyFocusP" class="container tab-pane active " >                        
                                  <!--我关注的人-->  
                                  <h1>111</h1>            
                        </div>
                        <div id="FcMe" class="container tab-pane fade">                        
                            <!--关注我的人-->  
                            <h1>222</h1>                   
                        </div>
                        <div id="MyFC" class=" container tab-pane fade">                        
                                   <!--我关注的专栏--> 
                                   <h1>333</h1>               
                        </div>
                        <div id="Mytop" class="container tab-pane fade">                        
                                <!--我关注的话题--> 
                                <h1>444</h1>                 
                        </div>
                        <div id="MyFQ" class="container tab-pane fade">                        
                                    <!--我关注的问题--> 
                                    <h1>555</h1>                
                        </div>
                        <div id="Mycll" class="container tab-pane fade">                        
                                   <!--我关注的收藏-->
                                   <h1>666</h1>                 
                        </div>
                      </div>                                              
                </div> 
            </div>
    </div>
    <div class="col-sm-3 ml-4">
        <div class="row" style="height: 80px;">
            <div class="col-sm-6 text-center pt-3" style="background-color:white;border-right:solid 1px #F6F6F6;">
                <a  href="#">关注了</a><br/>
                <sapn>0</sapn>
            </div>
            <div class="col-sm-6  text-center pt-3" style="background-color:white">
                    <a href="#">关注者</a><br/>
                    <span>0</span>
                </div>
            </div>
        <div class="mt-2 text-left">
            <nav class="navbar navbar-expand-sm bg-light">
                <ul class="nav flex-column nva-tabs text-left" role="tablist">
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#Mytop">关注的话题<span class="ml-5 ml-2">0</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#MyFC">关注的专栏<span class="ml-5">0</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">关注的问题<span class="ml-5">0</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="#Mycll">关注的收藏<span class="ml-5">0</span></a>
                </li>
                <li class="nav-item">
                        <a class="nav-link disabled text-primary">主页被浏览<span>0</span>次</a>
                      </li>
              </ul>
            </nav>
        </div>
        <div style="height: 400px">
            <p class="font-weight-light text-primary">
                    刘看山.知乎指南.知乎协议知乎隐私保护指引<br>
                    应用.工作.申请开通知乎机构号<br>
                    侵权举报.网上有害信息举报专区<br>
                    违法和不良信息举报：010-82716601<br>
                    儿童色情信息举报专区<br>
                    证照中心<br>
                    联系我们 © 2019 知乎<br/>
            </p>
        </div> 
    </div>
    <div class="col-sm-1"></div>
</div>
</div>

</body>
</html>