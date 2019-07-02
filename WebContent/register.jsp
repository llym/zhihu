<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" 
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</script>
<style type="text/css">
body{
  background-image:url(common/image/register-img.jpg);
    background-size:100%;
    background-attachment:fixed;
}

.myform{
    background-color: white;
    width: 36%;
    margin-left: 30%;
    
  }
  
    #canvas {
    vertical-align: middle;
    box-sizing: border-box;
    border: 1px solid #ddd;
    cursor: pointer;
    }

    .change::-webkit-input-placeholder {
      color: red;
}  
</style>

<script type="text/javascript" src="common/tool/js/jquery-1.9.0.min.js" ></script>
<script>
 $(function(){
  var show_num = [];
  draw(show_num);
  $("#canvas").on('click',function(){
   draw(show_num);
  })
  $(".btn1").on('click',function(){
   var telnum=$("#telnum").val();//手机号
   var password1=$("#password1").val();
   var password2=$("#password2").val();
   var checkval = $("#checkval").val();//验证码
   var num = show_num.join("");
   if(telnum==""){
      $('#telnum').attr('placeholder',"请输入手机号");
      $('#telnum').addClass("change");
   }
   if(password1==""){
      $('#password1').attr('placeholder',"请输入密码");
      $('#password1').addClass("change");
   }
   if(password2==""){
      $('#password2').attr('placeholder',"请确认密码");
      $('#password2').addClass("change");
   }
   if(checkval==""){
      $('#checkval').attr('placeholder',"请输入验证码");
      $('#checkval').addClass("change");
   }
   if(password1!=password2){
	   $('#label').text('确认密码不正确');
   }
  else if(checkval == num&&password1==password2){
    $.ajax({
      type:"post",
      url:"register.do",
      data:{
        'telnum':telnum,
        'password':password2
      },
      success:function(result){
    	  
        alert("注册成功")
      }
    });
   }else{
    $('#label').text('验证码错误！请重新输入！');
    draw(show_num);
    $(".input-val").val('');
    // draw(show_num);
   }
  })
 })
 //生成并渲染出验证码图形
 function draw(show_num) {
  var canvas_width=$('#canvas').width();
  var canvas_height=$('#canvas').height();
  var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
  var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
  canvas.width = canvas_width;
  canvas.height = canvas_height;
  var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
  var aCode = sCode.split(",");
  var aLength = aCode.length;//获取到数组的长度
  for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
   var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
   // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
   var deg = Math.random() - 0.5; //产生一个随机弧度
   var txt = aCode[j];//得到随机的一个内容
   show_num[i] = txt.toLowerCase();
   var x = 10 + i * 20;//文字在canvas上的x坐标
   var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
   context.font = "bold 23px 微软雅黑";
   context.translate(x, y);
   context.rotate(deg);
   context.fillStyle = randomColor();
   context.fillText(txt, 0, 0);
   context.rotate(-deg);
   context.translate(-x, -y);
  }
  for (var i = 0; i <= 5; i++) { //验证码上显示线条
   context.strokeStyle = randomColor();
   context.beginPath();
   context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
   context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
   context.stroke();
  }
  for (var i = 0; i <= 30; i++) { //验证码上显示小点
   context.strokeStyle = randomColor();
   context.beginPath();
   var x = Math.random() * canvas_width;
   var y = Math.random() * canvas_height;
   context.moveTo(x, y);
   context.lineTo(x + 1, y + 1);
   context.stroke();
  }
 }
 //得到随机的颜色值
 function randomColor() {
  var r = Math.floor(Math.random() * 256);
  var g = Math.floor(Math.random() * 256);
  var b = Math.floor(Math.random() * 256);
  return "rgb(" + r + "," + g + "," + b + ")";
 }
</script>
</head>
<body>
 
<div class="myform mt-5" align="center" >
	<h1 class="display-4"><p class="text-primary" >知乎</p></h1>
	<h3><small><p class="text-primary">注册知乎，发现更多可信赖的解答</p></small></h3>
	
	<form action="#" method="post">
    <div class="input-group col-sm-10 mt-5">
      <div class="input-group-prepend">
        <button type="button" class=" btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
          	中国+86
        </button>
        <div class="dropdown-menu">
        <c:forEach items="${users}" var="user" >	
			<a class="dropdown-item" >${user.username}</a>	
		</c:forEach>
        </div>
      </div>
      <input type="text" id="telnum" class="form-control tel-val" placeholder="手机号">  
    </div>
    <div class="col-sm-10 mt-5">
        <div class="input-group-prepend">
             <input type="password" id="password1" class="form-control input-val" value="" placeholder="请输入密码">
          </div>   
     </div>
     <div class="col-sm-10 mt-5">
        <div class="input-group-prepend">      
             <input type="password" id="password2" class="form-control input-val" value="" placeholder="确认密码">
          </div>   
     </div>
    <div class="col-sm-10 mt-5">
       <div class="input-group-prepend">
            <input type="text" id="checkval" class="form-control input-val" value="" placeholder="请输入验证码（不区分大小写）">
            <canvas id="canvas" width="100" height="30"></canvas>
         </div>   
    </div>
    <label class="col-sm-10" id="label" style="color: red"></label>
    <button type="button" class="btn1 btn btn-primary col-sm-10 mt-5" onclick="register()">
    	注册
    </button>
  </form>
  <p class="mt-5">注册即代表同意《知乎协议》《隐私保护指引》<a href="#">注册机构号</a></p>
  <div class="mt-5 mb-2"><p>已有账号？<a href="#">登录</a></p></div>
</div>
</body>
</html>