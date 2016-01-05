<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
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

    	<form id="register_form" class="form-horizontal" action="${contextPath }/adminUser/to_user_list.jspx" method="post">
        	<div class="row">
	        	<div class="col-md-4">
				  	<div class="form-group">
			        	<label for="picType" class="col-sm-1 control-label">姓名</label>
			        	<div class="col-sm-3">
					        <input type="text" id="name" name="name" value="${searchObj.name }" class="form-control" placeholder="请输入查询条件">
			        	</div>
			        	<label for="picType" class="col-sm-1 control-label">手机号</label>
			        	<div class="col-sm-3">
					        <input type="text" id="iphone" name="iphone" value="${searchObj.iphone }" class="form-control" placeholder="请输入查询条件">
			        	</div>
			        	<div class="hidden">
                            <input type="hidden" id="currPage" name="currPage" value="${searchObj.currPage}">
                            <input type="hidden" id="showNum" name="showNum" value="${searchObj.showNum}">
                        </div>
			        	<div class="col-sm-3">
			        		<input id="searchUser" type="submit" value="查询" />
			        	</div>
			        </div>

		        </div>
	        </div>
    	</form>

    	<div style="font-size:20px;height:50px;line-height:50px;">

	        <a href="javascript:void(0)" onclick="setAdm('1')"><span>授于管理员</span></a>
	        |
	        <a href="javascript:void(0)" onclick="setAdm('0')"><span>撤销管理员</span></a>
	        |
	        <a href="javascript:void(0)" onclick="updatePass()"><span>重置密码</span></a>
	        |
	        <a href="javascript:void(0)" onclick="setAdm('-1')">锁定</a>
	        |
	        <a href="javascript:void(0)" onclick="setAdm('0')">启用</a>
    	</div>


    	<div class="row">
	    	<div class="col-md-12">
	    		<table class="table table-bordered  table-striped table-hover">
	    			<thead>
	    				<tr>
	    					<th></th>
	    					<th>姓名</th>
	    					<th>手机号</th>
	    					<th>身份证号</th>
	    					<th>籍贯</th>
	    					<th>执业类别</th>
	    					<th>工作单位</th>
	    					<th>月薪</th>
	    					<th>角色</th>
	    					<th>操作</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    				<c:forEach var="user" items="${userList }" varStatus="idx">
	    					<tr>
		    					<td><input type="checkbox" value="${user.id }"/></td>
		    					<td>${user.name }</td>
		    					<td>${user.iphone }</td>
		    					<td>${user.carNo }</td>
		    					<td>${user.address }</td>
		    					<td>${user.specialty }</td>
		    					<td>${user.workAddress }</td>
		    					<td>
		    					<c:if test="${user.currPay == 1}">
		    						3万以内
		    					</c:if>
		    					<c:if test="${user.currPay == 2}">
		    						3万-6万
		    					</c:if>
		    					<c:if test="${user.currPay == 3}">
		    						6万-9万
		    					</c:if>
		    					<c:if test="${user.currPay == 4}">
		    						9万-12万
		    					</c:if>
		    					<c:if test="${user.currPay == 5}">
		    						12万-15万
		    					</c:if>
		    					<c:if test="${user.currPay == 6}">
		    						15万以上
		    					</c:if>
		    					</td>
		    					<td>
		    						<c:if test="${user.state == -1}">
		    							锁定
			    					</c:if>
			    					<c:if test="${user.state == 0}">
			    						正常
			    					</c:if>
			    					<c:if test="${user.state == 1}">
		    							管理员
			    					</c:if>
			    					<c:if test="${user.state == 2}">
			    						超级管理员
			    					</c:if>
		    					</td>
		    					<td>
		    						<a href="${contextPath }/to_user_info.jspx?iphone=${user.iphone }" target="_blank">修改</a>
		    					</td>
		    				</tr>
	    				</c:forEach>

	    			</tbody>
	    		</table>
    		</div>
    	</div>
        <div class="row">
            <div class="col-xs-3 col-md-4">
                <ul class="pager">
                    <li><a href="javascript:void(0)" onclick="pageSearch(0)">首 页</a></li>
                    <li><a href="javascript:void(0)" onclick="pageSearch(-1)">上一页</a></li>
                    <li><a href="javascript:void(0)" onclick="pageSearch(1)">下一页</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-md-4">
                <span style="display: block;height: 72px; line-height: 72px;color: #428bca;">
                    第 <span style="color: red">${searchObj.currPage + 1 }</span> 页，<span style="color: red">${searchObj.currNum}</span> 条，共计 <span style="color: red">${count}</span> 条。
                </span>
            </div>

        </div>
    </div> <!-- /container -->
    
    <div class="theme-popover">
		<h2 class="text-center" style="color:red">恭喜您，操作成功！</h2>
		<br/>
        <h2 class="text-center" style="color:red" id="tips_passwd"></h2>
		<br/>
		<div class="form-group">
        	<label for="" class="col-sm-4 control-label"></label>
        	<div class="col-sm-4">
				<button class="btn btn-lg btn-primary btn-block" type="button" onclick="toUserInfo()">确定</button>
			</div>
		</div>
	</div>
	<div class="theme-popover-mask"></div>

