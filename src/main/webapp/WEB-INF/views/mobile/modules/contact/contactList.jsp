<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>联系人管理</title>
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
		<li class="active"><a href="${ctx}/contact/contact/">联系人列表</a></li>
		<shiro:hasPermission name="contact:contact:edit"><li><a href="${ctx}/contact/contact/form">联系人添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contact" action="${ctx}/contact/contact/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>昵称</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>电话</th>
				<th>身高</th>
				<th>体重</th>
				<th>创建时间</th>
				<th>备注</th>
				<shiro:hasPermission name="contact:contact:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contact">
			<tr>
				<td><a href="${ctx}/contact/contact/form?id=${contact.id}">
					${contact.name}
				</a></td>
				<td>
					${contact.nickName}
				</td>
				<td>
					${contact.genderName}
				</td>
				<td>
					${contact.birthday}
				</td>
				<td>
					${contact.telphone}
				</td>
				<td>
					${contact.height}
				</td>
				<td>
					${contact.weight}
				</td>
				<td>
					<fmt:formatDate value="${contact.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${contact.remarks}
				</td>
				<shiro:hasPermission name="contact:contact:edit"><td>
    				<a href="${ctx}/contact/contact/form?id=${contact.id}">修改</a>
					<a href="${ctx}/contact/contact/delete?id=${contact.id}" onclick="return confirmx('确认要删除该联系人吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>