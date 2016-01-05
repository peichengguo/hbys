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
</head>
<body>
	<div class="container">
		<div id="navbar" class="navbar navbar-default">
               <div class="navbar-header">
                   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                       <span class="sr-only">Toggle navigation</span>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                   </button>
                   <a class="navbar-brand" href="${contextPath }/index.jspx"></a>
               </div>
               <div class="collapse navbar-collapse">
               	
                   <div class="navbar-nav" style="font-weight:bold;font-size:24px;float:right;height:50px;line-height:50px;">                    	
                	<c:if test="${empty user }" >
	                	<a href="${contextPath }/to_login.jspx"><span style="">登陆</span></a>
	                	|
	                	<a href="${contextPath }/to_register.jspx"><span style="color:red">注册</span></a>
                	</c:if>
                	<c:if test="${!empty user }">
                		<c:if test="${user.state == '2' || user.state == '1'}">
                		<a href="${contextPath }/adminUser/index.jspx">进入后台 </a> |
                		</c:if>
                        <a href= "${contextPath }/to_update_pass${user.id}.jspx">修改密码</a> |
                        <a href= "${contextPath }/to_user_info.jspx">${user.name }</a> |
                		<a href= "${contextPath }/logout.jspx">退出</a>
                	</c:if>
                	
                </div>
               </div>
           </div>
	</div>
	
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
</body>

</html>