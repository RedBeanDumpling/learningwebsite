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
			  <li class="active">试卷预览</li>
			</ol>
	<!----->
	<div class="contact" style="border:0px solid red;">

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
	        	考试时长：${paper.testtime }分钟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	        <div class="layui-card-header"><b>${detail.qno}. ${detail.question.title }</b> &nbsp;&nbsp;(${detail.question.score}分)&nbsp;&nbsp; <font color="blue"><b>标准答案：${detail.question.answer }</b></font></div>
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
	        <div class="layui-card-header"><b>${detail.qno}. ${detail.question.title }</b> &nbsp;&nbsp;(${detail.question.score}分)&nbsp;&nbsp; <font color="blue"><b>标准答案：${detail.question.answer }</b></font></div>
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
window.onload = function() {
    var btn = document.getElementById("all");
    btn.onclick = function() {
        var flag = this.checked;
        var items = document.getElementsByName("options");
        for (var i = 0; i < items.length; i++) {
            items[i].checked = flag;//将所有item的状态设为全选按钮的状态
        }
    }


    var items = document.getElementsByName("options");
    for (var i = 0; i < items.length; i++) {
        items[i].onclick = function() {//对每个item设置点击
            var number = 0;//记录选中的个数
            for (var j = 0; j < items.length; j++) {
                if (items[j].checked) {
                    number++;
                }
            }
            document.getElementById("all").checked = (items.length == number);
        }
    }
    

	
}

function sub(){
    var ids = [];
	$.each($('input[name*="options"]:checked'),function (k,v) {
	    ids.push(v.value);
	});

	if (0 == ids.length) {
	    layer.msg("至少选择一个答案");
	    return false;
	}
	
	var myselect = document.getElementById("type");
	var index=myselect.selectedIndex ; 
	var type = myselect.options[index].value;
	if(type == "1"){//单选
		if (ids.length > 1) {
		    layer.msg("单选题只能选择一个答案");
		    return false;
		}
	}else if(type == "2"){//多选
		if (ids.length <= 1) {
		    layer.msg("多选题需要选择多个答案");
		    return false;
		}
	}
}
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