<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>公告-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
           <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/notice_detail.css"/>
         </head>
<body>
  <header>
            <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>公告</h1>
            </div>
        </header>
        <article>
            <div class="weui_cells">
                <div class="weui_cell">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>${oaNotify.title}</p>
                    </div>
                </div>
                <div class="weui_cell no-padding">
                    <div class="weui_cell_bd weui_cell_primary">
                        <span><fmt:formatDate value="${oaNotify.createDate}" type="both" pattern="yyyy年MM月dd日"/> </span>
                    </div>
                </div>
            </div>
        </article>
        <article class="weui_article">
          <textarea  maxlength="2000" style="height:200px;width:100%"> ${oaNotify.content}</textarea>
        </article>
<%@include file="/WEB-INF/views/include/m_foot.jsp" %>        
</body>
</html>