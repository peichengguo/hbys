<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath }/static/css/signin.css" rel="stylesheet">
<link href="${contextPath }/static/css/main.css" rel="stylesheet">
<link href="${contextPath }/static/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/static/css/datetimepicker.css" rel="stylesheet">
<link href="${contextPath }/static/css/date-self.css" rel="stylesheet">
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
	.theme-popover-img {
		z-index:9999;
		position:fixed;
		top:43%;
		left:50%;
		width:500px;
		height:530px;
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
	<div class="container"  style="margin-top:30px">
				
      <form id="register_form" class="form-horizontal" action="#" method="post" onsubmit="return pass()">
        <h2 class="text-center">填写您真实有效信息</h2>
        <input type="hidden" id="id" name="id" value="${u.id }">
        <input type="hidden" name="state" value="${u.state }">
		<div class="row">
		  <div class="col-md-6">
		  	<div class="form-group">
	        	<label for="iphone" class="col-sm-6 control-label">手机号码</label>
	        	<div class="col-sm-6">
	        		<input type="number" id="iphone" name="iphone" value="${u.iphone }"  class="form-control" placeholder="手机号码" required onkeyup="validPhone()"/>
	        	</div>
	        </div>
	        
	        <div id="phone_valid_tips" class="alert alert-danger" role="alert" style="display:none">
		        <strong>该手机号已经被注册！</strong>
		    </div>
	        
	        <div class="form-group">
	        	<label for="name" class="col-sm-6 control-label">真实姓名</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="name" name="name" value="${u.name }"  class="form-control" placeholder="真实姓名" required>
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="address" class="col-sm-6 control-label">籍贯</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="address" name="address" value="${u.address }" class="form-control" placeholder="籍贯" required>
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="specialty" class="col-sm-6 control-label">执业类别</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="specialty" name="specialty" value="${u.specialty }" class="form-control" placeholder="执业类别" required>
	        	</div>
	        </div>
	        <c:if test="${update_user != 'update_user' }">
	        <div class="form-group">
	        	<label for="password" class="col-sm-6 control-label">登陆密码</label>
	        	<div class="col-sm-6">
	        		<input type="password" id="password" name="password" class="form-control" placeholder="登陆密码" required>
	        	</div>
	        </div>
	        </c:if>
	        
	      </div>
		  <div class="col-md-6">
		  	<div class="form-group">
	        	<label for="sex" class="col-sm-4 control-label"></label>
	        	<div class="col-sm-4 text-center">
	        		<img id="userPic" src="${contextPath }/static/img/userImgDefault.jpg" alt="个人照片" class="img-rounded" data-holder-rendered="true" style="width: 140px; height: 170px;">
				  	<br/>
				  	<a href="javascript:void(0)" onclick="showUploadImg()">添加头像</a>
		        	<input type="hidden" id="imgUrl" name="imgUrl" value="${u.imgUrl }"/>
	        	</div>
	        </div>
		  	
		  </div>
		</div>
		
		<hr style="height:1px;border:none;border-top:1px solid #999;" />
		<!-- 更多信息 -->
		<div class="row">
		  <div class="col-md-6">
		  	
	        <div class="form-group">
	        	<label for="sex" class="col-sm-6 control-label">性别</label>
	        	<div class="col-sm-6">
			        <select class="form-control" id="sex" name="sex">
			        	<option value="">请选择性别</option>
			        	<option value="1">男</option>
			        	<option value="0">女</option>
			        </select>
			    </div>
	        </div>
	        <div class="form-group">
	        	<label for="brith" class="col-sm-6 control-label">出生年月</label>
	        	<div class="col-sm-6">
	       			<input type="text" id="brith" name="brith" value="${u.brith }" class="form_datetime form-control" placeholder="出生年月">
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="carNo" class="col-sm-6 control-label">身份证号</label>
	        	<div class="col-sm-6">
	       			<input type="text" id="carNo" name="carNo" value="${u.carNo }" class="form-control" placeholder="身份证号" >
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="workHistory" class="col-sm-6 control-label">工作经历</label>
	        	<div class="col-sm-6">
	       			<input type="text" id="workHistory" name="workHistory" value="${u.workHistory }" class="form-control" placeholder="民营医院工作年限" >
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="workLimit" class="col-sm-6 control-label">执业范围</label>
	        	<div class="col-sm-6">
	       			<input type="text" id="workLimit" name="workLimit" value="${u.workLimit }" class="form-control" placeholder="执业范围" >
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="currPay" class="col-sm-6 control-label">目前月薪</label>
	        	<div class="col-sm-6">
	        		<select class="form-control" id="currPay" name="currPay" placeholder="目前月薪">
			        	<option value="">请选择薪资范围</option>
			        	<option value="1">3万以内</option>
			        	<option value="2">3万-6万</option>
			        	<option value="3">6万-9万</option>
			        	<option value="4">9万-12万</option>
			        	<option value="5">12万-15万</option>
			        	<option value="6">15万以上</option>
			        </select>
	        	</div>
	        </div>
	        
	        <div class="form-group" >
	        	<label for="address" class="col-sm-6 control-label"></label>
	        	<div class="col-sm-6">	
			        <div style="float:left">
			        	<input type="text" id="valid" class="form-control" style="width:100px" placeholder="验证码" required>
			        </div>
			        <div style="float:left; padding-left:20px;" onclick="can_click()" >
			        	<canvas id="myCanvas" height="40px" width="100px">your browser does not support the canvas tag </canvas>
			        </div>
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="address" class="col-sm-6 control-label"></label>
	        	<div class="col-sm-6">	
			       <div id="valid_tips" class="alert alert-danger" role="alert" style="display:none">
				        <strong>验证码不正确</strong>
				    </div>
	        	</div>
	        </div>
	        
	        
		  </div>
		  
		  <!-- 右侧 -->
		  <div class="col-md-6">
		  	<div class="form-group">
	        	<label for="workAddress" class="col-sm-4 control-label">工作单位</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="workAddress" name="workAddress" value="${u.workAddress }" class="form-control" placeholder="工作单位">
	       		</div>
	        </div>
	        <div class="form-group">
	        	<label for="beforeWork" class="col-sm-4 control-label">原工作单位</label>
	        	<div class="col-sm-6">
		        	<input type="text" id="beforeWork" name="beforeWork" value="${u.beforeWork }" class="form-control" placeholder="原工作单位">
		        </div>
	        </div>
	        <div class="form-group">
	        	<label for="hopeCity" class="col-sm-4 control-label">期望工作城市</label>
	        	<div class="col-sm-6">
		        	<input type="text" id="hopeCity" name="hopeCity" value="${u.hopeCity }" class="form-control" placeholder="期望工作城市">
		        </div>
	        </div>
	        <div class="form-group">
	        	<label for="hopePay" class="col-sm-4 control-label">期望薪资(年薪)</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="hopePay" name="hopePay" value="${u.hopePay }" class="form-control" placeholder="期望薪资(年薪)">
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="hopeWork" class="col-sm-4 control-label">期望单位</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="hopeWork" name="hopeWork" value="${u.hopeWork }" class="form-control" placeholder="期望单位">
	        	</div>
	        </div>
		  </div>
		</div>
        
        <div class="form-group">
        	<label for="address" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">
	        	<button class="btn btn-lg btn-primary btn-block" type="submit" >立即${msg }</button>
	        </div>
        </div>
        <div class="form-group">
        	<label for="address" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">	
		       <div id="reg_tips" class="alert alert-danger" role="alert" style="display:none">
			        <strong>${msg }失败，请稍后再试！</strong>
			    </div>
        	</div>
        </div>
      </form>

    </div> <!-- /container -->
    
    <div class="theme-popover-img">
    	<div class="row">
    		<div class="col-md-1 col-md-offset-11">
				<a href="javascript:void(0)" onclick="hideUploadImg()">
					<img src="${contextPath }/static/img/close.png" style="width:23px"/>
				</a>
    		</div>
    	</div>
    	<div class="row">
	  		<div class="col-md-9">
		  		<input class="photo-file" type="file" name="imgFile" id="fcupload" onchange="readURL(this);"/>
	  		</div>
	  		<div class="col-md-3">
		  		<button id="button" onclick="uploadImg()">上传头像</button>
	  		</div>
	  	</div>
	    <div class="modal-footer"  style="overflow:hidden">
	        <img alt="" src="" width="450" border="0" id="cutimg"/>
            <input type="hidden" id="x" name="x"/>
            <input type="hidden" id="y" name="y"/>
            <input type="hidden" id="w" name="w"/>
            <input type="hidden" id="h" name="h"/>
	    </div>
    </div>
    

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
<script src="${contextPath }/static/js/jquery.Jcrop.js"></script>
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
<script src="${contextPath }/static/js/bootstrap-datetimepicker.min.js"></script>
<script src="${contextPath }/static/js/ajaxfileupload.js"></script>
<script type="text/javascript">
$(".form_datetime").datetimepicker({
	autoclose: true,
	minView:'month',
	language: 'cn',
	format: 'yyyy-mm-dd'
});

function hideUploadImg(){
	$('.theme-popover-mask').fadeOut(100);
	$('.theme-popover-img').slideUp(200);
}

function showUploadImg(){
	//显示遮罩层
	$('.theme-popover-mask').fadeIn(100);
	//显示上传框
	$('.theme-popover-img').slideDown(200);
}

function remImgAttr(){
	$('#cutimg').removeAttr('src');
	$('#cutimg').attr('width','450');
	$('#cutimg').removeAttr('height');
	$('#cutimg').attr('border','0');
}

//定义一个全局api，这样操作起来比较灵活
var api = null;
function readURL(input) {
	if (api) {
        api.destroy();
    }
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.readAsDataURL(input.files[0]);
        reader.onload = function (e) {
            $('#cutimg').removeAttr('src');
            if(e.target.result != '/'){
	            $('#cutimg').attr('src', e.target.result);
            }
            api = $.Jcrop('#cutimg', {
                setSelect: [ 20, 20, 160, 190 ],
                aspectRatio: 140/170,
                onSelect: updateCoords
            });
        };
        if (api != undefined) {
            api.destroy();
        }
    }
    function updateCoords(obj) {
        $("#x").val(obj.x);
        $("#y").val(obj.y);
        $("#w").val(obj.w);
        $("#h").val(obj.h);
    };
}

