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
	<title>课程管理</title>
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
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline" >
		      <form action="kechenList.do" method="post" id="searchform" name="searchform">
		      <div style="display: flex;">
		        <div>
		    	<input value="${key}" placeholder="请输入标题" name="key" class="layui-input search_input" type="text">
		    	</div>
		    	<div>
		    	  <select name="categoryid" id="categoryid" class="layui-input search_input">
		    	    <option value="">请选择类别</option>
					  	<c:forEach items="${ctlist}"  var="fcategory">
					  	  <option value="${fcategory.id}" ${fcategory.id eq categoryid?'selected':'' }>${fcategory.name}</option>
					  	</c:forEach>
		    	  </select>
		    	</div>
		    	</div>
		    <!-- <input type="submit" class="layui-btn" value="查询"> -->	
		      </form>
		    </div>
		    <a class="layui-btn"  href="javascript:void(0)" onclick="searchnew()">查询</a>
		</div><div class="layui-inline">
		<!-- <a class="layui-btn layui-btn-normal" href="skipKechen.do?flag=kechenadd">添加课程</a> -->
		</div>
	</blockquote>
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<tr>
							<th>课程名称</th>
							<th>课程类别</th>
							<th>授课教师</th>
							<th>是否推荐</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="kechen">
						<tr>
							<td>${kechen.kcname}</td>
							<td>${kechen.category.name}</td>
							<td>${kechen.teacher.tname}</td>
							<td>${kechen.istj}</td>
							<td>
							<c:choose>
							  <c:when test="${kechen.istj eq 'yes'}">
							  <a class="layui-btn layui-btn-mini" href="updateIstj.do?id=${kechen.id }">取消推荐</a>
							  </c:when>
							  <c:otherwise>
							  <a class="layui-btn layui-btn-mini" href="updateIstj.do?id=${kechen.id }">推荐</a>
							  </c:otherwise>
							</c:choose>
							   <a class="layui-btn layui-btn-mini" href="skipKechen.do?id=${kechen.id}"><i class="iconfont icon-edit"></i>编辑</a>
							   <a class="layui-btn layui-btn-danger layui-btn-mini" href="kechenDel.do?id=${kechen.id}" ><i class="layui-icon"></i> 删除</a>
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
			     <!-- 登录日志 -->
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="../layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="../layer/layer.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">




    function searchnew(){
      //${"#searchform"}.submit();
      searchform.submit()
      
    }



    var key = $("#key").val()==undefined?"":$("#key").val();
    var categoryid = $("#categoryid").val()==undefined?"":$("#categoryid").val();
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
                            location.replace("kechenList.do?pageNum="+currentpage+"&pageSize="+pageSize+"&key="+key+"&categoryid="+categoryid)
                        }
                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    }
                });
            });
</script>
</body>
</html>