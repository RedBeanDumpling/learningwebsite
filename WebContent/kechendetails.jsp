<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
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
<!--webfont-->
<!-- start menu -->
<link rel="stylesheet" href="<%=path %>/assets/hivideo.css" />


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
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" type="text/css" href="layer/layui.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!-- checkbox -->

<!-- checkbox -->
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
input[type="range"] {
  display: none;
  width: 100%;
}
.buyticket{
list-style: none;

}
.buyticket li{
font-weight: bold;
border:0px solid red;
height: 50px;
line-height: 50px;
border-bottom: 1px dashed gray;
}
</style>
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
</head>
<body>
	<!-- header-section-starts -->
		
 
		<div class="container">
		  <div class="main-content">
		  <!-- head -->
<jsp:include page="head.jsp"></jsp:include>    
<!-- AddThis Smart Layers END -->
	<div class="now-showing-list">
		<div class="col-md-4 movies-by-category movie-booking">
			<div class="movie-ticket-book">
					<div class="clearfix"></div>
					<img src="upload/${kechen.filename}" alt="" />
					<div class="bahubali-details">
					   <ul style="list-style: none;font-size:12px;">
					     <li style="margin-top: 20px;"><font style="font-weight: bold;">课程名称:</font>&nbsp;&nbsp;${kechen.kcname}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">课程分类:</font>&nbsp;&nbsp;${kechen.category.name}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">授课教师:</font>&nbsp;&nbsp;${kechen.teacher.tname}</li>
					   </ul>
					</div>
				</div>
			</div>
		<div class="col-md-8 movies-dates">	
		
		<style>
		.kechenlrtitle ul{
		list-style: none;
		display: flex;
		}
		.kechenlrtitle ul li{
		border:0px solid red;
		width: 25%;
		padding: 5px 0px;
		font-size:12px;
		border-bottom: 1px dashed #EEEEEE;
		}
		
		
		
		.kechenlrtitle ul li:last-CHILD{
		text-align: right;
		}
		
		</style>
		<!-- 视频 -->
		<c:if test="${fn:length(velist) gt 0}">
			<div >
			<h4 style="border-bottom: 1px solid #EEEEEE;padding-bottom: 10px;font-size:14px;color:#003B64;font-weight: 600">课程视频</h4>
			<div style="margin: 10px 0px;border:1px solid #EEEEEE;padding: 5px;">
			  <div class="kechenlrtitle" style="border-bottom: 1px solid #EEEEEE;">
			    <ul style="font-weight: bold;">
			      <li>视频课程名称</li>
			      <li>上传者</li>
			      <li>上传时间</li>
			      <li>在线观看</li>
			    </ul>
			  </div>
			  
			  <div class="kechenlrtitle content" style="margin-top:20px;">
			  <c:forEach items="${velist}" var="ve">
			  <ul>
			 	  <li>${ve.title }</li>
			 	  <li>${ve.teacher.tname }</li>
			      <li>${ve.savetime }</li>
			      <li style="color:#FFAA25"><a href="javascript:void(0)" style="color:#FFAA25" onclick="isbaoming('${kechen.id}','${ve.id}')">点击观看</a></li>
			    </ul>
			    </c:forEach>
			  </div>
			  
			</div>
			</div>
			</c:if>
			<!-- 视频 -->
			
			
			<!-- 课件 -->
			<c:if test="${fn:length(fllist) gt 0}">
			<div >
			<h4 style="border-bottom: 1px solid #EEEEEE;padding-bottom: 10px;font-size:14px;color:#003B64;font-weight: 600">随堂课件</h4>
			<div style="margin: 10px 0px;border:1px solid #EEEEEE;padding: 5px;">
			  <div class="kechenlrtitle" style="border-bottom: 1px solid #EEEEEE;">
			    <ul style="font-weight: bold;">
			      <li>课件名称</li>
			      <li>上传者</li>
			      <li>上传时间</li>
			      <li>下载</li>
			    </ul>
			  </div>
			  
			  <div class="kechenlrtitle content" style="margin-top:20px;">
			  <c:forEach items="${fllist}" var="fl">
			  <ul>
			 	  <li>${fl.title }</li>
			 	  <li>${fl.teacher.tname }</li>
			      <li>${fl.savetime }</li>
			      <li style="color:#FFAA25"><a style="color:#FFAA25" href="downfile.do?filename=${fl.filename}&kcid=${kechen.id }&kclrid=${fl.id}">下载</a></li>
			    </ul>
			    </c:forEach>
			  </div>
			  
			</div>
			</div>
			</c:if>
			<!-- 课件 -->
			
			<!-- 作业 -->
			<c:if test="${sessionScope.sessionmember ne null and fn:length(bmlist) gt 0 and fn:length(zylist) gt 0}">
			<div >
			<h4 style="border-bottom: 1px solid #EEEEEE;padding-bottom: 10px;font-size:14px;color:#003B64;font-weight: 600">作业</h4>
			<div style="margin: 10px 0px;border:1px solid #EEEEEE;padding: 5px;">
			  <div class="kechenlrtitle" style="border-bottom: 1px solid #EEEEEE;">
			    <ul style="font-weight: bold;">
			      <li>作业名称</li>
			      <li>上传者</li>
			      <li>完成时间</li>
			      <li>布置的作业</li>
			      <li>操作</li>
			    </ul>
			  </div>
			  
			  <div class="kechenlrtitle content" style="margin-top:20px;">
			  <c:forEach items="${zylist}" var="zy">
			  <ul>
			 	  <li>${zy.title }</li>
			 	  <li>${zy.teacher.tname }</li>
			      <li>${zy.savetime }</li>
			      <li style="color:#FFAA25"><a style="color:#FFAA25" href="upload?filename=${zy.filename}">下载</a></li>
			      <li style="color:#FFAA25"><a style="color:#FFAA25" href="skipzuoye.do?zyid=${zy.id }&kcid=${kechen.id}">提交作业</a></li>
			    </ul>
			    </c:forEach>
			  </div>
			  
			</div>
			</div>
			</c:if>
			

			<c:if test="${sessionScope.sessionmember ne null and fn:length(paperlist) gt 0}">
			<div >
			<h4 style="border-bottom: 1px solid #EEEEEE;padding-bottom: 10px;font-size:14px;color:#003B64;font-weight: 600">在线测试</h4>
			<div style="margin: 10px 0px;border:1px solid #EEEEEE;padding: 5px;">
			  <div class="kechenlrtitle" style="border-bottom: 1px solid #EEEEEE;">
			    <ul style="font-weight: bold;">
			      <li>试卷标题</li>
			      <li>总分</li>
			      <li>考试时长</li>
			      <li>组题教师</li>
			      <li>操作</li>
			    </ul>
			  </div>
			  
			  <div class="kechenlrtitle content" style="margin-top:20px;">
			  <c:forEach items="${paperlist}" var="paper">
			  <ul>
			 	  <li>${paper.title }</li>
			 	  <li>${paper.score }</li>
			 	  <li>${paper.testtime }</li>
			 	  <li>${paper.teacher.tname }</li>
			      <li style="color:#FFAA25"><a style="color:#FFAA25" href="javascript:gotoExam(${paper.id })">进入考试</a></li>
			    </ul>
			    </c:forEach>
			  </div>
			  
			</div>
			</div>
			</c:if>
			
			
			<div style="border:0px solid red;width: 100%;margin-top: 30px;">
			<ul style="display: flex;list-style: none;flex-direction:column;">
			  <li>
			  <c:choose>
			    <c:when test="${sessionScope.sessionmember ne null and fn:length(bmlist) eq 0}">
			    <input type="button" class="go-to-pay" onclick="baoming('${kechen.id}')" style="float: left;padding: 10px 20px;" value="报名">
			    </c:when>
			    <c:when test="${sessionScope.sessionmember ne null and fn:length(bmlist) gt 0}">
			    <input type="button" class="go-to-pay" onclick="javascript:void(0)" style="float: left;padding: 10px 20px;" value="已报名">
			    </c:when>
			    <c:otherwise>
			    <input type="button" class="go-to-pay" onclick="baoming('${kechen.id}')" style="float: left;padding: 10px 20px;" value="报名">
			    </c:otherwise>
			  </c:choose>
			  
			  
			  </li>
			</ul>
			</div>
		</div>
		<div class="clearfix"></div>
		
		
		<div class="vochers" style="border:1px solid #EEEEEE;margin-top:30px;padding: 0px;">
		<div style="background: #003B64;color:white;font-size:18px;line-height: 35px;border:0px solid red;padding-left: 20px;">课程介绍</div>
        <p style="padding: 20px;">
        ${kechen.content}
        </p>
	    </div>
	    
	    
	    
	    <div class="vochers" style="border:1px solid #EEEEEE;margin-top:30px;padding: 0px;">
		<div style="background: #003B64;color:white;font-size:18px;line-height: 35px;border:0px solid red;padding-left: 20px;">评论</div>
        <!-- 评论 -->
        
        <div class="m-vocher-text" style="width: 100%;margin-bottom: 20px;padding:0px 10px;">
		  <!-- s -->
		  
		  <div class="tab-pane" id="source">
		  <div class="response" style="padding-top: 20px;">
		  <c:forEach items="${pllist}" var="pinlun">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<h5 style="margin-left: 20px;"><a href="#">${pinlun.member.uname}</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>${pinlun.content}</p>
								<ul>
									<li>${pinlun.savetime}</li>
								</ul>
								<c:if test="${pinlun.hfcontent ne null}">
								<p style="color:red;"><span>管理员回复:</span>&nbsp;&nbsp;${pinlun.hfcontent}</p>
								</c:if>
							</div>
							<div class="clearfix"> </div>
						</div>
			</c:forEach>			
						
						
					</div>
        </div>
      </div>	
      
      
      <div class="feed-back-form" style="margin:220px 0px 30px 0px;padding:0px 10px;">
			<form action="pinlunAdd.do" method="post">
			<input type="hidden" name="kechenid" value="${kechen.id}"/>
			<span></span>
			<span style="color:red;">请在下方填写您评论</span>
			<div style="margin-top: 20px;">
			<textarea name="content"  style="border:1px solid #EEEEEE" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入内容...';}" required></textarea>
			<input type="submit" value="提交">
			</div>
			</form>
		</div>
        
        <!-- 评论 -->
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
<script src="jcount/jquery/jquery-1.8.2.min.js"></script>
<link href="jcount/jcountdown/jcountdown.css" rel="stylesheet" type="text/css">
<script src="jcount/jcountdown/jquery.jcountdown.min.js"></script>
<script type="text/javascript">

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>


function gotoExam(paperid){
	$.ajax({
		type:"post",
		url:"checkStatus.do?paperid="+paperid,
		date:"",
		success:function(res){
			if(res==1){
				layer.msg("你已参加过该考试，请至'考试记录'查看考试成绩!");
			}else if(res==-1){
				layer.msg("请先报名该课程!!");
			}else{
				location.href="toExam.do?id="+paperid;
			}
	    }
	})
}

function baoming(kcid){
	location.replace("baomingAdd.do?kcid="+kcid);
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

                $.ajax({
                    type:"post",
                    url:"updatecs.do?id="+veid,
                    date:"",
                    success:function(msg){

                        lookvedio(res);
                    }
                })

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


</script>
<script type="text/javascript" src="<%=path %>/js/hivideo.js"></script>
<c:if test="${msg ne null and msg ne ''}">
<script>
layer.msg('${msg}');
</script>
</c:if>

<c:if test="${message ne null and message ne ''}">
<script>
layer.msg('${message}');
</script>
</c:if>
</html>