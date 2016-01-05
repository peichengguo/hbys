<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医术分享</title>
<link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath }/static/css/signin.css" rel="stylesheet">
<link href="${contextPath }/static/css/main.css" rel="stylesheet">
<link href="${contextPath }/static/css/datetimepicker.css" rel="stylesheet">
<link href="${contextPath }/static/css/date-self.css" rel="stylesheet">
<style type="text/css">
	.bs-example {
	    margin-right: 0;
	    margin-left: 0;
	    background-color: #fff;
	    border-color: #ddd;
	    border-width: 1px;
	    border-radius: 4px 4px 0 0;
	    -webkit-box-shadow: none;
	    box-shadow: none;
	    min-height:400px;
	}

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
<body style="color:#000">
	<header id="header" role="banner">
        <jsp:include page="header.jsp"/>
	</header>
	<div class="container"  style="margin-top:30px">
		<h2 class="text-center">医术分享</h2>
		
		<div class="row">
	    	<div class="col-md-12 bs-example">
	    		<table class="table  table-striped table-hover">
	    			<thead>
	    				<tr>
	    					<th>标题</th>
	    					<th>作者</th>
	    					<th>发表时间</th>
	    					<th>操作</th>
	    				</tr>
	    			</thead>
	    			<tbody>
		    			<c:forEach var="fileVo" items="${fileVoList }" varStatus="idx">
			    			<tr>
		    					<td>${fileVo.fileName }</td>
		    					<td><fmt:formatNumber type="number" value="${fileVo.fileSize/1024 }" maxFractionDigits="2"/> Kb</td>
		    					<td><fmt:formatDate value="${fileVo.time }" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
		    					<td><a href="${contextPath }/file/download.jspx?id=${fileVo.id}" target="_blank">下载</a></td>
		    				</tr>
		    				
		    			</c:forEach>
	    			</tbody>
	    		</table>
	    	</div>
	    	
		</div>
    </div> <!-- /container -->
    
    <div class="theme-popover">
		<h2 class="text-center" style="color:red">恭喜您，${msg }成功！</h2>
		<br/>
		<h3 class="text-center"><span style="color:#000">进入网站首页！</span></h3>
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
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript">

function toUserInfo(){
	window.location.href= "${contextPath }/index.jspx";
}


$(document).ready(function(e) {
	
});
</script>
</body>

</html>