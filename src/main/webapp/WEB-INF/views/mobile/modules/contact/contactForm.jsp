<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>常用联系人-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>

<script>
	var message="${message}";
	if(message){
		layer.msg(message);
	}
</script>     
</head>

<body>
 <header>
       <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>常用联系人</h1>
            </div>
        </header>
     <form id="jvForm" action="${ctx}/contact/contact/save" method="post" > 
         <article>
         <br>
         <input type="hidden" name="id" value="${contact.id}">
        <ul class="xunjia-box">
        	<li class="inner">
                 <div class="item-name">昵称:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="nickName" value="${contact.nickName}"/>
                  </div>
                  </div>
               </li>               
              <li class="inner">
                  <div class="item-name">性别:</div>
                  <div class="item-value">
                   	<div class="input-wrap">                   	  
					           <select name="gender" >                       			
								<c:forEach items="${fns:getDictList('sex')}" var="obj">
								<option value="${obj.value}" <c:if test="${obj.value==contact.gender}">selected</c:if> >${obj.label}</option>
								</c:forEach>
							</select>
					    </div>
                       
                  </div>
               </li>
               <li class="inner">
                  <div class="item-name">出生日期:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="birthday" value="${contact.birthday}"   />
                        </div>
                  </div>
               </li>
                <li class="inner">
                  <div class="item-name">真实姓名:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="name" value="${contact.name}"   />
                        </div>
                  </div>
               </li>
                <li class="inner">
                  <div class="item-name">身份证号:</div>
                  <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="idno" value="${contact.idno}"   />
                        </div>
                  </div>
               </li>
                <li class="inner">
                    <div class="item-name">手机:</div>
                    <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="telphone" value="${contact.telphone}"   />
                        </div>
                  </div>
                </li>
                  <li class="inner">
                    <div class="item-name">身高:</div>
                    <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="telphone" value="${contact.height}"   />
                        </div>
                  </div>
                </li>
                  <li class="inner">
                    <div class="item-name">体重:</div>
                    <div class="item-value">
                   	<div class="input-wrap">
                         <input type="text" name="telphone" value="${contact.weight}"   />
                        </div>
                  </div>
                </li>
                
                <li class="inner">
                    <div class="item-name">备注:</div>
                    <div class="item-value">
                        <div class="input-wrap">
                         <input type="text" name="remarks" value="${contact.remarks}"    />
                          <input type="hidden" name="headImg" value="${contact.headImg}"    />
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