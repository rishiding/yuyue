<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>预约确认-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/order.css"/>
        
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/mobiscroll.custom-2.6.2.min.css"/>
<script src="${ctxStatic}/mobile/js/mobiscroll.custom-2.6.2.min.js"></script>
<script>
	var message="${message}";
	if(message){
		layer.msg(message);
	}
	$(function() {       	
		var now = new Date();
	     var opt = {  
	            theme: "android-ics light", 
	            display: 'modal', //显示方式  
	            lang: "zh",  
	            setText: '确定', //确认按钮名称
	            cancelText: "取消",  	           
	            showNow: true,
	            nowText: "今天",
	            dateFormat: 'yyyy-mm-dd', //返回结果格式化为年月格式  
	            dateOrder: 'yyyymmdd', //面板中日期排列格式
	           
	            headerText: function (valueText) { //自定义弹出框头部格式  
	                array = valueText.split('-');  
	                return array[0] + "年" + array[1] + "月" + array[2] + "日";  
	            }  
	        };
	     
	    

	      $("#reserveDate").mobiscroll().date(opt); 
	 });

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
     <form id="jvForm" action="${front}/reserve/save" method="post" > 
         <article>
         <br>
         <input type="hidden" name="reserveUserId" value="${doctor.id}">
          <input type="hidden" name="status" value="1">
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
                        ${doctor.name}
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约类别:</div>
                  <div class="item-value">   
                  ${doctor.doctorTypeName}   
                  <input type="hidden" value="${doctor.doctorType}"/>             	
                       
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约日期:</div>
                  <div class="item-value">                   	
                        <div class="input-wrap">
                       	 <input type="text" name="reserveDate" id="reserveDate"  placeHolder="请选择"  />
                        </div>  
                  </div>
                </li>
                 <li class="inner">
                  <div class="item-name">预约时段:</div>
                  <div class="item-value">                   	
                        	<div class="input-wrap">
                       	  <select id="reserveTime" name="reserveTime">
                        		<c:forEach items="${fns:getDictList('reserve_time')}" var="obj">
								<option value="${obj.value}" >${obj.label}</option>
								</c:forEach>
                        </select>
                        </div>   
                  </div>
                </li>
        </ul>
        <c:if test="${empty user}">
        <ul class="xunjia-box" >        
                <li class="inner">
                    <div class="item-name"></div>
                    <div class="item-value">
                       需要<a href="${ctx}/login">&nbsp;登录&nbsp;&nbsp;</a>才能申请预约
                    </div>
                </li>
                 
        </ul>
        </c:if>
         <c:if test="${not empty user}">
         个人信息
         <ul class="xunjia-box" >        
                <li class="inner">
                    <div class="item-name">姓名:</div>
                    <div class="item-value">
                       
                        	${user.name}  
                        	<input type="hidden" name="user.id" value="${user.id}">                      
                       
                    </div>
                </li>
                 <li class="inner">
                    <div class="item-name">证件号:</div>
                    <div class="item-value">
                        
                        	${user.cardNo}                        
                        
                    </div>
                </li>
                <li class="inner">
                    <div class="item-name">手机号:</div>
                    <div class="item-value">                       
                        	${user.mobile}                       
                    </div>
                </li>
                 <li class="inner">
                    <div class="item-name">病情:</div>
                    <div class="item-value">
                        <div class="input-wrap">
                        	<input type="text" name="disease"/>                     
                        </div>
                    </div>
                </li>
                 
        </ul>
        <div class="weui_cells weui_cells_access animated fadeInRight">            
			  <a class="weui_cell" href="javascript:;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row weui-no-gutter">
                 		<input type="submit" value="保 存" class="weui_btn weui_btn_primary"/>
                    </div>
                </div>
              </a>
                
            </div>
        </c:if>
        </article>
            
            </form>    
          <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
    </body>
</html>