function uploadImg(){
	//var data = { x:$("#x").val(), y:$("#y").val(), w:$("#w").val(), h:$("#h").val() };
	var url = '${contextPath }/file/upload_img.jspx' 
	url += '?x=' + $("#x").val() +'&y='+$("#y").val()+'&w='+$("#w").val()+'&h='+$("#h").val() + '&compressWid=450';
	$.ajaxFileUpload({
	    url: url,
	    secureuri: false,
	   // data: data,
	    fileElementId: 'fcupload',
	    dataType: 'text',
	    success: function (data) {
	       if(data && data != ''){
	    	   if(data == '-1'){
	    		   alert("只能上传jpg格式图片！");
	    	   }else{
			       hideUploadImg();
			       $("#userPic").attr("src",data);
			       $("#imgUrl").val(data)
			       api.destroy();
	    	   }
	       }
	    },
	    error: function (data) {
	        alert("error");
	    }
	});
}

var canvas=$("#myCanvas").get(0);
var _canvas=$("#myCanvas").get(0).getContext("2d");
var return_str="";
var _ifstart=false;
var _B_x=0;
var _B_y=0;
function can_click(){
	start();
};

//进入首页
function toUserInfo(){
	window.location.href= "${contextPath }/index.jspx";
}

//留在当页
function currPage(){
	window.location.href = "${contextPath }/to_user_info.jspx?iphone=${u.iphone }";
}

