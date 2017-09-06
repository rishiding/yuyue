<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>密码修改-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
   <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/login.css"/>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>
       <link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
<script>
	var message="${message}";
	if(message){
		alert(message);
	}
	
	$(document).ready(function() {
		$("#oldPassword").focus();
		$("#inputForm").validate({
			rules: {
			},
			messages: {
				confirmNewPassword: {equalTo: "输入与上面相同的密码"}
			},
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
 <header>
       <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>密码修改</h1>
            </div>
        </header>
     <form id="inputForm" action="${ctx}/sys/user/modifyPwd" method="post" > 
         <article>
         <br>
         <input type="hidden" name="id" value="${user.id}">
        <ul class="xunjia-box">
        	<li class="inner">
                 <div class="item-name">旧密码:</div>
                  <div class="item-value">
                  <div class="input-wrap">
                         <input type="password" name="oldPassword"   />
                     </div>
                     </div>
               </li>               
              
               <li class="inner">
                  <div class="item-name">新密码:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                         <input type="password" name="newPassword"    />
                        </div>
                  </div>
               </li>
                <li class="inner">
                    <div class="item-name">确认新密码:</div>
                    <div class="item-value">
                   	<div class="input-wrap">
                         <input type="password" name="confirmNewPassword"   />
                        </div>
                  </div>
                </li>
               
                 
        </ul>
        </article>
            <div class="weui_cells weui_cells_access animated fadeInRight">            
			  <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                 		<input type="submit" value="保 存" class="weui_btn weui_btn_primary"/>
                    </div>
                </div>
              </a>
                
            </div>
            </form>    
          <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
    </body>
</html>