<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
	<div id="top" class="row text-center" style="background-color:#488698; ">
		<div class="col-xs-12 col-sm-6 col-md-10">
		<h1>后台管理</h1>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-2">
			<a href="${contextPath }/index.jspx"><span style="color:#fff">[返回主页] </span></a> 
			<span style="color:#fff"> &nbsp; </span>
			<a href="${contextPath }/logout.jspx"><span style="color:#fff"> [退出]</span></a>
		</div>
	</div>
	
	<div id="left" class="row">
		<div class="col-xs-12 col-sm-6 col-md-2">
			<jsp:include page="adminMenu.jsp"></jsp:include>
		</div>
  		<div class="col-xs-6 col-md-10">
			
			<iframe id="content" name="content" frameborder="0" width="100%" height="700" />
		</div>
		
	</div>
	
</div>


<script src="${contextPath }/static/js/jquery.js"></script>
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		
		
	});

</script>
</body>
</html>