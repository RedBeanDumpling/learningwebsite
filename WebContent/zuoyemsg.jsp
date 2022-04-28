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
			  <li class="active">学生作业</li>
			</ol>
	<!----->
	<div class="contact">
	<h3>学生作业</h3>
	<div class="contact-form">
					<div class="col-md-6 contact-grid" style="border:0px solid red;width: 100%">
					<div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<tr>
						    <th>学生</th>
						    <th>课程</th>
						    <th>布置的作业</th>
						    <th>提交的作业</th>
						    <th>提交时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="zuoye">
						<tr>
							<td>${zuoye.student.tname}</td>
							<td>${zuoye.kechen.kcname}</td>
							<td>${zuoye.zy.title}</td>
							<td><a href="upload?filename=${zuoye.filename}">${zuoye.filename}</a></td>
<%--							实现了文件下载和跳转--%>
							<td>${zuoye.savetime}</td>
							<td>
								<a class="layui-btn layui-btn-danger layui-btn-mini" href="zuoyeDel.do?id=${zuoye.id}">删除</a>

<%--								<a class="layui-btn layui-btn-danger layui-btn-mini" href="pigai.jsp?id=${zuoye.id}">批改</a>--%>
                                <a class="layui-btn layui-btn-danger layui-btn-mini" href="jPainter.do?id=${zuoye.id}">批改</a>

							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center"  colspan="13">
                        <c:if test="${fn:length(pageInfo.list) gt 0}">
                            <div id="demo1" style="text-align: center"></div>
                        </c:if>
                    </td>
                  </tr>
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

pageSize = ${pageSize}
    currentpage = ${pageNum}
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                ,layer = layui.layer;
            //总页数大于页码总数
            laypage.render({
                elem: 'demo1'
                ,limit:pageSize
                ,curr:currentpage
                ,count: ${list.size()} //数据总数
                ,jump: function(obj,first){
                    //current_page(obj.curr,pageSize)
                    currentpage = obj.curr
                    if (!first) {
                        location.replace("zuoyeMsg.do?pageNum="+currentpage+"&pageSize="+pageSize)
                    }
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                }
            });
        });
</script>
</html>