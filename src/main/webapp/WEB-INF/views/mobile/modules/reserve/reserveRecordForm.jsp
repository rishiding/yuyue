<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>预约记录详情-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/order.css"/>
 
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
                <h1>预约记录详情</h1>
            </div>
        </header>
         <article>
        
         <form id="jvForm" action="${ctx}/reserve/reserveRecord/cancel" method="post" > 
         <input type="hidden" name="id" value="${reserveRecord.id}">
        <ul class="xunjia-box">
        	<li class="inner">
                 <div class="item-name">预约医生:</div>
                  <div class="item-value">${reserveRecord.reserveUser.name}</div>
               </li>        
              
                 <li class="inner">
                  <div class="item-name">预约类别:</div>
                  <div class="item-value"> 
                  ${reserveRecord.reserveType}                  	
                       
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约日期:</div>
                  <div class="item-value">  
                   ${reserveRecord.reserveDate}                 	
                       
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约时段:</div>
                  <div class="item-value"> 
                  ${reserveRecord.reserveTime}                   	
                        	
                  </div>
                </li>
      
                 <li class="inner">
                    <div class="item-name">病情:</div>
                    <div class="item-value">
                    	 ${reserveRecord.disease}                         
                    </div>
                </li>
                 <li class="inner">
                    <div class="item-name">预约状态:</div>
                    <div class="item-value">
                    	 ${reserveRecord.statusName}                         
                    </div>
                </li>
                 
        </ul>
        <c:if test="${reserveRecord.status eq '1'}">
        <div class="weui_cells weui_cells_access animated fadeInRight">            
			  <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                 		<input type="submit" value="取消预约" class="weui_btn weui_btn_primary"/>
                    </div>
                </div>
              </a>
                
            </div>
      </c:if>
      </form>
        </article>
            
            </form>    
          <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
    </body>
</html>