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
            <div class="head-box">           
               <h3>${user.name}</h3>
                <a href="${ctx}/sys/user/headImg">
               <div class="head-icon-outer">
                    <div class="head-icon" ><img alt="" class="commentAvatarImage" src="<c:if test='${empty user.photo}'>${ctxStatic}/mobile/images/icon.jpg</c:if><c:if test='${not empty user.photo}'>${user.photo}</c:if>"></div>
               </div>
               </a>
               <h5>头像点击可以更换</h5>
               
            </div>
            
        </header>
        <article>
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${ctx}/sys/user/info">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>个人资料</p>
                    </div>
                    <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${ctx}/sys/user/modifyPwd">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>密码修改</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${ctx}/reserve/list">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>预约记录</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
           
             <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${ctx}/reserve/disLog/list">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>我的病历</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
           
             <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="${ctx}/contact/contact">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>我的联系人</p>
                    </div>
                   <i class="iconfont">&#xe642;</i>
                </a>
            </div>
            
            <div class="button">
                <div class="bd">
                    <a href="${ctx}/logout" class="weui_btn weui_btn_primary">退出</a>
                </div>
            </div>
           
        </article>
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>