function pass(){
	var _val=$("#valid").val();
	if($("#phone_valid_tips").css("display") == "block"){
		return false;
	}
	var update_user = '${update_user}';
	if(update_user != 'update_user'){
		if(_val.toUpperCase()==return_str){
			$("#valid_tips").css("display","none");
			//$("#register_form").submit();
		}else{
			$("#valid_tips").css("display","block");
			return false;
		};
	}
    //验证手机号是否存在
    var idStr = $("#id").val();
	if(!idStr || idStr == ""){
        var result = validPhone();
        if(result == "1"){
            alert("改手机号已经存在！");
            return false;
        }
    }
	//显示遮罩层
	$('.theme-popover-mask').fadeIn(100);
	var params = $("#register_form").serialize();
	params = decodeURIComponent(params,true);
	$.ajax({
        type:"POST",
        url:"${contextPath }/register.jspx",
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		data:params,
		async:true,
		dataType:'json',
		success:function(data){
			if(data == "0"){
				//隐藏遮罩层
				$('.theme-popover-mask').fadeOut(100);
				$("#reg_tips").css("display","block");
			}else{
				//显示提示框
				$('.theme-popover').slideDown(200);
			}
		}
	});
	return false;
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

//验证手机号码
function validPhone(){
	var result = 0;
	$.ajax({
		url:"${contextPath }/valid_reg.jspx",
		data:{iphone:$("#iphone").val()},
		async:false,
		dataType:'json',
		success:function(data){
			if(data == "1"){
				$("#phone_valid_tips").css("display","block");
                result =  1;
			}else{
				$("#phone_valid_tips").css("display","none");
			}
		}
	});
	return result;
}



$(document).ready(function(e) {
	start();
	$("#sex").val('${u.sex}');
	$("#currPay").val('${u.currPay}');
	
	if('${u.imgUrl}' != ''){
		$("#userPic").attr('src','${u.imgUrl}');
	}
	//$("#header").load("./to_header.jspx");
});
</script>
</body>

</html>