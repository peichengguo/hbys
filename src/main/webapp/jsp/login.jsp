<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆</title>
<link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath }/static/css/signin.css" rel="stylesheet">
<link href="${contextPath }/static/css/main.css" rel="stylesheet">
</head>
<body>
	<header id="header" role="banner">
		<jsp:include page="header.jsp"/>
	</header>
	<div class="container" style="margin-top: 40px;">
		
      <form id="login_form" class="form-horizontal" action="#" method="post">
        <h2 class="text-center">填写您的账号和密码</h2>
        <br/>
        <div class="form-group">
        	<label for="iphone" class="col-sm-4 control-label">手机号码</label>
	        <div class="col-sm-4">
	        <input type="number" id="iphone" name="iphone" class="form-control" placeholder="手机号码" required/>
	        </div>
	    </div>
	    <br/>
	    <div class="form-group">
        	<label for="password" class="col-sm-4 control-label">登陆密码</label>
	        <div class="col-sm-4">
        		<input type="password" id="password" name="password" class="form-control" placeholder="登陆密码" required>
        	</div>
        </div>
        <div class="form-group">
        	<label  class="col-sm-4 control-label"></label>
	        <div class="col-sm-4">
        		<div id="pwd_tips" class="alert alert-danger" role="alert" style="display:none">
			        <strong>账号或密码不正确</strong>
			    </div>
			    <div id="pwd_tips1" class="alert alert-danger" role="alert" style="display:none">
			        <strong>账号已失效，请联系管理员！</strong>
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
        	<label for="iphone" class="col-sm-4 control-label"></label>
	        <div class="col-sm-4">
        		<button class="btn btn-lg btn-primary btn-block " type="button" onclick="pass()">登陆</button>
        	</div>
        </div>
      </form>

    </div> <!-- /container -->


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
	var _val=$("#valid").val();
	
	if(_val.toUpperCase()==return_str){
		$("#valid_tips").css("display","none");
		//$("#login_formt").submit();
		$.ajax({
			url:"${contextPath }/login.jspx",
			data:{iphone:$("#iphone").val(),password:$("#password").val()},
			async:false,
			dataType:'json',
			success:function(data){
				if(data == "1"){
					$("#pwd_tips").css("display","none");
					window.location.href = "${contextPath }/index.jspx";
				}else if(data == "-1"){
					$("#pwd_tips").css("display","none");
					$("#pwd_tips1").css("display","block");
				}else{
					$("#pwd_tips1").css("display","none");
					$("#pwd_tips").css("display","block");
				}
			}
		});
	}else{
		$("#valid_tips").css("display","block");
		return;
	};
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