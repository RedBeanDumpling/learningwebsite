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
			  <li class="active">试卷列表</li>
			</ol>
	<!----->
	<div class="contact">
	<div class="contact-form">
					<div class="col-md-6 contact-grid" style="border:0px solid red;width: 100%">
					<div class="layui-form news_list" >
					<form action="paperList.do" method="post" name="regForm">
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<th colspan="7">
						  <div class="layui-form-item">
						    <div class="layui-inline">
						      <div class="layui-input-inline">
						        <input value="${key}" autocomplete="off" style="width: 200px;" placeholder="请输入试卷标题" name="key" class="layui-input search_input" type="text">
						      </div>
						    </div>
						    <div class="layui-inline">
						      <div class="layui-input-inline">
						        <select name="kcid" id="kcid" lay-search="">
									  	<option value="">请选择课程</option>
									  	<c:forEach items="${kclist}" var="kc">
									  	  <option value="${kc.id}" ${kcid eq kc.id?"selected":"" }>${kc.kcname}</option>
									  	</c:forEach>
								  	</select>
						      </div>
						    </div>
						    <div class="layui-inline">
						        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">查询</button>
						      </div>
						    </div>
						  </div>
							
							        
							      	
						
						</th>
						<tr>
							<th>课程</th>
						    <th>试卷标题</th>
						    <th>总分</th>
						    <th>考试时长</th>
							<th>组卷教师</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="paper">
						<tr>
							<th>${paper.kechen.kcname}</th>
							<td style="text-align: left;width: 400px">${paper.title}</td>
							<td>${paper.score}分</td>
							<td>${paper.testtime}分钟</td>
							<th>${paper.teacher.tname}</th>
							<td>
							<a class="layui-btn  layui-btn-mini" href="paperView.do?id=${paper.id}">预览</a>
							<a class="layui-btn  layui-btn-mini" href="paperDel.do?id=${paper.id}">删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center"  colspan="7">
                        <c:if test="${fn:length(pageInfo.list) gt 0}">
                            <div id="demo1" style="text-align: center"></div>
                        </c:if>
                    </td>
                  </tr>
					</tbody>
					</table>
					</form>
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
	
	<script type="text/javascript" src="layui/layui.js"></script>
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
layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
});	  
function add(url){
location.replace(url);
}


var key = $("#key").val()==undefined?"":$("#key").val()
var kcid = $("#kcid").val()==undefined?"":$("#kcid").val()
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
                        location.replace("paperList.do?pageNum="+currentpage+"&pageSize="+pageSize+"&key="+key+"&kcid="+kcid)
                    }
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                }
            });
        });
</script>
</html>