<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>在线学习平台设计</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link rel="stylesheet" href="css/menu.css" />
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
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
</script>
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
<style type="text/css">
.score{
position:absolute;
border:0px solid red;
text-align:left;
color:white;
background: red;
left:5px;
top:5px;
width:40px;
height:40px;
border-radius:20px 20px;
text-align: center;
padding-top: 10px;
}
</style>
<style>
				  .demandcategory{
				  border:1px solid #EEEEEE ;
				  margin-top: 20px ;
				  }
				  .demandcategory ul{
				  list-style: none;
				  display:flex;
				  text-align: center;
				  padding: 10px 10px;
				   margin:0px !important;
				  }
				  .demandcategory ul li{
				   border:0px solid red;
				   width: auto !important;
				   display:flex !important;
				   text-align: center;
				   padding: 0px !important;
				   margin:0px 10px !important;
				  }
				  .demandcategory ul li a{
				   border:1px solid #EEEEEE;
				   padding: 3px 6px;
				   text-decoration: none;
				  }
				  
				  .demandcategory ul li a:hover{
				   background: #003B64;
				  border:1px solid #003B64 ;
				  color:white;
				  text-decoration: none;
				  }
				  
				  .activestyle{
				  background: #003B64;
				  border:1px solid #003B64;
				  color:white;
				  }
				</style>

</head>
<body>
<input type="hidden" id="categoryid" value="${categoryid}">
	<!-- header-section-starts -->
		 
		
		<div class="container">
		  <div class="main-content">
			<jsp:include page="head.jsp"></jsp:include>
			<!-- end container -->
    

<!-- AddThis Smart Layers END -->


		<div class="footer-top-grid" style="border:0px solid red;width: 100% ">
		<div class="list-of-movies col-md-8" style="border:0px solid red;width: 98%;">
				<div class="clearfix"></div>
				<div class="featured" style="margin: 0px;">
					<h4 style="padding: 0px;margin: 0px;">课程信息</h4>
					<div class="demandcategory">
					  <ul>
					  <li><a href="kechenMsg.do" ${categoryid eq null?'class=activestyle':''}>全部</a></li>
					  <c:forEach items="${ctlist}" var="category">
					    <li><a ${categoryid eq category.id?'class=activestyle':''} href="kechenMsg.do?categoryid=${category.id}">${category.name}</a></li>
					  </c:forEach>
					  </ul>
					</div>
					<ul>
					<c:forEach items="${pageInfo.list}" var="kechen">
						<li style="width: 24%">
							<div class="f-movie">
								<div class="f-movie-img">
									<a href="kechenDetails.do?id=${kechen.id}"><img src="upload/${kechen.filename}" alt=""  style="width: 268px;height: 278px;"></a>
								</div>
									<div class="f-movie-name">
										<a href="kechenDetails.do?id=${kechen.id}">${kechen.kcname}</a>
									</div>								 
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>		
			<div class="blog-pagimation">
                <c:if test="${fn:length(pageInfo.list) gt 0}">
                    <div id="demo1" style="text-align: center"></div>
                </c:if>
		  	</div>	
			</div>
		</div>
			<div class="clearfix"></div>
		</div>
			<div class="copy-rights text-center">
			<p> 在线学习平台设计 - Collect from <a href="<%=path %>/admin/login.jsp" title="后台管理" target="_blank">后台管理</a></p>
			</div>
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

    var categoryid = $("#categoryid").val()
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
                            location.replace("kechenMsg.do?pageNum="+currentpage+"&pageSize="+pageSize+"&categoryid="+categoryid)
                        }
                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    }
                });
            });

</script>
</html>