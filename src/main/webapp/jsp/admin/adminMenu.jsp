<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath }/static/css/admin.css" rel="stylesheet">
<title>菜单</title>
</head>
<body>

<div class="container">

	<div class="row sidebar-menu">
		<div class="col-sm-12">
			<a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
		    <i class="icon-user-md icon-large"></i> 用户管理</a>
		    <ul id="userMeun" class="nav nav-list collapse menu-second in">
		        <li><a href="${contextPath }/adminUser/to_user_list.jspx" target="content"><i class="icon-user"></i> 用户列表</a></li>
		       <%--  <li><a href="${contextPath }/admin/to_user_manager.jspx" target="content"><i class="icon-edit"></i> 用户管理</a></li>
		         --%>
		    </ul>
		    <c:if test="${user.state == '2' }">
		    <a href="#articleMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
		    <i class="icon-book icon-large"></i>照片管理</a>
		    <ul id="articleMenu" class="nav nav-list collapse menu-second in">
		        <li><a href="${contextPath }/adminPic/to_upload_pic.jspx" target="content"><i class="icon-pencil"></i>照片上传</a></li>
		        <li><a href="${contextPath }/adminPic/get_adm_pic_list.jspx" target="content"><i class="icon-list-alt"></i>照片展示</a></li>
		    </ul>
		    <a href="#articleMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
		    <i class="icon-book icon-large"></i>文件管理</a>
		    <ul id="articleMenu" class="nav nav-list collapse menu-second in">
		        <li><a href="${contextPath }/adminUser/upload_file.jspx" target="content"><i class="icon-pencil"></i>文件上传</a></li>
		        <li><a href="${contextPath }/adminUser/to_file_list.jspx" target="content"><i class="icon-list-alt"></i>文件列表</a></li>
		    </ul>
		    </c:if>
		</div>
	</div>
</div>


<script src="${contextPath }/static/js/jquery.js"></script>
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>