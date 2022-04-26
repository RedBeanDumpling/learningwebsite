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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<!-- start menu -->

<link href="layui/css/layui.css" rel="stylesheet" type="text/css" media="all" />

<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/menu.css" />
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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="/learningwebsite/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="/learningwebsite/kindeditor/lang/zh-CN.js"></script>
<script>
KindEditor.ready(function(K) {
window.editor = K.create('#editor_id');
});
</script>
<script>
KindEditor.ready(function(K) {
K.create('textarea[name="content"]', {
uploadJson : '/learningwebsite/kindeditor/jsp/upload_json.jsp',
fileManagerJson : '/learningwebsite/kindeditor/jsp/file_manager_json.jsp',
allowFileManager : true,
allowImageUpload : true, 
autoHeightMode : true,
afterCreate : function() {this.loadPlugin('autoheight');},
afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
});
});
</script>
<style type="text/css">
.contact-grid input[type="email"],.contact-grid select,.contact-grid input[type="date"] {
  width: 100%;
  padding:0.8em;
  margin: 0 0 0.8em 0;

  background: #fff;
  outline: none;
  border: 1px solid #DADADA;
  -webkit-appearance: none;
}
</style>
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
			  <li class="active">正在考试...</li>
			</ol>
	<!----->
	<div class="contact" style="border:0px solid red;">

<form id="regForm" action="examSub.do" method="post" name="regForm" onsubmit="return sub()">
<input type="hidden" id="ids" name="ids" value="${ids }">
<input type="hidden" id="paperid" name="paperid" value="${paper.id }">
	<div class="contact-form" style="border:0px solid red;">
	
	<div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md12">
	      <div class="layui-card">
	        <div class="layui-card-body">
	        	<h3>${paper.title }</h3>
	        	课程：《${paper.kechen.kcname }》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	组卷教师：${paper.teacher.tname }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	总分：${paper.score }分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	考试时长：${paper.testtime }分钟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
	        	<div id="time" style="color: red;"></div>
			</div>
	      </div>
	    </div>
	  </div>
	</div> 
	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>单选题(${fn:length(paper.detailList1) }道)</legend>
	</fieldset> 
	
	<c:forEach items="${paper.detailList1 }" var="detail">	
	<div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md12">
	      <div class="layui-card">
	        <div class="layui-card-header"><b>${detail.qno}. ${detail.question.title }</b> &nbsp;&nbsp;(${detail.question.score}分)&nbsp;&nbsp; </div>
	        <div class="layui-card-body">
	        <table class="layui-table" lay-size="sm" lay-skin="nob">
			  <tbody>
			  <c:forEach items="${detail.question.answerslist }" var="answers">
			    <tr>
			      <td style="width: 30px">
			      
			      <input type="radio" id="an${answers.questionid }" name="an${answers.questionid }" value="${answers.option }"  > 
			      
			      </td>
			      <td style="width: 30px">${answers.option }.</td>
			      <td>${answers.content }</td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
	        
	        <br/>
	       
	        </div>
	      </div>
	    </div>
	  </div>
	</div> 
	</c:forEach>	
	
	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>多选题(${fn:length(paper.detailList2) }道)</legend>
	</fieldset> 
	
	<c:forEach items="${paper.detailList2 }" var="detail">	
	<div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md12">
	      <div class="layui-card">
	        <div class="layui-card-header"><b>${detail.qno}. ${detail.question.title }</b> &nbsp;&nbsp;(${detail.question.score}分)&nbsp;&nbsp; </div>
	        <div class="layui-card-body">
	        <table class="layui-table" lay-size="sm" lay-skin="nob">
			  <tbody>
			  <c:forEach items="${detail.question.answerslist }" var="answers">
			    <tr>
			      <td style="width: 30px">
			      	<input type="checkbox" id="an${answers.questionid }" name="an${answers.questionid }" value="${answers.option }"  > 
			      </td>
			      <td style="width: 30px">${answers.option }.</td>
			      <td>${answers.content }</td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
	        
	        <br/>
	       
	        </div>
	      </div>
	    </div>
	  </div>
	</div> 
	</c:forEach>	
			
			<div class="layui-form-item">
					<button type="submit" class="layui-btn" lay-submit="" >交卷</button>
			</div>
  
				<div class="clearfix"> </div>
			   </div>
			   
			   </form>
			   
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


function sub(){
    var ids = [];
	$.each($('input[name*="an"]:checked'),function (k,v) {
	    ids.push(v.value);
	});

	if (0 == ids.length) {
	    layer.msg("不要交白卷撒，多少做两道题嘛!");
	    return false;
	}
	
}
var fzs = ${paper.testtime};
var times = parseInt(fzs) * 60;//剩余时间,单位秒
     var timeDiv = document.getElementById("time");
     var timeObj = null;
     function timer(){
         if(times == 0){
             //倒计时结束，提交表单
             document.getElementById("regForm").submit();
             window.clearInterval(timeObj);
             return;
         }
         var t = "考试还剩余:"+Math.floor(times/60) +"分"+times%60+"秒"
         timeDiv.innerHTML = t;
         times --;
     }
     timeObj = window.setInterval(timer,1000);

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>

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