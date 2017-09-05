<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>注册-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/login.css"/>
         <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>
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
                <h1>${fns:getConfig('productName')}</h1>
            </div>
        </header>
        
         <article style="bottom: 0;">
          <form action="${ctx}/sys/user/save" id="jvForm" method="post">
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
                    <div class="item-name">姓名：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" name="name">
                        </div>
                    </div>
                </li>
                <li class="inner">
                    <div class="item-name">登录账名：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" name="loginName">
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
             <input class="weui_btn login-btn weui_btn_primary" type="button" onclick="javascript:reg_click();" value="注册"/>&nbsp;&nbsp;
            </form>
        </article>
        	 <%@include file="/WEB-INF/views/include/m_footer.jsp" %>

        
        <script type="text/javascript">
        var codeflag = false;
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
    				url:"${front}/sms/sendCode?phone="+phone,
    				type:"get",
    				dataType:"json",
    				success:function(res){
    					if(res.code == '200'){
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
    				url:"${front}/sms/checkPhoneCode?code="+val+"&phone="+phone,
    				type:"get",
    				dataType:"json",
    				success:function(res){
    					if(res.code == '200'){
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
        function reg_click(){
        	
    	   
    	    	if(!codeflag){
    	    		alert("验证码不正确");
    	    		return;
    	    	}
    	    	console.info($("#jvForm").serialize());
    	    	$.ajax({
    	    		url:"${front}/sms/register",
    				type:"post",
    				data: $("#jvForm").serialize(),
    				dataType:"json",
    				success:function(res){
    					if(res.code == '200'){
    						alert(res.message);
    						history.go(-1);
    					}else{
    						
    						alert(res.message);
    						
    					}
    				}
    	    	});
    	    	
    	   
        }
        </script>
    </body>
</html>