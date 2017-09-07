<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>预约确认-${fns:getConfig('productName')}</title>
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
                <h1>预约确认</h1>
            </div>
        </header>
     <form id="jvForm" action="${ctx}/sys/user/info" method="post" > 
         <article>
         <br>
         <input type="hidden" name="reserveUserId" value="${doctor.id}">
        <ul class="xunjia-box">
        	<li class="inner">
                 <div class="item-name">所属医院:</div>
                  <div class="item-value">${doctor.company.name}</div>
               </li>        
               <li class="inner">
                 <div class="item-name">所属科室:</div>
                  <div class="item-value">${doctor.office.name}</div>
               </li>               
               <li class="inner">
                  <div class="item-name">医生姓名:</div>
                  <div class="item-value">                   	
                        ${doctor.name}"  
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约类别:</div>
                  <div class="item-value">                   	
                        <div class="input-wrap">
                       	 <input type="text" name="remarks" value="${user.remarks}"    />
                        </div> 
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约日期:</div>
                  <div class="item-value">                   	
                        <div class="input-wrap">
                       	 <input type="text" name="reserveDate" id="reserveDate" value="${user.remarks}"    />
                        </div>  
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约时段:</div>
                  <div class="item-value">                   	
                        	专家门诊  
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