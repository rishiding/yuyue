<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>${fns:getConfig('productName')}</title>
        <link rel="stylesheet" href="${ctxStatic}/mobile/fonts/iconfont.css"/>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/font.css"/>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/weui.min.css"/>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/jquery-weui.min.css"/>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css"/>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/animate.css"/>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/person_info.css"/>
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
        <header>
            <div class="titlebar reverse">
                <a href="javascript:history.go(-1)">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>注册</h1>
            </div>
        </header>
        <article style="bottom: 54px;">
            <div class="weui_cells weui_cells_access animated fadeInRight">
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                        <div class="label weui-col-20">姓名:</div>
                        <div class="weui-col-80">uimaker</div>
                    </div>
                </div>
              </a>
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                        <div class="label weui-col-20">手机:</div>
                        <div class="weui-col-60">13338949806</div>
                        <div href="javascript:;" class="weui_btn weui_btn_mini weui_btn_warn">按钮</div>
                    </div>
                </div>
              </a>
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                        <div class="label weui-col-20">邮箱:</div>
                        <div class="weui-col-60">admin@uimaker.com</div>
                        <div href="javascript:;" class="weui_btn weui_btn_mini weui_btn_primary">按钮</div>
                    </div>
                </div>
              </a>
              <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                        <div class="label weui-col-20">组织:</div>
                        <div class="weui-col-80">南京信息科技有限公司</div>
                    </div>
                </div>
              </a>
            </div>
        </article>        
        
    </body>
</html>