<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>${fns:getConfig('productName')}</title>
        <%@include file="/WEB-INF/views/include/m_head.jsp" %>

        <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/login.css"/>
        <script type="text/javascript">
        var message="${message}";
    	if(message){
    		layer.msg(message);
    	}
    	$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
        </script>
        <style type="text/css">
        </style>
    </head>
    <body>
        <div class="header">
            <img src="${ctxStatic}/mobile/images/login_logo_w.png">

            <h2> </h2>
        </div>
        <div class="login-wrap">
         <form action="${ctx}/login" method="post">
            <div class="login-box">               
                    <div class="input-wrap">
                        <input type="text" name="username" placeholder="请填写登录账号">
                    </div>
            </div>
            <br>
             <div class="login-box">  
                    <div class="input-wrap">
                        <input type="password" name="password" placeholder="请填写登录密码">
                    </div>                           
            </div>
             <br>
            <c:if test="${isValidateCodeLogin}">
             <div class="login-box">  
             <div class="input-wrap">                      

                        <sys:validateCode name="validateCode" inputCssStyle="width:120px;"/>
                    </div>
                    </div>
            <br></c:if>
           
             <div align="right">
                <a href="${ctx}/register" class="current">注册    &nbsp;</a>|
                <a href="${ctx}/findpassword">&nbsp;忘记密码  &nbsp;</a>
            </div>
            
            <br>
            <input class="weui_btn login-btn weui_btn_primary" type="submit" value="登 录"/>&nbsp;&nbsp;
            </form>        
         
        </div>
          <%@include file="/WEB-INF/views/include/m_footer.jsp" %>
    </body>
</html>