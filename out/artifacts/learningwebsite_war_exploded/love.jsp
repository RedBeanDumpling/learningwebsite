<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<link rel="stylesheet" type="text/css" href="css/page.css">
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" type="text/css" href="css/page.css">
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
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="layer/layui.css">
<link rel="stylesheet" type="text/css" href="/learningwebsite/admin/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/learningwebsite/admin/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/learningwebsite/admin/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/learningwebsite/admin/css/personal.css" media="all">
</head>
<body>
	<!-- header-section-starts -->
		
 
		<div class="container">
		  <div class="main-content">
		  <!-- head -->
		  <jsp:include page="head.jsp"></jsp:include>
		<!-- head -->
		<!-- end container -->
    
<!-- AddThis Smart Layers END -->

	<ol class="breadcrumb">
			  <li><a href="index.do">首页</a></li>
			  <li class="active">推荐课件</li>
			</ol>
	<!----->
	<div class="contact">
	<h3>推荐课件</h3>
	<div class="contact-form">
					<div class="col-md-6 contact-grid" style="border:0px solid red;width: 100%">
					<div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<tr>
						    <th>标题</th>
						    <th>所属课程</th>
						    <th>上传者</th>
						    <th>上传日期</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${lovelist}" var="love">
						<tr>
							<td>${love.title}</td>
							<td><a href="kechenDetails.do?id=${love.kechen.id}">${love.kechen.kcname}</a></td>
							<td>${love.teacher.tname}</td>
							<td>${love.savetime }</td>
							<td>
							<c:if test ="${love.flag eq '课程视频' }">
							<a href="javascript:void(0)" style="color:#FFAA25" onclick="isbaoming('${love.kechen.id}','${love.id}')">点击观看</a>
							</c:if>
							<c:if test ="${love.flag eq '课件' }">
							<a style="color:#FFAA25" href="downfile.do?filename=${love.filename}&kcid=${love.kechen.id }&kclrid=${love.id}">下载</a>
							</c:if>
							</td>
						</tr>
						</c:forEach>
						
					</tbody>
					</table>
                     <div class="larry-table-page clearfix">
			         </div>
			    </div>
					
				    </div>
				<div class="clearfix"> </div>
			   </div>
	</div>
	</div>
		
			<div class="clearfix"></div>
		</div>
			<div class="copy-rights text-center">
			<p> 在线学习平台设计 - Collect from <a href="<%=path %>/admin/login.jsp" title="后台管理" target="_blank">后台管理</a></p>
			</div>
	</div>
 <script src="js/responsive-tabs.js"></script>
    <script type="text/javascript">
      $( '#myTab a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      $( '#moreTabs a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      ( function( $ ) {
          // Test for making sure event are maintained
          $( '.js-alert-test' ).click( function () {
            alert( 'Button Clicked: Event was maintained' );
          } );
          fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
      } )( jQuery );

    </script>
 <script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
<script type="text/javascript">
function add(url){
location.replace(url);
}


function isbaoming(kcid,veid){
	$.ajax({
		type:"post",
		url:"lookvedio.do?kcid="+kcid+"&veid="+veid,
		date:"",
		success:function(res){
			if(res==0){
				layer.msg("请先报名");
			}else if(res==1){
				location.replace("login.jsp");
			}else{
				lookvedio(res);
			}
	    }
	})
}

function lookvedio(filename){
	var content = "<div class=\"newsxitme\" >"+
    "<video      controls=\"controls\"   width=\"100%\"     poster='预览图'   preload=\"auto\"    >"+
    "<source src=\"upload/"+filename+"\" type=\"video/mp4\"></video></div>"
	layer.open({
		  title:"在线观看",
		  type: 1,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['420px', '340px'], //宽高
		  content: content
		});
}



function up(tt)
{
		    layer.open({
		      type: 2,
		      title: '上传文件',
		      shadeClose: true,
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['450px', '200px'],
		      content: 'upload.jsp?Result='+tt
		    });
}


</script>
</html>