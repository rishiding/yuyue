<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>找回密码-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/login.css"/>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>
          <style type="text/css">
			 .msgs{display:inline-block;width:90px;color:#fff;font-size:12px;border:1px solid #0697DA;text-align:center;height:36px;line-height:36px;background:#0697DA;cursor:pointer;}
			form .msgs1{background:#E6E6E6;color:#818080;border:1px solid #CCCCCC;}
			 </style>
      
    </head>
    <body>
        <header>
            <div class="titlebar reverse">
                <a href="javascript:history.go(-1)">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>找回密码</h1>
            </div>
        </header>
        
         <article style="bottom: 0;">
          <form  id="jvForm">
            <ul class="xunjia-box">             
             <div id="pass1" >
                <li class="inner">
                    <div class="item-name">登录账名：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="text" name="loginName"  id="loginName">
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
               <input class="weui_btn login-btn weui_btn_primary" type="button" onclick="javascript:check_click();" value="确认"/>&nbsp;&nbsp;
            </div>
            <div id="pass2" style="display:none">
            <li class="inner">
                    <div class="item-name">密码：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="password" id ="password" name ="password">
                        </div>
                    </div>
                </li>
                 <li class="inner">
                    <div class="item-name">重复密码：</div>
                    <div class="item-value">
                        <div class="input-wrap">
                            <input type="password"  id ="newpassword" name ="newpassword">
                        </div>
                    </div>
                </li>
                <input class="weui_btn login-btn weui_btn_primary" type="button" onclick="javascript:find_click();" value="确认"/>&nbsp;&nbsp;
                </div>
              </ul>
              
              
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
    				layer.msg("请先输入手机号");
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
    						
    					}else{
    						layer.msg("验证码发送失败");
    						
    					}
    				}
    			});
    			
    		});
    		
    		$("#code").change(function(){
    			var phone=$("#mobile").val();
    			if(!phone){
    				layer.msg("请先输入手机号");
    				return;
    			}
    			var $this = $(this);
    			var val = $(this).val();
    			if(val.length!=4){
    				$(this).css({"border-color":"red"});
    				codeflag = false;
    				layer.msg("验证码不正确")
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
    						layer.msg("验证码不正确");
    						$this.css({"border-color":"red"});
    					}
    				}
    			});
    		});
        });
        
        function check_click(){      	
     	   
	    	
	    	var phone=$("#mobile").val();
	    	var loginName=$("#loginName").val();
	    	if(loginName==""){
	    		layer.msg("登录账号不能为空");
	    		$("#loginName").focus();
	    		return ;
	    	}
	    	if(phone==""){
	    		layer.msg("手机号不能为空");
	    		$("#mobile").focus();
	    		return ;
	    	}
	    	if(!codeflag){
	    		layer.msg("验证码不正确");
	    		return;
	    	}
	    	$.ajax({
	    		url:"${front}/sms/findUser",
				type:"post",
				data: $("#jvForm").serialize(),
				dataType:"json",
				success:function(res){
					if(res.code == '200'){
						 $("#pass2").show();
						 $("#pass1").hide();
					}else{
						
						layer.msg(res.message);
						
					}
				}
	    	});
	    	
	   
    }
        
        function find_click(){      	
    	   
    	    	
    	    	var pass1=$("#password").val();
    	    	var pass2=$("#newpassword").val();
    	    	if(pass1&&pass2){
    	    		if(pass1!=pass2){
    	    			layer.msg("两次密码不一致");
    	    			return;
    	    		}
    	    	}else{
    	    		if(pass1==""){
    	    			layer.msg("密码不能为空");
    	    			$("#password").focus();
        	    		return;
    	    		}
    	    		if(pass2==""){
    	    			layer.msg("重复密码不能为空");
    	    			$("#newpassword").focus();
        	    		return;
    	    		}
    	    		
    	    	}
    	    	if(!codeflag){
    	    		layer.msg("验证码不正确");
    	    		return;
    	    	}
    	    	$.ajax({
    	    		url:"${front}/sms/resetpassword",
    				type:"post",
    				data: $("#jvForm").serialize(),
    				dataType:"json",
    				success:function(res){
    					if(res.code == '200'){
    						layer.msg(res.message);
    						history.go(-1);
    					}else{
    						
    						layer.msg(res.message);
    						
    					}
    				}
    	    	});
    	    	
    	   
        }
        </script>
    </body>
</html>