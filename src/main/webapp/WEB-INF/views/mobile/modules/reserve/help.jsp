<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>首页-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/tasks.css"/>
   
</head>
    <body>
         <header>
    <div class="titlebar reverse"  >
       
     <h1 >帮助   </h1> 
    </div>
 </header>
        <article  style="bottom: 0;">
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${ctx}/sys/user/info">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>公告</p>
                    </div>
                    <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${front}/reserve/reserve_dia">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>预约流程</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
           
           
        
            
           
        </article>
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>