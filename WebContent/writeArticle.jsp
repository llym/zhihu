<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>写文章</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" 
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<style type="text/css">
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
</style>

<script src="common/tool/assets/jquery.min.js"></script>
<script src="common/tool/assets/trumbowyg.js"></script>
<script src="common/tool/assets/plugins/base64/trumbowyg.base64.js"></script>
<link rel="stylesheet" href="common/tool/assets/design/css/trumbowyg.css">

<script type="text/javascript">
 function fileSelect() {
        document.getElementById("fileToUpload").click(); 
    }
    
    function fileSelected() {
      // 文件选择后触发次函数
    }
  $(document).ready(function() {//设置标题字数超过50个字弹窗提醒
    $("#inputId").keyup(function() {
      if ($.trim(this.value).length > 50) { 
        alert("输入字符大于50个,请重新输入!");
    }
});
});
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
</head>
<body>
   <!--导航栏--> 
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link text-primary " style="margin-left:200px;border-right:solid 1px #F6F6F6;" href="#"><h2>知乎</h2></a>
    </li>
    <li class="nav-item">
      <a class="nav-link mt-3" href="#">写文章</a>
    </li>
    <li class="nav-item">
      
      <div class="dropdown">
          <button  type="button" class="nav-link btn btn-outline-primary dropdown-toggle mt-3" 
          style="margin-left:600px" data-toggle="dropdown" href="#">发布</button>
          <div class="dropdown-menu" style="height: 340px;width: 320px; margin-right: 200px">
            <h4 class="ml-3">发布文章</h4>
            <p class="font-weight-light">绑定适合的话题，能方便分类检索，文章也更容易让读者发现。</p>
            <div><img style="height: 30px;width: 30px;" src="common/image/search.png">
            <input type="text" placeholder="搜索话题..." style="border:0; width: 270px;"></input>
          </div>
          <div class="dropdown-divider "></div>
          <button class="btn btn-outline-primary" style="margin-top: 120px;margin-left: 220px">下一步</button>
            
          </div>
        </div>
    </li>
    <li class="nav-item">
      <div class="dropdown">
        <img src="common/image/ellipsis.png" class="dropdown-toggle ml-4 mt-3" style="height: 40px;width: 40px;" data-toggle="dropdown">
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">草稿</a>
          <a class="dropdown-item" href="#">我的文章</a>
          <a class="dropdown-item" href="#">专栏.发现</a>
        </div>
      </div>
    </li>
  </ul>
  <div class="dropdown-divider "></div>

<!--*******************正文***************************-->
<div class="content">
  <div class="mt-5" style="height: 200px;background-color: #F6F6F6" data-toggle="collapse" 
  data-target="#bg-img" data-toggle="tooltip" data-placement="bottom" title="添加题图" onclick="fileSelect();">
  <img style="margin-left: 330px;margin-top:80px;height: 50px;width: 50px;" src="common/image/camera-fill.png"/>
    <div>
        <p><img class="myface"  src="" onclick="fileSelect();"></p>
        <form id="form_face" enctype="multipart/form-data" style="width:auto;">
            <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();" style="display:none;">
        </form>
    </div>
  </div>
  <div>
      <input type="text" id="inputId" maxlength=50 placeholder="请输入标题（最多50个字）" 
      style="border:0;height: 80px; width: 600px;font-size: 2rem;font-weight:bold" />
    <div class="dropdown-divider "></div>
  </div>
    <div id="odiv" style="display:none;position:absolute;z-index:100;">
        <img src="common/tool/assets/pic/sx.png" title="缩小" border="0" alt="缩小" onclick="sub(-1);"/>
        <img src="common/tool/assets/pic/fd.png" title="放大" border="0" alt="放大" onclick="sub(1)"/>
        <img src="common/tool/assets/pic/cz.png" title="重置" border="0" alt="重置" onclick="sub(0)"/>
        <img src="common/tool/assets/pic/sc.png" title="删除" border="0" alt="删除" onclick="del();odiv.style.display='none';"/>
    </div>
    <div onmousedown="show_element(event)" style="clear:both" id="customized-buttonpane" class="editor"></div>

</div>
</body>
</html>