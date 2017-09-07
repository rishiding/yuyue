<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>首页-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/self.css"/>
   <style type="text/css">
.head-box .head-icon-outer .head-icon {
width: 122px;
height: 122px;
padding:2px;
background: #ececec;
border-radius:122px;
box-shadow: 0px 0px 1px rgba(0,0,0,0.4);
-moz-border-radius: 122px;
-webkit-border-radius: 122px;

}
.commentAvatarImage{
width:122px;
height:122px;
line-height: 0;	/* remove line-height */ 
display: inline-block;	/* circle wraps image */
border-radius: 50%;	/* relative value */
-moz-border-radius: 50%;
-webkit-border-radius: 50%;
transition: linear 0.25s;
}
</style>
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
                <a class="weui_cell" href="${ctx}/sys/user/modifyPwd">
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