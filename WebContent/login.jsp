<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="common/tool/layui/css/layui.css">
    <script src=" https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"> </script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
     <script src="common/tool/js/jquery-1.9.0.min.js"></script>
     <script src="common/tool/js/md5.js"></script>
    <script src="common/tool/js/jquery.toggle-password.js"></script>
    <style>
        .change::-webkit-input-placeholder {
                    color: red;
            }
        .container-fluid {
            width: 450px;
            height: 500px;
            position: relative;
            margin-top: 50px;
            background: white;
        }
        
        input[type="text"]:focus {
            outline: none;
            border: 0;
        }

        .input {
            BORDER-TOP-STYLE: none;
            BORDER-RIGHT-STYLE: none;
            BORDER-LEFT-STYLE: none;
            BORDER-BOTTOM-STYLE: solid rgb(0, 0, 0);
            width: 400px;
            height: 50px;
        }

        #login {
            width: 400px;
        }

        .foot {

            width: 400px;
            height: 20px;

        }

        .input-val {
            width: 300px;
            height: 32px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        #canvas {
            vertical-align: middle;
            box-sizing: border-box;
            border: 1px solid #ddd;
            cursor: pointer;
        }

        .btn {
            display: block;
            margin-top: 20px;
            height: 32px;
            width: 100px;
            font-size: 16px;
            color: #fff;
            background-color: #457adb;
            border: none;
            border-radius: 50px;
        }
    </style>
    <script>
        $(function () {
            $('#password').togglePassword({
                el: '#togglePassword'
            });
            $('#username').focus(function(){
                $(this).attr('placeholder','手机号或邮箱');
                $(this).removeClass("change");
            });
            $('#username').blur(function(){
                $(this).attr('placeholder','请输入手机号或邮箱');
                $(this).addClass("change");
            });
            $('#password').focus(function(){
                $(this).attr('placeholder','密码');
                $(this).removeClass("change");
            });
            $('#password').blur(function(){
                $(this).attr('placeholder','请输入密码');
                $(this).addClass("change");
            });
            var show_num = [];
            draw(show_num);
            $("#canvas").on('click', function () {
                draw(show_num);
            });
            $(".btn").on('click', function () {
                var username=$("#username").val();
                var password=$("#password").val();
                var val = $(".input-val").val().toLowerCase();
                var num = show_num.join("");
                if(username==''){
                    $('#username').attr('placeholder',"请输入手机号或邮箱");
                    $('#username').addClass("change");
                }
                if(password==''){
                    $('#password').attr('placeholder',"请输入密码");
                    $('#password').addClass("change");
                }
                if (val == '') {
                    flag=false;
                    $('#label').text('请输入验证码');             
                } else if (val == num) {
                    flag=true;
                    if(username==''||password==''){
                        return false;
                    }

//                    发送给后端处理
                    $(".input-val").val('');
                    $.post("login.do",
        				    {
                    	'username':username,
                    	'password':md5(password)
        				    },
        				        function(data,status){
        				        alert(data);
        				        if(data=="登录成功"){
        				        	window.location.href="homePage";
        				        }
        				    });
                     /* $.ajax({
                       type:'post',
                       data:{'username':username,'password':md5('password')},
                       url:"login.do",
                       success:function(result){
							alert(result)
                       } 
                    });  */
                
                } else {
                    flag=false;
                    $('#label').text('验证码错误！请重新输入！');                   
                    $(".input-val").val('');
                    draw(show_num);
                    $('#login').attr('disabled',false);
                }

            })

        });
        //生成并渲染出验证码图形
        function draw(show_num) {
            var canvas_width = $('#canvas').width();
            var canvas_height = $('#canvas').height();
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

<body background="common/image/bg.jpg">
    <div class="container-fluid" align="center">
        <div class="logo">
            <h1 class="text-primary">知乎</h1><br />
            <h4 class="text-primary mt-3">登录知乎，发现更多可信赖的解答</h4>
            <form class="mt-5">
                <input type="text" class="input" id="username" placeholder="手机号或邮箱" ><br />
                <input type="password" class="input mt-2" id="password" placeholder="密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入密码'"><br />
                <p><input type="checkbox" id="togglePassword" class="mt-2"><label for="togglePassword">显示密码</label></p>
                <div class="code">
                    <input type="text" value="" placeholder="请输入验证码（不区分大小写）" class="input-val">
                    <canvas id="canvas" width="100" height="30"></canvas>
                </div>
                <lable class="col-sm-2" id="label" style="color:red"></lable>
                <button type="button" class="btn btn-primary" id="login" onlick="sub()">登录</button>
            </form>
        </div>
        <div class="foot mt-3">
            <p>没有账号？<a href="register.jsp">注册</a></p>
            
        </div>
    </div>
</body>

</html>