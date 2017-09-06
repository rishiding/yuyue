<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>个人信息-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>

<script>
	var message="${message}";
	if(message){
		alert(message);
	}
</script>     
</head>

<body>
 <header>
       <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>个人资料</h1>
            </div>
        </header>
     <form id="jvForm" action="${ctx}/sys/user/info" method="post" > 
         <article>
         <br>
         <input type="hidden" name="id" value="${user.id}">
        <ul class="xunjia-box">
        	<li class="inner">
                 <div class="item-name">登录账号:</div>
                  <div class="item-value">${user.name}</div>
               </li>               
              
               <li class="inner">
                  <div class="item-name">姓名:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="name" value="${user.name}"   />
                        </div>
                  </div>
               </li>
                <li class="inner">
                    <div class="item-name">手机:</div>
                    <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="mobile" value="${user.mobile}"   />
                        </div>
                  </div>
                </li>
               <li class="inner">
                  <div class="item-name">性别:</div>
                  <div class="item-value">
                   	<div class="input-wrap">                   	  
					           <select name="gender" >                       			
								<c:forEach items="${fns:getDictList('sex')}" var="obj">
								<option value="${obj.value}" <c:if test="${obj.value==user.gender}">selected</c:if> >${obj.label}</option>
								</c:forEach>
							</select>
					    </div>
                       
                  </div>
               </li>
               <li class="inner">
                  <div class="item-name">证件类型:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                        <select name="cardType" >                       			
								<c:forEach items="${fns:getDictList('card_type')}" var="obj">
								<option value="${obj.value}" <c:if test="${obj.value==user.cardType}">selected</c:if> >${obj.label}</option>
								</c:forEach>
							</select>
                        </div>
                  </div>
               </li>
                <li class="inner">
                  <div class="item-name">证号号码:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                        <input type="text" name="cardNo" id="cardNo" value="${user.cardNo}" ></input>
                        </div>
                  </div>
               </li>
               
                 <li class="inner">
                    <div class="item-name">E-mail:</div>
                    <div class="item-value">
                        <div class="input-wrap">
                         <input type="text" name="email" value="${user.email}"    />
                        </div>
                    </div>
                </li>
                
                <li class="inner">
                    <div class="item-name">备注:</div>
                    <div class="item-value">
                        <div class="input-wrap">
                         <input type="text" name="remarks" value="${user.remarks}"    />
                          <input type="hidden" name="photo" value="${user.photo}"    />
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