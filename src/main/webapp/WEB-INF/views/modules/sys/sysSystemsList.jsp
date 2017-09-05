<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>单表管理</title>
	<meta name="decorator" content="default"/>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sysSystems/">系统列表</a></li>
		<shiro:hasPermission name="sys:sysSystems:edit"><li><a href="${ctx}/sys/sysSystems/form">系统添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysSystems" action="${ctx}/sys/sysSystems/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>系统名：</label>
				<form:input path="name" htmlEscape="false" maxlength="128" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>系统名</th>
				<th>访问地址</th>
				<th>图标</th>
				<th>备注</th>
				<shiro:hasPermission name="sys:sysSystems:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysSystems">
			<tr>
				<td><a href="${ctx}/sys/sysSystems/form?id=${sysSystems.id}">
					${sysSystems.name}
				</a></td>
				<td>
					${sysSystems.url}
				</td>
				<td>
					${sysSystems.icon}
				</td>
				<td>
					${sysSystems.note}
				</td>
				<shiro:hasPermission name="sys:sysSystems:edit"><td>
    				<a href="${ctx}/sys/sysSystems/form?id=${sysSystems.id}">修改</a>
					<a href="${ctx}/sys/sysSystems/delete?id=${sysSystems.id}" onclick="return confirmx('确认要删除该单表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>