<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
    <link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath }/static/css/signin.css" rel="stylesheet">
    <link href="${contextPath }/static/css/main.css" rel="stylesheet">
    <style type="text/css">
        .theme-popover-mask {
            z-index: 9998;
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background:#000;
            opacity:0.4;
            filter:alpha(opacity=40);
            display:none
        }
        .theme-popover {
            z-index:9999;
            position:fixed;
            top:50%;
            left:50%;
            width:600px;
            height:300px;
            margin:-180px 0 0 -330px;
            border-radius:5px;
            border:solid 2px #666;
            background-color:#fff;
            display:none;
            box-shadow: 0 0 10px #666;
        }

    </style>
</head>
<body>
	<header id="header" role="banner">
		<jsp:include page="header.jsp"/>
	</header>
	<div class="container" style="margin-top: 40px;">
		
      <form id="updatePass_form" class="form-horizontal" action="#" method="post">
        <h2 class="text-center">修改您的密码信息</h2>
        <input type="hidden" id="id" name="id" value="${id}"/>
	    <br/>
	    <div class="form-group">
        	<label for="password" class="col-sm-4 control-label">旧密码</label>
	        <div class="col-sm-4">
        		<input type="password" id="password" name="password" class="form-control" placeholder="登陆密码" required>
        	</div>
        </div>
          <div class="form-group">
              <label for="password" class="col-sm-4 control-label">新密码</label>
              <div class="col-sm-4">
                  <input type="password" id="new_password" name="newPassword" class="form-control" placeholder="登陆密码" required>
              </div>
          </div>
          <div class="form-group">
              <label for="password" class="col-sm-4 control-label">确认新密码</label>
              <div class="col-sm-4">
                  <input type="password" id="new_password_enter" class="form-control" placeholder="登陆密码" required>
              </div>
          </div>
        <div class="form-group">
        	<label  class="col-sm-4 control-label"></label>
	        <div class="col-sm-4">
        		<div id="pwd_tips" class="alert alert-danger" role="alert" style="display:none">
			        <strong>旧密码输入不正确！</strong>
			    </div>
        	</div>
        </div>
        
        <div class="form-group">
        	<label for="valid" class="col-sm-4 control-label"></label>
	        <div class="col-sm-4">
	        <div style="float:left">
	        	<input type="text" id="valid" class="form-control" style="width:130px" placeholder="验证码" required>
	        </div>
	        <div style="float:left; padding-left:30px;" onclick="can_click()" >
	        	<canvas id="myCanvas" height="40px" width="110px">your browser does not support the canvas tag </canvas>
	        </div>
        </div>
        </div>
        <div class="form-group">
        	<label  class="col-sm-4 control-label"></label>
	        <div class="col-sm-4">
        		<div id="valid_tips" class="alert alert-danger" role="alert" style="display:none">
			        <strong>验证码不正确</strong>
			    </div>
        	</div>
        </div>
        
        <div class="form-group">
        	<label for="" class="col-sm-4 control-label"></label>
	        <div class="col-sm-4">
        		<button class="btn btn-lg btn-primary btn-block " type="button" onclick="pass()">修改</button>
        	</div>
        </div>
      </form>

    </div> <!-- /container -->

    <div class="theme-popover">
        <h2 class="text-center" style="color:red">恭喜您，${msg }成功！</h2>
        <br/>
        <h3 class="text-center"><a href="javascript:void(0)" style="" onclick="toUserInfo()">[进入网站首页]</a></h3>
        <br/><br/>
        <h3 class="text-center"><a href="javascript:void(0)" style="" onclick="currPage()">[留在当页]</a></h3>
        <!-- <div class="form-group">
            <label for="address" class="col-sm-4 control-label"></label>
            <div class="col-sm-4">
                <button class="btn btn-lg btn-primary btn-block" type="button" onclick="toUserInfo()">确定</button>
            </div>
        </div> -->
    </div>
    <div class="theme-popover-mask"></div>

<script src="${contextPath }/static/js/jquery.js"></script>
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
var canvas=$("#myCanvas").get(0);
var _canvas=$("#myCanvas").get(0).getContext("2d");
var return_str="";
var _ifstart=false;
var _B_x=0;
var _B_y=0;
function can_click(){
	start();
};
function pass(){

    isSamePass();
	var _val=$("#valid").val();
	
	if(_val.toUpperCase()==return_str){
        $("#valid_tips").css("display","none");
        //显示遮罩层
        $('.theme-popover-mask').fadeIn(100);

		$.ajax({
			url:"${contextPath }/update_pass.jspx",
			data:{id:$("#id").val(),password:$("#password").val(),newPassword:$("#new_password").val()},
			async:false,
			dataType:'json',
			success:function(data){
				if(data == "1"){
					$("#pwd_tips").css("display","none");
                    //显示提示框
                    $('.theme-popover').slideDown(200);
				}else if(data == "-1"){
                    $("#pwd_tips").html("<strong>旧密码输入的不正确！</strong>");
                    $("#pwd_tips").css("display","block");
                    //隐藏遮罩层
                    $('.theme-popover-mask').fadeOut(100);
                }else{
                    $("#pwd_tips").html("<strong>修改失败，稍后再试！</strong>");
                    $("#pwd_tips").css("display","block");
                    //隐藏遮罩层
                    $('.theme-popover-mask').fadeOut(100);
				}
			}
		});
	}else{
		$("#valid_tips").css("display","block");
		return;
	};
}

//验证
function isSamePass(){

    //俩次密码是否输入一值
    if($("#password").val() == $("#new_password").val()){
        $("#pwd_tips").html("<strong>新密码不能与旧的密码相同！</strong>");
        $("#pwd_tips").css("display","block");
        return;
    }
    //是否与原密码相同
    if($("#new_password").val() != $("#new_password_enter").val()){
        $("#pwd_tips").html("<strong>新密码输入俩次不一致！</strong>");
        $("#pwd_tips").css("display","block");
        return;
    }
    $("#pwd_tips").css("display","none");

}

function start(){
	try{
		function drawscreen(){
			_canvas.fillStyle="#fff";
			_canvas.fillRect(0,0,100,35);	
			_canvas.strokeStyle="#fff";
			
		};
		function write_text(_str){
			_canvas.fillStyle="#000000";
			_canvas.font="20px 新宋体";
			_canvas.textBaseline="top";
			_canvas.fillText(_str,15,10);
		};
		function getabc(){
			var _str="A,B,C,D,E,F,G,H,J,K,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
			var _str_array=_str.split(",");
			return_str="";
			for(i=0;i<4;i++){
				var _rnd=Math.floor(Math.random()*_str_array.length);
				return_str+=_str_array[_rnd];
			};
		};
		drawscreen();
		getabc();
		write_text(return_str);
	}catch(e){
		alert(e);	
	}
};

//进入首页
function toUserInfo(){
    window.location.href= "${contextPath }/index.jspx";
}

//留在当页
function currPage(){
    window.location.reload();
}

$(document).ready(function(e) {
	start();
	//$("#header").load("to_header.jspx");
	
	document.onkeydown=function(event){
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if(e && e.keyCode==13){ // enter 键
		//要做的事情
			pass();
		}
	};
});
</script>
</body>

</html>