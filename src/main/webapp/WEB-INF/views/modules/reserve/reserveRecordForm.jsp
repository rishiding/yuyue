<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>预约记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/reserve/reserveRecord/list">预约记录列表</a></li>
		<li class="active"><a href="${ctx}/reserve/reserveRecord/form?id=${reserveRecord.id}">预约记录<shiro:hasPermission name="reserve:reserveRecord:edit">${not empty reserveRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="reserve:reserveRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="reserveRecord" action="${ctx}/reserve/reserveRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">病人名字：</label>
			<div class="controls">
				<form:hidden path="user.id"/>
				${reserveRecord.user.name}
				
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预约医生：</label>
			<div class="controls">
			<sys:treeselect id="reserveUser" name="reserveUserId" value="${reserveRecord.reserveUser.id}" labelName="reserveUser.name" labelValue="${reserveRecord.reserveUser.name}"
					title="医生" url="/sys/user/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预约日期：</label>
			<div class="controls">
				<input id="reserveDate" name="reserveDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
				value="${reserveRecord.reserveDate}"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预约时段：</label>
			<div class="controls">
			
				<form:select path="reserveTime" class="input-medium">
					<form:options items="${fns:getDictList('reserve_time')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预约类型 :</label>
			<div class="controls">
					<form:select path="reserveType" class="input-medium">
					<form:options items="${fns:getDictList('reserve_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">病情：</label>
			<div class="controls">
				<form:textarea path="disease" htmlEscape="false" rows="4" maxlength="500" class="input-xxlarge "/>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="reserve:reserveRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>