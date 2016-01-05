<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
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
				
      <form id="register_form" class="form-horizontal" action="${contextPath }/file/upload_file.jspx" method="post" enctype="multipart/form-data">
        <h2 class="text-center">文件上传</h2>
        <input type="hidden" name="id" value="${picVo.id }">
		<div class="row">
		  <div class="col-md-6">
		  	<div class="form-group">
	        	<label for="" class="col-sm-4 control-label"></label>
	        	<div class="col-sm-4 text-center">
	        		<input class="photo-file" type="file" name="file" />
		        	<input type="hidden" id="litiUrl" name="litiUrl" value=${picVo.litiUrl }/>
	        	</div>
	        </div>
		  	
		  </div>
		</div>
        
        <div class="form-group">
        	<label for="address" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">
	        	<button class="btn btn-lg btn-primary btn-block" type="submit" >立即上传</button>
	        </div>
        </div>
        <div class="form-group">
        	<label for="" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">	
		       <div id="reg_tips" class="alert alert-danger" role="alert" style="display:none">
			        <strong>保存失败，请稍后再试！</strong>
			    </div>
        	</div>
        </div>
      </form>

    </div> <!-- /container -->
    
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


function toUserInfo(){
	//window.location.href= "${contextPath }/index.jspx";
	$('.theme-popover-mask').fadeOut(100);
	$('.theme-popover').slideUp(200);
	window.location.reload();
}



$(document).ready(function(e) {
	//$("#header").load("./to_header.jspx");
});
</script>
</body>

</html>