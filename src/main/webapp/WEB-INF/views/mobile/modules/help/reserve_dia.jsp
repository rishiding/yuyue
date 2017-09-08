<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
         <title>预约流程-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
        <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/business_log.css"/>
       
    </head>
    <body>
        <header>
            <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1>预约流程</h1>
            </div>
        </header>
        <article style="bottom: 0;">
            <div class="time-line">
                <div class="time-item date">
                    <div class="content-left first">
                        <span>第一步</span>
                        <label><span class="dot"></span><i class="line"></i></label>
                    </div>
                </div>
                <div class="time-item time">
                    <div class="content-left">
                        <span>1.1</span>
                        <label><i class="line"></i><span class="dot"></span></label>
                    </div>
                    <div class="content-right">
                        <span class="left-arrow"></span>
                        <div class="detail-outer">
                            <div class="detail">
                                <div>
                                    <span class="name">手机</span>
                                    <label>[前置条件]</label>
                                    <span class="status">注册</span>
                                </div>
                                <div>
                                    <span class="name">注册</span>
                                    <label>[前置条件]</label>
                                    <span class="status">注册</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="time-item time important">
                    <div class="content-left">
                        <span>1.2</span>
                        <label><i class="line"></i><span class="dot"></span></label>
                    </div>
                    <div class="content-right">
                        <span class="left-arrow"></span>
                        <div class="detail-outer">
                            <div class="detail">
                                <div>
                                    <span class="name">登录</span>
                                    <label>[密码不能错]</label>
                                    <span class="status">使用登录名、密码登录</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="time-item date">
                    <div class="content-left">
                        <span>第二步</span>
                        <label><span class="dot"></span><i class="line"></i></label>
                    </div>
                </div>
                <div class="time-item time">
                    <div class="content-left">
                        <span>2.1</span>
                        <label><i class="line"></i><span class="dot"></span></label>
                    </div>
                    <div class="content-right">
                        <span class="left-arrow"></span>
                        <div class="detail-outer">
                            <div class="detail">
                                <div>
                                    <span class="name">选择医生</span>
                                    <label>[选择]</label>
                                    <span class="status">选择合适的医生</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="time-item date">
                    <div class="content-left">
                        <span>第三步</span>
                        <label><span class="dot"></span><i class="line"></i></label>
                    </div>
                </div>
                <div class="time-item time">
                    <div class="content-left">
                        <span>3.1</span>
                        <label><i class="line"></i><span class="dot"></span></label>
                    </div>
                    <div class="content-right">
                        <span class="left-arrow"></span>
                        <div class="detail-outer">
                            <div class="detail">
                                <div>
                                    <span class="name">预约信息</span>
                                    <label>[录入]</label>
                                    <span class="status">选择预约日期、就诊时段、病情，完成</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="time-item last">
                    <div class="content-left">
                        <label><i class="line"></i><span class="dot"></span></label>
                    </div>
                </div>
            </div>
          
        </article>
        
         <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
    </body>
</html>