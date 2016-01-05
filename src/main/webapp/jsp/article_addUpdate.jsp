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

    <link rel="stylesheet" href="${contextPath }/static/kindeditor/themes/default/default.css" />
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
<body style="color:#000">
	<header id="header" role="banner">
        <jsp:include page="header.jsp"/>
	</header>
	<div class="container"  style="margin-top:30px;background-color: #fff">
		<h2 class="text-center" style="color: #52B6EC">医术分享</h2>
		
		<div class="row" style="">

	    	<form action="${contextPath }/article/add_update_article.jspx" class="form-horizontal">
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="title" name="title" placeholder="标题"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="content" class="col-sm-2 control-label">分享内容</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="content" name="content" rows="10" placeholder="内容"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success">发表</button>
                    </div>
                </div>
            </form>

		</div>
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

    <script charset="utf-8" src="${contextPath }/static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="${contextPath }/static/kindeditor/lang/zh_CN.js"></script>

<script type="text/javascript">

    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content"]', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : false,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
    });

function toUserInfo(){
	window.location.href= "${contextPath }/index.jspx";
}

//留在当页
function currPage(){
    window.location.href = "#";
}

$(document).ready(function(e) {
	
});
</script>
</body>

</html>