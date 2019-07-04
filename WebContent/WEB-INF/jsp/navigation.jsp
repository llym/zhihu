<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-white navbar-white justify-content-center ">
        <a class="navbar-brand text-primary text-lg" href="#">知乎</a>
        <ul class="nav  ml-5 mr-5">
            <li class="nav-item"><a class="nav-link active font-weight-bold" href="#">首页</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">发现</a></li>
            <li class="nav-item"><a class="nav-link" href="#">等你来答</a></li>
            </li>
        </ul>
        <form class="form-inline">
           <div class="input-group">
      			<input type="text" class="form-control" placeholder="Search">
      			
      			<div class="input-group-prepend">
      				<button class="input-group-text" id="basic-addon1">
      				<i class="layui-icon layui-icon-search" style="font-size: 16px; color: #1E9FFF;"></i>
					</button>
    			</div>
    			
    		</div>
            
        </form>
        <button class="btn btn-primary ml-2" type="button">提问</button>
        <ul class="nav">
            <li class="nav-item"><input type="image" class="ml-5" src='common/image/message.png' style="
                width:30px;height:30px;" /></li>
            <li class="nav-item"><input type="image" class="ml-5" src='common/image/letter.png' style="
                width:30px;height:30px;" /></li>
            <li class="nav-item dropdown">
                <input type="image" class="ml-5 dropdown-toggle" data-toggle="dropdown" src="common/image/sculpture.jpg" style="
                width:30px;height:30px;" />
                <div class="dropdown-menu">
                        <a class="dropdown-item" href="#"><input type="image" src="common/image/my.png" style="
                        width:20px;height:20px;">&nbsp;&nbsp;我的主页</a>
                        <a class="dropdown-item" href="#"><input type="image" src="common/image/setting.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;设置</a>
                        <a class="dropdown-item" href="#"><input type="image" src="common/image/out.png" style="
                            width:20px;height:20px;">&nbsp;&nbsp;退出</a>
                </div>
            </li>
        </ul>
    </nav>
</body>
</html>