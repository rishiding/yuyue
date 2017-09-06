  <link rel="stylesheet" href="${ctxStatic}/mobile/fonts/iconfont.css"/>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/font.css"/>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css"/>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/weui.min.css"/>
 <link rel="stylesheet" href="${ctxStatic}/mobile/css/jquery-weui.min.css"/>
 <link rel="stylesheet" href="${ctxStatic}/mobile/css/animate.css"/>
 <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
 <script src="${ctxStatic}/layer/layer.js"></script>
<script src="${ctxStatic}/mobile/js/jquery-weui.js"></script>
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
        })(document, window);
</script>
          