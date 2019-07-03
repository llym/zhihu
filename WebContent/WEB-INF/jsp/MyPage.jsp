<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
</head>
<style type="text/css">
.main-body{
    margin-left: 12%;
    margin-right: 12%;
}
.id-img{
 float: left;
}
.myAction{
    float: left;   
}
.focus{
    margin-left: 70%;
    margin-top: 12%;
}
</style>

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
    <div class="dropdown-divider "></div>
    <div class="main-body mt-4" align="center">

        <div class="h-75">
            <div class="h-25">
                <input type="file" accept="image/gif,image/jpg,image/png" class=" col-sm-12 " >
                <a href="file://C:Program Files" >                
                </a>
            </div>
            <div class="col-sm-12">
                    <img  class="col-sm-2" style="float: left" src="/common/image/xl.jpg">
                    <label class="con-sm-6">虾米</label>
                    <button type="button" class="col-sm-3 btn btn-outline-primary" style="float: right">编辑个人资料</button>
             </div>
        </div>
         <div>
        <div class="container col-sm-12 myAction mt-4">
            <div class="row">
            <div class="col-sm-8">
                    <nav class="navbar navbar-expand-sm bg-light">
                            <ul class="navbar-nav">
                              <li class="nav-item">
                                <a class="nav-link" href="#">动态</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="#">回答</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="#">提问</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="#">文章</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">专栏</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">想法</a>
                                </li>
                                <li class="nav-item">
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                            更多
                                        </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">收藏</a>
                                                <a class="dropdown-item" href="#">关注</a>
                                            </div>
                                    </div>
                                </li>
                            </ul>
                    <nav>            
            </div>
        </div>
        <div class="col-sm-8 myAction">
            <div class="dropdown-divider "></div>
            <label>我的动态</label>
            <div class="dropdown-divider "></div>
        </div>  
        </div>
    </div>
    <div class="col-sm-4 focus">
            <div style="background-color:aquamarine">
                <a href="#">关注了</a>
            </div>
            <div  style="background-color:chocolate">
                <a href="#">关注者</a>
            </div>
    </div> 
    </div> 
    

</body>
</html>