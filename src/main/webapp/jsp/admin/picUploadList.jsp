<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前台页面上传</title>
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
<body style="background-color: #fff; color:#000">
	<div class="" >
				
    	<form id="register_form" class="form-horizontal" action="${contextPath }/adminPic/get_adm_pic_list.jspx" method="post">
        	<div class="row">
	        	<div class="col-md-4">
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
			        	<div class="col-sm-3">
			        		<input type="submit" value="查询" />
			        	</div>
			        </div>
			        
		        </div>
	        </div>
    	</form>
    	
    	<div class="row">
	    	<div class="col-md-12">
	    		<table class="table table-bordered  table-striped table-hover">
	    			<thead>
	    				<tr>
	    					<th>序号</th>
	    					<th>类型</th>
	    					<th>照片描述</th>
	    					<th>上传时间</th>
	    					<th>图片路径</th>
	    					<th>操作</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    				<c:forEach var="pic" items="${picVoList }" varStatus="idx">
	    					<tr>
		    					<td>${pic.id }</td>
		    					<td>${pic.picType }</td>
		    					<td>${pic.picDesc }</td>
		    					<td>${pic.uploadTime }</td>
		    					<td>${pic.srcUrl }</td>
		    					<td>
		    						<a href="${contextPath }/adminPic/to_upload_pic.jspx?id=${pic.id }">修改</a>| 
		    						<a href="javascript:void(0)">删除</a>
		    					</td>
		    				</tr>
	    				</c:forEach>
	    				
	    			</tbody>
	    		</table>
    		</div>
    	</div>
    	
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
$(".form_datetime").datetimepicker({
	autoclose: true,
	minView:'month',
	language: 'cn',
	format: 'yyyy-mm-dd'
});

function toUserInfo(){
	//window.location.href= "${contextPath }/index.jspx";
	$('.theme-popover-mask').fadeOut(100);
	$('.theme-popover').slideUp(200);
	window.location.reload();
}

$(document).ready(function(e) {
	
	if('${picVo.picVoList}' != ''){
		$("#picType").val('${picVo.picVoList}');
	}
	//$("#header").load("./to_header.jspx");
});
</script>
</body>

</html>