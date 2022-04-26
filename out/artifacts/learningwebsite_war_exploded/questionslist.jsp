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
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
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
			  <li class="active">题库列表</li>
			</ol>
	<!----->
	<div class="contact">
	<div class="contact-form">
					<div class="col-md-6 contact-grid" style="border:0px solid red;width: 100%">
					<div class="layui-form news_list" >
					<form action="questionsList.do" method="post" name="regForm">
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<th colspan="8">
						  <div class="layui-form-item">
						    <div class="layui-inline">
						      <div class="layui-input-inline">
						        <input value="${key}" id="key" autocomplete="off" style="width: 200px;" placeholder="请输入题目" name="key" class="layui-input search_input" type="text">
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
						      <div class="layui-input-inline">
						        <select name="type" id="type" lay-search="">
									  	<option value="">请选择试题类型</option>
									  	  <option value="1" ${type eq "1"?"selected":"" }>单选题</option>
									  	  <option value="2" ${type eq "2"?"selected":"" }>多选题</option>
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
						    <th>试题题目</th>
						    <th>试题答案</th>
						    <th>题目类型</th>
						    <th>分值 </th>
						    <th>正确率 </th>
							<th>出题教师</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="questions">
						<tr>
							<th>${questions.kechen.kcname}</th>
							<td style="text-align: left;width: 400px">${questions.title}</td>
							<td>${questions.answer}</td>
							<td>${questions.type eq "1"?"单选":"多选"}</td>
							<td>${questions.score}分</td>
							<td>${questions.zql}</td>
							<th>${questions.teacher.tname}</th>
							<td>
							<a class="layui-btn  layui-btn-mini" href="toQuestionsEdit.do?id=${questions.id}">编辑</a>
							<a class="layui-btn  layui-btn-mini" href="questionsDel.do?id=${questions.id}">删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center"  colspan="7">
                        <c:if test="${fn:length(pageInfo.list) gt 0}">
                            <div id="demo1" style="text-align: center"></div>
                        </c:if>
                    </td>
                    <td>
                    	<a class="layui-btn  layui-btn-mini" href="toQuestionsAdd.do">添加试题</a>
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
</body>
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
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
var type = $("#type").val()==undefined?"":$("#type").val()
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
                        location.replace("questionsList.do?pageNum="+currentpage+"&pageSize="+pageSize+"&key="+key+"&type="+type+"&kcid="+kcid)
                    }
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                }
            });
        });


</script>
</html>