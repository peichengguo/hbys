<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>民营医师 | 学术经验分享</title>
    <link href="${contextPath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath }/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath }/static/css/prettyPhoto.css" rel="stylesheet">
    <link href="${contextPath }/static/css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/bitbug_favicon.ico">
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">-->
</head><!--/head-->

<body data-spy="scroll" data-target="#navbar" data-offset="0">
    <header id="header" role="banner">
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
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#main-slider"><i class="icon-home"></i></a></li>
                        <li><a href="#portfolio">医师简介</a></li>
                        <li><a href="#services">医术经验</a></li>
                        <li><a href="#portfolio_yy">医院介绍</a></li>
                        <li><a href="#pricing">平台渠道</a></li>
                        <li><a href="#contact">联系我们</a></li>
                    </ul>
                    <div class="navbar-nav" style="font-weight:bold;font-size:24px;float:right;height:50px;line-height:50px">                    	
	                	<c:if test="${empty user }" >
	                	<a href="${contextPath }/to_login.jspx"><span style="">登陆</span></a>
	                	|
	                	<a href="${contextPath }/to_register.jspx"><span style="color:red">注册</span></a>
	                	</c:if>
	                	<c:if test="${!empty user }">
	                		<a href= "${contextPath }/to_user_info.jspx">${user.name }</a> | <a href= "${contextPath }/logout.jspx">退出</a>
	                	</c:if>
	                </div>
                </div>
                
            </div>
        </div>
    </header><!--/#header-->

    <section id="main-slider" class="carousel">
        <div class="carousel-inner">
            <div class="item active">
                <div class="container">
                    <div class="carousel-content">
                        <h1>愿景</h1>
                        <p class="lead">坚持创造一支团结友爱能打硬仗的鄂籍医生队伍</p>
                    </div>
                </div>
            </div><!--/.item-->
            <div class="item">
                <div class="container">
                    <div class="carousel-content">
                        <h1>使命</h1>
                        <p class="lead">规范专业狼性团队建设一个值得托付的组织</p>
                    </div>
                </div>
            </div><!--/.item-->
            <div class="item">
                <div class="container">
                    <div class="carousel-content">
                        <h1>加盟对象</h1>
                        <p class="lead">认同群文化湖北民营医师打工专家<!--;本群拒绝外省籍专家及莆系经营管理人员。--></p>
                    </div>
                </div>
            </div><!--/.item-->
        </div><!--/.carousel-inner-->
        <a class="prev" href="#main-slider" data-slide="prev"><i class="icon-angle-left"></i></a>
        <a class="next" href="#main-slider" data-slide="next"><i class="icon-angle-right"></i></a>
    </section><!--/#main-slider-->

    <section id="portfolio">
        <div class="container">
            <div class="box">
                <div class="center gap">
                    <h2>专业医师</h2>
                    <p class="lead">我们虽然有颜值，却偏偏选择了用实力来证明自己.</p>
                </div><!--/.center-->
                <ul class="portfolio-filter">
                    <li><a class="btn btn-primary active" href="#" data-filter="*">全部</a></li>
                    <li><a class="btn btn-primary" href="#" data-filter=".man">男科</a></li>
                    <li><a class="btn btn-primary" href="#" data-filter=".woman">妇科</a></li>
                    <li><a class="btn btn-primary" href="#" data-filter=".inner">内科</a></li>
                    <li><a class="btn btn-primary" href="#" data-filter=".outer">耳鼻喉科</a></li>
                </ul><!--/#portfolio-filter-->
                <ul class="portfolio-items col-4">
                    
                    <li class="portfolio-item ">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${contextPath }/static/images/portfolio/thumb/006.jpg" alt="">
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="李桥梁" href="${contextPath }/static/images/portfolio/full/006.jpg"><i class="icon-eye-open"></i></a>
                                </div>
                            </div>
                            <h5>李桥梁</h5>
                        </div>
                    </li><!--/.portfolio-item-->
                    <!--/.portfolio-item-->
                    <c:forEach var="pic" items="${picList }" varStatus="idx">
                    	<li class="portfolio-item ${pic.picType }">
	                        <div class="item-inner">
	                            <div class="portfolio-image">
	                                <img src="${contextPath }/${pic.litiUrl }" alt="">
	                                <div class="overlay">
	                                    <a class="preview btn btn-danger" title="${pic.picDesc }" href="${contextPath }/${pic.srcUrl }"><i class="icon-eye-open"></i></a>
	                                </div>
	                            </div>
	                            <h5 style="color:red">${pic.picDesc }</h5>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#portfolio-->


    <section id="services">
        <div class="container">
            <div class="box first">
                <div class="row">
                    <div class="center gap">
                        <h2>医学资料</h2>
                    </div><!--/.center-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-apple icon-md icon-color1"></i>
                            <h4><a href="${contextPath }/file/to_file_down.jspx" target="_blank">技术精粹</a></h4>
                            <p>男科资料 | 学术资料 | 妇科文献 .</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-android icon-md icon-color2"></i>
                            <h4><a href="${contextPath }/file/to_file_down.jspx" target="_blank">接诊技巧</a></h4>
                            <p>男科常识 | 男科治疗 | 男科专家访谈.</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-windows icon-md icon-color3"></i>
                            <h4><a href="${contextPath }/file/to_file_down.jspx" target="_blank">心得体会</a></h4>
                            <p>妇科疾病治疗 | 男科治疗 | 病例常识.</p>
                        </div>
                    </div><!--/.col-md-4-->

                </div><!--/.row-->
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#services-->


    <section id="portfolio_yy">
        <div class="container">
            <div class="box" style="background-color: #032233">
                <div class="center">
                    <h2>医术分享</h2>
                    <p class="lead">医术文献，宝贵经验的分享之地.</p>
                </div><!--/.center-->

                <div class="row" style="background-color: #354454;height: 70px;padding: 10px 0px 10px 0px;border-bottom: 1px dashed #ADA6A6">
                    <div class="col-sm-2" style="text-align: right">
                        <img style="height:50px" src="${contextPath }/static/images/portfolio/full/001.jpg"/>
                    </div>
                    <div class="col-sm-8" style="line-height: 50px">
                        <span style="color:#fc6c0d;font-size: 20px;font-family: 'Microsoft Yahei','微软雅黑','Simsun','宋体','Arial';">管理员 | </span>
                        <span style="color:#52b6ec;font-size: 20px;font-family: 'Microsoft Yahei','微软雅黑','Simsun','宋体','Arial';">论一个程序员的自我修养</span>
                    </div>
                    <div class="col-sm-2" style="line-height: 50px">
                        <span>2015-12-15 8:15:23</span>
                    </div>
                </div>

                <div class="row" style="background-color: #354454;height: 70px;padding: 10px 0px 10px 0px;border-bottom: 1px dashed #ADA6A6">
                    <div class="col-sm-2" style="text-align: right">
                        <img style="height:50px" src="${contextPath }/static/images/portfolio/full/001.jpg"/>
                    </div>
                    <div class="col-sm-8" style="line-height: 50px">
                        <span style="color:#fc6c0d;font-size: 20px;font-family: 'Microsoft Yahei','微软雅黑','Simsun','宋体','Arial';">管理员 | </span>
                        <span style="color:#52b6ec;font-size: 20px;font-family: 'Microsoft Yahei','微软雅黑','Simsun','宋体','Arial';">论一个程序员的自我修养</span>
                    </div>
                    <div class="col-sm-2" style="line-height: 50px">
                        <span>2015-12-15 8:15:23</span>
                    </div>
                </div>

                <div class="row" style="background-color: #354454;height: 70px;padding: 10px 0px 10px 0px;border-bottom: 1px dashed #ADA6A6">
                    <div class="col-sm-2" style="text-align: right">
                        <img style="height:50px" src="${contextPath }/static/images/portfolio/full/001.jpg"/>
                    </div>
                    <div class="col-sm-8" style="line-height: 50px">
                        <span style="color:#fc6c0d;font-size: 20px;font-family: 'Microsoft Yahei','微软雅黑','Simsun','宋体','Arial';">管理员 | </span>
                        <span style="color:#52b6ec;font-size: 20px;font-family: 'Microsoft Yahei','微软雅黑','Simsun','宋体','Arial';">论一个程序员的自我修养</span>
                    </div>
                    <div class="col-sm-2" style="line-height: 50px">
                        <span>2015-12-15 8:15:23</span>
                    </div>
                </div>

            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#portfolio-->


    <section id="pricing">
        <div class="container">
            <div class="box">
                <div class="center">
                    <h2>平台渠道</h2>
                    <p class="lead">平台渠道平台渠道平台渠道平台渠道平台渠道.</p>
                </div><!--/.center-->   
                <div class="big-gap"></div>
                <div id="pricing-table" class="row">
                    <div class="col-sm-4">
                        <ul class="plan">
                            <li class="plan-name">初级平台</li>
                            <li class="plan-price">海军总医院</li>
                            <li>航天中心医院</li>
                            <li>解放军总医院</li>
                            <li>西京医院</li>
                            <li>上海仁济医院</li>
                            <li>天津眼科医院</li>
                            <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">查看更多</a></li>
                        </ul>
                    </div><!--/.col-sm-4-->
                    <div class="col-sm-4">
                        <ul class="plan featured">
                            <li class="plan-name">中级平台</li>
                            <li class="plan-price">协和医院</li>
                            <li>同济医院</li>
                            <li>浙江省中医院</li>
                            <li>北京宣武医院</li>
                            <li>南方医院</li>
                            <li>北京肿瘤医院</li>
                            <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">查看更多</a></li>
                        </ul>
                    </div><!--/.col-sm-4-->
                    <div class="col-sm-4">
                        <ul class="plan">
                            <li class="plan-name">高级平台</li>
                            <li class="plan-price">空军总医院</li>
                            <li>上海远大心胸医院</li>
                            <li>北京安贞医院</li>
                            <li>中山大学肿瘤医院</li>
                            <li>北京市广安门医院</li>
                            <li>北京阜外医院</li>
                            <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">查看更多</a></li>
                        </ul>
                    </div><!--/.col-sm-4-->
                </div> 
            </div> 
        </div>
    </section><!--/#pricing-->

    <section id="contact">
        <div class="container">
            <div class="box last">
                <div class="row">
                    <div class="col-sm-6">
                        <h1>给我们留言</h1>
                        <p>您有什么意见，请填写您的姓名、邮箱以及您宝贵的意见提交给我们.</p>
                        <div class="status alert alert-success" style="display: none"></div>
                        <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php" role="form">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="称呼">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Email 地址">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="您的意见或建议"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-danger btn-lg">提交意见</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!--/.col-sm-6-->
                    <div class="col-sm-6">
                        <h1>地址</h1>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>广东省深圳市</strong><br>
                                    <abbr title="Phone">电话:</abbr> (123) 456-7890
                                </address>
                            </div>

                        </div>
                        <h1>友情链接</h1>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="social">
                                    <li><a href="#"><i class="icon-facebook icon-social"></i> 医术交流</a></li>
                                    <li><a href="#"><i class="icon-google-plus icon-social"></i> 经验交流</a></li>
                                    <li><a href="#"><i class="icon-pinterest icon-social"></i> 医术资料</a></li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="social">
                                    <li><a href="#"><i class="icon-linkedin icon-social"></i> 百度搜索</a></li>
                                    <li><a href="#"><i class="icon-twitter icon-social"></i> 实时资讯</a></li>
                                    <li><a href="#"><i class="icon-youtube icon-social"></i> 人间百态</a></li>
                                </ul>
                            </div>
                        </div>
                    </div><!--/.col-sm-6-->
                </div><!--/.row-->
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#contact-->

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2015 <a target="_blank" href="http://www.miitbeian.gov.cn/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">鄂ICP备15018099号</a>
                </div>
                <div class="col-sm-6 text-right">
                    
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <script src="${contextPath }/static/js/jquery.js"></script>
    <script src="${contextPath }/static/js/bootstrap.min.js"></script>
    <script src="${contextPath }/static/js/jquery.isotope.min.js"></script>
    <script src="${contextPath }/static/js/jquery.prettyPhoto.js"></script>
    <script src="${contextPath }/static/js/main.js"></script>
</body>
</html>