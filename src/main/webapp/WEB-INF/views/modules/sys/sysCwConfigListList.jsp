<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>床位一览表配置管理</title>
	<meta name="decorator" content="default"/>
<!-- 	<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css" /> -->
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<style type="text/css">
	
	。myTable{
	text-align: center;
	}	
		
	.myTable th{
	text-align: center;
	}
	 
	.myTable td{
	text-align: center; 
	}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sysCwConfigList/">床位一览表配置列表</a></li>
<%-- 		<shiro:hasPermission name="sys:sysCwConfigList:edit"><li><a href="${ctx}/sys/sysCwConfigList/form">床位一览表配置添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="sysCwConfigList" action="${ctx}/sys/sysCwConfigList/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul> 
	</form:form>
	<sys:message content="${message}"/>
	<table  class="table table-bordered myTable">
		<thead>
			<tr>
			    <th>标识颜色</th>
				<th>标识</th>
				<th>显示名字</th>
				<th>标签</th>
				<th>更新日期</th>
				<th>备注</th>
				<shiro:hasPermission name="sys:sysCwConfigList:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysCwConfigList">
			<tr>
				<td><div style ="margin:0 auto;width:40px; height:16px; background-color: ${sysCwConfigList.color}; border-radius:25px;" /></td>
				<td><a href="${ctx}/sys/sysCwConfigList/form?id=${sysCwConfigList.id}">
					${sysCwConfigList.name}
				</a></td>
				<td>
					${sysCwConfigList.displayName}
				</td>
				<td>
					${sysCwConfigList.label} 
				</td>
				<td>
					<fmt:formatDate value="${sysCwConfigList.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysCwConfigList.remarks}
				</td>
				<shiro:hasPermission name="sys:sysCwConfigList:edit"><td>
    				<a class="btn" href="${ctx}/sys/sysCwConfigList/form?id=${sysCwConfigList.id}">修改</a>
					<a class="btn" href="${ctx}/sys/sysCwConfigList/delete?id=${sysCwConfigList.id}" onclick="return confirmx('确认要删除该床位一览表配置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>