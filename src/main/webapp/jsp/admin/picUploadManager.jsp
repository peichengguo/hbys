<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
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
	<div class="container"  style="margin-top:30px">
				
      <form id="register_form" class="form-horizontal" action="#" method="post" onsubmit="return pass()">
        <h2 class="text-center">填写您真实有效信息</h2>
        <input type="hidden" name="id" value="${picVo.id }">
		<div class="row">
		  <div class="col-md-6">
		  	<div class="form-group">
	        	<label for="" class="col-sm-4 control-label"></label>
	        	<div class="col-sm-4 text-center">
	        		<img id="userPic" src="${contextPath }/static/img/userImgDefault.jpg" alt="上传照片" class="img-rounded" data-holder-rendered="true" style="width: 235px; height: 159px;">
				  	<br/>
				  	<a href="javascript:void(0)" onclick="showUploadImg()">添加照片</a>
		        	<input type="hidden" id="litiUrl" name="litiUrl" value=${picVo.litiUrl }/>
	        	</div>
	        </div>
		  	
		  </div>
		  <div class="col-md-6">
		  	<div class="form-group">
	        	<label for="picType" class="col-sm-3 control-label">照片类型</label>
	        	<div class="col-sm-6">
	        		<select class="form-control" id="picType" name="picType" placeholder="照片类型">
			        	<option value="">请选择照片类型</option>
			        	<option value="man">男科</option>
			        	<option value="woman">妇科</option>
			        	<option value="inner">内科</option>
			        	<option value="outer">耳鼻喉科</option>
			        </select>
	        	</div>
	        </div>
	        
	        <div class="form-group">
	        	<label for="picDesc" class="col-sm-3 control-label">照片描述</label>
	        	<div class="col-sm-6">
	        		<input type="text" id="picDesc" name="picDesc" value="${picVo.picDesc }" value="照片描述"  class="form-control" placeholder="照片描述" required>
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="state" class="col-sm-3 control-label">状态</label>
	        	<div class="col-sm-6">
	        		<select class="form-control" id="state" name="state" placeholder="状态">
			        	<option value="">请选择状态</option>
			        	<option value="0">正常</option>
			        </select>
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="uploadTime" class="col-sm-3 control-label">上传时间</label>
	        	<div class="col-sm-6">
	        		${picVo.uploadTime }
	        	</div>
	        </div>
	      </div>
		</div>
        
        <div class="form-group">
        	<label for="address" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">
	        	<button class="btn btn-lg btn-primary btn-block" type="submit" >立即保存</button>
	        </div>
        </div>
        <div class="form-group">
        	<label for="address" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">	
		       <div id="reg_tips" class="alert alert-danger" role="alert" style="display:none">
			        <strong>保存失败，请稍后再试！</strong>
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
	  		<div class="col-md-6">
		  		<input class="photo-file" type="file" name="imgFile" id="fcupload" onchange="readURL(this);"/>
	  		</div>
	  		<div class="col-md-3 text-center">
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
		<h2 class="text-center" style="color:red">恭喜您，保存成功！</h2>
		<br/>
		
		<br/><br/>
		<div class="form-group">
        	<label for="address" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">
				<button class="btn btn-lg btn-primary btn-block" type="button" onclick="toUserInfo()">确定</button>
			</div>
		</div>
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
                setSelect: [ 20, 20, 255, 179 ],
                aspectRatio: 235/159,
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
	var url = '${contextPath }/file/upload_adm_img.jspx' 
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
			       $("#userPic").attr("src",'${contextPath }/' + data);
			       $("#litiUrl").val(data)
			       api.destroy();
	    	   }
	       }
	    },
	    error: function (data) {
	        alert("error");
	    }
	});
}


function toUserInfo(){
	//window.location.href= "${contextPath }/index.jspx";
	$('.theme-popover-mask').fadeOut(100);
	$('.theme-popover').slideUp(200);
	window.location.reload();
}

function pass(){
	
	//显示遮罩层
	$('.theme-popover-mask').fadeIn(100);
	var params = $("#register_form").serialize();
	
	params = decodeURIComponent(params,true);
	
	$.ajax({
		url:"${contextPath }/adminPic/upload_pic_data.jspx",
		type:"POST",
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



$(document).ready(function(e) {
	
	if('${picVo.litiUrl}' != ''){
		$("#userPic").attr('src','${picVo.litiUrl}');
	}
	if('${picVo.picType}' != ''){
		$("#picType").val('${picVo.picType}');
	}
	if('${picVo.state }' != ''){
		$("#state").val('${picVo.state}');
	}
	//$("#header").load("./to_header.jspx");
});
</script>
</body>

</html>