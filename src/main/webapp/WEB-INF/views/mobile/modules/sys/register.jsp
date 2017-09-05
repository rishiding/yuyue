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
         <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/xunjia_wuliao_baojia.css"/>
          <style type="text/css">
			 .msgs{display:inline-block;width:90px;color:#fff;font-size:12px;border:1px solid #0697DA;text-align:center;height:36px;line-height:36px;background:#0697DA;cursor:pointer;}
			form .msgs1{background:#E6E6E6;color:#818080;border:1px solid #CCCCCC;}
			 </style>
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
        
         <article style="bottom: 0;">
          <form action="${ctx}/sys/user/save" method="post">
            <ul class="xunjia-box">
                
                <li class="inner">
                    <div class="item-name">证件类型：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                       		<select name="cardType" >
                       			
								<c:forEach items="${fns:getDictList('card_type')}" var="obj">
								<option value="${obj.value}">${obj.label}</option>
								</c:forEach>
							</select>
                        </div>
                    </div>
                </li>
                <li class="inner">
                    <div class="item-name">证件号码：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" name="cardNo">
                        </div>
                    </div>
                </li>
                <li class="inner">
                    <div class="item-name">用户名：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" name="username">
                        </div>
                    </div>
                </li>
                <li class="inner">
                    <div class="item-name">密码：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" name ="password">
                        </div>
                    </div>
                </li>
                <li class="inner">
                    <div class="item-name">手机号码：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" id="mobile" name="mobile">
                        </div>
                    </div>
                </li>
               
                <li class="inner innerP">
                    <div class="item-name">验证码：</div>
                    <div class="item-value">
                        <div class="p-wrap">
                        <input type="text" id="code" name="code" maxlength="30" placeholder="手机验证码" class="register-input" style="width:100px"/><span class="msgs">获取验证码</span>
                           
                        </div>
                    </div>
                </li>
               
            </ul>
             <input class="weui_btn login-btn weui_btn_primary" type="submit" value="注册"/>&nbsp;&nbsp;
            </form>
        </article>
        
        <footer>
           
        </footer>

        <script src="${ctxStatic}/mobile/lib/jquery-2.1.4.js"></script>
        <script src="${ctxStatic}/mobile/js/jquery-weui.js"></script>
          
        <script type="text/javascript">
        $(function() {
            //获取短信验证码
    		var validCode=true;
    		$(".msgs").click (function  () {
    			var phone=$("#mobile").val();
    			if(!phone){
    				alert("请先输入手机号");
    				return;
    			}
    			var code=$(this);
    			$.ajax({
    				url:"${front}/sendCode?phone="+phone,
    				type:"get",
    				dataType:"json",
    				success:function(res){
    					if(res == true){
    						var time=60;
    						
    						if (validCode) {
    							validCode=false;
    							code.addClass("msgs1");
    							var t=setInterval(function  () {
    								time--;
    								code.html(time+"秒重新获取");
    								if (time==0) {
    									clearInterval(t);
    									code.html("重新获取");
    									validCode=true;
    									code.removeClass("msgs1");	
    								}
    							},1000);
    						}
    					}else{
    						alert("验证码发送失败");
    						
    					}
    				}
    			});
    			
    		});
    		
    		$("#code").change(function(){
    			var phone=$("#mobile").val();
    			if(!phone){
    				alert("请先输入手机号");
    				return;
    			}
    			var $this = $(this);
    			var val = $(this).val();
    			if(val.length!=4){
    				$(this).css({"border-color":"red"});
    				codeflag = false;
    				alert("验证码不正确")
    				return;
    			}
    			$(this).css({"border-color":""});
    			$.ajax({
    				url:"${front}/checkPhoneCode?code="+val+"&phone="+phone,
    				type:"get",
    				dataType:"json",
    				success:function(res){
    					if(res == true){
    						codeflag = true;
    						$this.css({"border-color":""});
    					}else{
    						codeflag = false;
    						alert("验证码不正确");
    						$this.css({"border-color":"red"});
    					}
    				}
    			});
    		});
        });
        </script>
    </body>
</html>