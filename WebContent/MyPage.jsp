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
    top: 150px;
    left: 50px;
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
  </script>

</head>
<body style="background-color: #F6F6F6">
        <!--引用导航栏-->
    
        <div class="dropdown-divider "></div>
    </nav>
    <br>
<div class="container">
    <!--个人主页封面-->
    <div class="ml-5">
        <p><img class="myface" src="common/image/rg.jpg" onclick="fileSelect();"></p>
        <form id="form_face" enctype="multipart/form-data" style="width:auto;">
            <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();" style="display:none;">
        </form>
    </div>
    <div >
    <!--个人主页头像-->
    <div class="face ml-5">
            <p><img class="normalFace ml-5" src="common/image/xl.jpg" onclick="fileSelect();"></p>
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
    <div class="col-sm-8">
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
                    <nav class="navbar navbar-expand-sm bg-light">
 
                        <!-- Links -->
                        <ul class="navbar-nav">
                          <li class="nav-item">
                            <a class="nav-link" href="#">我关注的人</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#">关注我的人</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#">我关注的专栏</a>
                          </li>
                        </ul>
                       
                      </nav>                        
                </div>
            </div>
                <div class="dropdown-divider "></div>
    </div>
    <div class="col-sm-3">
        <div class="row">
            <div class="col-sm-6 " style="background-color:white">
                <a  href="#">关注了</a>
            </div>
            <div class="col-sm-6 " style="background-color:white">
                    <a href="#">关注者</a>
                </div>
            </div>
            
    </div>
    <div class="col-sm-1"></div>
</div>
</div>

</body>
</html>