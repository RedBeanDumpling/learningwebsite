<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>添加用户</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	<script type="text/javascript" src="<%=path %>/layer/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
	
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/easyform.css">
  	<script type="text/javascript" src="<%=path %>/js/easyform.js"></script>
  	
  	
  	 	<script type="text/javascript">
$(document).ready(function ()
   {
       var ef = $('#updateform').easyform();
});

</script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>添加用户</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" id="updateform" method="post" action="<%=path %>/admin/memberAdd.do">
			 	<input type="hidden" name="delstatus" value="0"/>
			 	
			 	<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
					  	<input type="text" name="uname" id="uname" onblur="checkUname()"  style="width: 300px;"   autocomplete="off"  class="layui-input"  >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">  
					  	<input type="password" name="upass" id="upass" required style="width: 300px;"  autocomplete="off"  class="layui-input"  placeholder="密码">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">  
					  	<input type="text" name="tname"  style="width: 300px;" required autocomplete="off"  class="layui-input"  placeholder="请输入真实姓名">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline" style="width: 290px; ">
						<select name="sex" class="newsLook" lay-filter="browseLook" style="width: 300px; ">
				        	<option value="男">男</option>
				        	<option value="女" >女</option>
				    	</select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input placeholder="开放浏览" value="开放浏览" readonly="" class="layui-input layui-unselect" type="text"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="0" class="layui-this">开放浏览</dd><dd lay-value="1" class="">用户浏览</dd></dl></div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">出生年月</label>
					<div class="layui-input-block">  
					  	<input type="date" name="brithtime" id="brithtime"  required oninvalid="setCustomValidity('出生年月不能为空')" oninput="setCustomValidity('');"   style="width: 300px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-block">  
					  	<input type="text" name="tel" id="tel" required oninvalid="setCustomValidity('请输入11位数字或非法输入')" oninput="setCustomValidity('');" pattern="[1][3,4,5,7,8][0-9]{9}"  style="width: 300px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">爱好</label>
					<div class="layui-input-block">  
					  	<textarea rows="" cols="" name="aihao" style="width: 540px;height: 100px;"></textarea>
					</div>
				</div>
				
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
	});

	$(document).ready(function ()
			   {
			          
			       var v = $('#userupdate').easyform();
			});



	function checkUname(){
		var uname = $("#uname").val();
		$.ajax({
			type:"post",
			url:"/learningwebsite/checkUname.do?uname="+uname,
			date:'',
			success:function(msg){
				if(msg==1){
					layer.msg("已存在的用户名");
					$("#uname").val("");
				}
			}
		})
	}
</script>
<c:if test="${suc !=null&&suc ne '' }">
<script type="text/javascript">
layer.msg("${suc}");
</script>
</c:if>
</body>
</html>