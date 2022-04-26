<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户信息</title>
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
	<link rel="stylesheet" type="text/css" href="../css/page.css">
	

</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline" >
		      <form action="memberList.do" method="post" id="searchform" name="searchform">
		      <div style="display: flex;">
		        <div>
		    	<input value="${key}" id="key" placeholder="用户名或姓名" name="key" class="layui-input search_input" type="text">
		    	</div>
		    	<div>
		    	  <select name="utype" id="utype" lay-filter="utype"  class="layui-input search_input">
		    	    <option value="">请选择类别</option>
		    	    <option value="学生" ${utype eq '学生'?'selected':''}>学生</option>
		    	    <option value="老师" ${utype eq '老师'?'selected':''}>老师</option>
		    	  </select>
		    	</div>
		    	</div>
		    <!-- <input type="submit" class="layui-btn" value="查询"> -->	
		      </form>
		    </div>
		    <a class="layui-btn"  href="javascript:void(0)" onclick="searchnew()">查询</a>
		</div>
                <!--
		<div class="layui-inline">
		<a class="layui-btn layui-btn-normal" href="javascript:void(0)" onclick="importuser()">导入</a>
		</div>
		-->
		<div class="layui-inline">
		<a class="layui-btn layui-btn-normal" href="javascript:void(0)" onclick="exportB('${key}','${utype }')">导出</a>
		</div>
	</blockquote>
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<tr>
							<th>用户名</th>
							<th>密码</th>
							<th>姓名</th>
							<th>电话</th>
							<th>邮箱</th>
							<th>注册类型</th>
							<th>审核状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="member">
						<tr>
							<td>${member.uname}</td>
							<td>******</td>
							<td>${member.tname}</td>
							<td>${member.tel}</td>
							<td>${member.email}</td>
							<td>${member.utype}</td>
							<td>${member.shstatus}</td>
							<td>
							<c:if test="${member.utype eq '老师' and member.shstatus eq '待审核'}">
							<a class="layui-btn layui-btn-mini" href="teaSh.do?id=${member.id}&flag=1">通过</a>
							<a class="layui-btn layui-btn-mini" href="teaSh.do?id=${member.id}&flag=2">拒绝</a>
							</c:if>
							<a class="layui-btn layui-btn-danger layui-btn-mini" href="memberDel.do?id=${member.id}" ><i class="layui-icon"></i> 删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center"  colspan="9">
                        <div id="demo1" style="text-align: center"></div>
                    </td>
                  </tr>
					</tbody>
					</table>
                     <div class="larry-table-page clearfix">
			         </div>
			    </div>
			     <!-- 登录日志 -->
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="../layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="../layer/layer.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">

	function deleteAll(){

    	layer.confirm('是否确认删除？', {
      	  btn: ['是','否'] //按钮
      	}, function(){

      	  var len = $("input[name='checked']:checked").length;	
      	  if(len!=0){
      	  var checkedbox = $("input[name='checked']:checked");
      	  var arr = new Array();
            $(checkedbox).each(function(i){
                arr[i] = $(this).val();
            });
            var vals = arr.join(",");
            $.ajax({
      		type:"post",
      		url:"memberDelAll.do?vals="+vals,
      		date:"",
      		success:function(msg){
      			location.replace("memberList");
      		  }
            })
      	  }else{
				layer.msg("请选择要删除的项");
          	  }
            
            
      	}, function(){
      	});
	  //var $checkbox = $("input[name='checked']");
	  //var len = $("input[name='checked']:checked").length;
      
    }

    function searchnew(){
      //${"#searchform"}.submit();
      searchform.submit()
      
    }

    function importuser(){
		location.href="memberimport.jsp";
	}

    function exportB(key,utype){
		location.href="exportB.do?key="+key+"&utype="+utype;
	}
</script>
<script type="text/javascript">

    var fid
    layui.use('form', function() {
        var form = layui.form;
        form.on('select(utype)',function(){
            utype = $("#utype").val();
            alert(utype)
        })

    })


    var key = $("#key").val()==undefined?"":$("#key").val();
    var utype = $("#utype").val()==undefined?"":$("#utype").val();
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
                            location.replace("memberList.do?pageNum="+currentpage+"&pageSize="+pageSize+"&key="+utype+"&key="+utype)
                        }
                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    }
                });
            });


</script>
</body>
</html>