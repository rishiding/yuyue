<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>预约记录管理</title>
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
	<form:form id="searchForm" modelAttribute="reserveRecord" action="${ctx}/reserve/reserveRecord/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>预约人</th>
				<th>预约医生</th>
				<th>预约日期</th>
				<th>预约时段</th>
				<th>预约状态</th>
				<th>创建日期</th>
				<th>病情</th>
				<shiro:hasPermission name="reserve:reserveRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="reserveRecord">
			<tr>
				<td>
					${reserveRecord.user.name}
				</td>
				<td>
					${reserveRecord.reserveUser.name}
				</td>
				<td>
					${reserveRecord.reserveDate}
				</td>
				<td>
					${reserveRecord.reserveTime}
				</td>
				<td>
					${reserveRecord.statusName}
				</td>
				<td>
					<fmt:formatDate value="${reserveRecord.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${reserveRecord.disease}
				</td>
				<shiro:hasPermission name="reserve:reserveRecord:edit"><td>
				<a href="${ctx}/reserve/reserveRecord/form?id=${reserveRecord.id}">修改</a>
					<a href="${ctx}/reserve/reserveRecord/delete?id=${reserveRecord.id}" onclick="return confirmx('确认要删除该预约记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>