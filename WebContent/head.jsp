<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>在线学习平台设计</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<!-- start menu -->

<script type="text/javascript" src="js/megamenu.js"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="layui/css/layui.css" />
<script type="text/javascript" src="layui/layui.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
<!---- start-smoth-scrolling---->
</head>
<body>
<!-- start -->		  
			<div class="header">
				<div class="logo">
					<h3 style="color:#003B64">在线学习平台设计</h3>
				</div>
				<div class="search">
					<div class="search2">
					  <form action="kechenMsg.do" method="post">
						<i class="fa fa-search"></i>
						 <input type="text" name="key" placeholder="课程名称" value="${key}"/>
					  </form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
	<div class="bootstrap_container">
            <nav class="navbar navbar-default w3_megamenu" role="navigation" style="background: white">
        <div id="defaultmenu" class="navbar-collapse collapse" style="width: 100% !important;">
		<ul class="layui-nav" >
		  <li class="layui-nav-item">
		    <a href="index.do">首页</a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="activityLb.do">公告信息</a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="kechenMsg.do">课程信息</a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="messageLb.do">在线留言</a>
		  </li>
		  
		  <c:choose>
			<c:when test="${sessionScope.sessionmember==null}">
			<li class="layui-nav-item">
		    	<a href="login.jsp">登录</a>
		  	</li>
		  	<li class="layui-nav-item">
		    	<a href="register.jsp">注册</a>
		  	</li>
			</c:when>
			<c:otherwise>
				<li class="layui-nav-item" lay-unselect="">
				    <a href="javascript:;">${sessionScope.sessionmember.utype}${sessionScope.sessionmember.tname},你好!</a>
				    <dl class="layui-nav-child">
				    	<c:if test="${sessionScope.sessionmember.utype eq '老师'}">
				      		<dd><a class="play-icon popup-with-zoom-anim"  href="kechenLb.do">课程列表</a></dd>
						  	<dd><a class="play-icon popup-with-zoom-anim"  href="zuoyeMsg.do">学生作业</a></dd>
						  	<dd><a class="play-icon popup-with-zoom-anim"  href="questionsList.do">题库管理</a></dd>
						  	<dd><a class="play-icon popup-with-zoom-anim"  href="paperList.do">试卷管理</a></dd>
						  	<dd><a class="play-icon popup-with-zoom-anim"  href="examRecordListForTeacher.do">学生考试结果</a></dd>
				      	</c:if>
				      	<c:if test="${sessionScope.sessionmember.utype eq '学生'}">
				      		<dd><a class="play-icon popup-with-zoom-anim"  href="baomingLb.do">已报课程</a></dd>
					  		<dd><a class="play-icon popup-with-zoom-anim"  href="zuoyeLb.do">完成的作业</a></dd>
					  		<dd><a class="play-icon popup-with-zoom-anim"  href="examRecordList.do">考试记录</a></dd>
				      	</c:if>
				      	<dd><a class="play-icon popup-with-zoom-anim"  href="memberShow.do?id=${sessionScope.sessionmember.id}">个人信息</a></dd>
				      <dd><a href="memberexit.do">注销</a></dd>
				    </dl>
		  		</li>
			</c:otherwise>
		 </c:choose>
		  
		  
		</ul>
		</div>
            
			</nav><!-- end navbar navbar-default w3_megamenu -->
		</div>
		
<!-- end -->		
		

</body>
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
		$("#defaultmenu").find("ul").find("li").each(function(){
			if($(this).find("a")[0].href==window.location){
				$(this).addClass("layui-this");
			}else{
				$(this).removeClass("layui-this");
			}
				
		})
}); 
</script>
</html>