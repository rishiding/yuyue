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
        <script>(function (doc, win) {
          var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
              var clientWidth = docEl.clientWidth;
              if (!clientWidth) return;
              docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
            };

          if (!doc.addEventListener) return;
          win.addEventListener(resizeEvt, recalc, false);
          doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);</script>
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
             <div align="right">
                <a href="${ctx}/register" class="current">注册    &nbsp;</a>|
                <a href="${ctx}/findpassword">&nbsp;忘记密码  &nbsp;</a>
            </div>
            <input class="weui_btn login-btn weui_btn_primary" type="submit" value="登 录"/>&nbsp;&nbsp;
            </form>        
         
        </div>
          <%@include file="/WEB-INF/views/include/m_footer.jsp" %>
    </body>
</html>