<script src="${contextPath }/static/js/jquery.js"></script>
<script src="${contextPath }/static/js/bootstrap.min.js"></script>
<script src="${contextPath }/static/js/bootstrap-datetimepicker.min.js"></script>
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
	//重新查询页面
	$("#searchUser").click();
}

//翻页
function pageSearch(page){
    var currPage = $("#currPage").val();
    //当前页面已经是第一页，不在点首页以及 上一页
    if(currPage == 0 && page <= 0){
        alert("当前已经是第一页了！")
        return;
    }
    //当前页面已经是最后一页，不在继续下一页
    if(page > 0){
        var showNum = $("#showNum").val();
        var currNum = "${searchObj.currNum}";
        var count = "${count}";
        var currTotalNum = eval(currPage)*eval(showNum)+eval(currNum);
        if(currTotalNum >= eval(count)){
            alert("当前已经是最后一页了！")
            return;
        }
    }

    if(page == 0){
        $("#currPage").val(0);
    }else{
        $("#currPage").val(eval(currPage) + page);
    }

    $("#searchUser").click();
}

//删除用户，逻辑
function delUser(){
	alert($("input[type=checkbox]:checked"));
}

//修改密码
function updatePass(){
	var isChk = "";
	var isChkNum = 0;
    var userName = "";
	$("input[type=checkbox]:checked").each(function(){
		isChk = $(this).val();
        userName = $(this).parent().next().text();
		isChkNum++;
	});
	if(isChkNum != 1){
		alert("请选择一条记录，是一条记录哦！");
		return;
	}

    if(confirm("确定要重置"+userName+"用户的密码吗?")){
        //显示遮罩层
        $('.theme-popover-mask').fadeIn(100);
        $.ajax({
            url:"${contextPath }/adminUser/to_reset_pass" + isChk + ".jspx",
//        data:{id:isChk},
            async:true,
            dataType:'json',
            success:function(data){
                if(data == "0"){
                    //隐藏遮罩层
                    $('.theme-popover-mask').fadeOut(100);
                }else{
                    $("#tips_passwd").text("新密码："+data);
                    //显示提示框
                    $('.theme-popover').slideDown(200);

                }
            }
        });
    }

}

//设置取消管理员
function setAdm(state){
	
	var isChk = "";
	$("input[type=checkbox]:checked").each(function(){
		isChk += $(this).val() + ",";
	});
	if(!isChk){
		alert("请选择您要操作的记录！");
		return;
	}
	//显示遮罩层
	$('.theme-popover-mask').fadeIn(100);
	$.ajax({
		url:"${contextPath }/adminUser/set_role_adm.jspx",
		data:{ids:isChk,state:state},
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