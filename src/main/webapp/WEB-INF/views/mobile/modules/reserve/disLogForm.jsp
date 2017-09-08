<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>常用联系人-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/register.css"/>
  <link rel="stylesheet" href="${ctxStatic}/mobile/css/mobiscroll.custom-2.6.2.min.css"/>
<script src="${ctxStatic}/mobile/js/mobiscroll.custom-2.6.2.min.js"></script>
<script>
	var message="${message}";
	if(message){
		layer.msg(message);
	}
	$(function() {        	
	  

	     var opt = {  
	            theme: "android-ics light", 
	            display: 'modal', //显示方式  
	            lang: "zh",  
	            setText: '确定', //确认按钮名称
	            cancelText: "取消",  
	            dateFormat: 'yyyy-mm-dd', //返回结果格式化为年月格式  
	            dateOrder: 'yyyymmdd', //面板中日期排列格式
	            onBeforeShow: function (inst) {
	    		
	              }, 
	            headerText: function (valueText) { //自定义弹出框头部格式  
	                array = valueText.split('-');  
	                return array[0] + "年" + array[1] + "月" + array[2] + "日";  
	            }  
	        };

	      $("#date").mobiscroll().date(opt); 
	 });


	
</script>     
</head>

<body>
 <header>
       <div class="titlebar reverse">
                <a href="javascript:back()">
                    <i class="iconfont">&#xe640;</i>
                </a>
                <h1> 就诊病历<a href="${ctx}/reserve/disLog/form" style="float:right">增加  &nbsp;&nbsp;</a></h1>
            </div>
        </header>
     <form id="jvForm" action="${ctx}/reserve/disLog/save" method="post" > 
         <article>
         <br>
         <input type="hidden" name="id" value="${disLog.id}">
        <ul class="xunjia-box">
        	<li class="inner">
                 <div class="item-name">病人姓名:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="patientName" value="${disLog.patientName}" placeholder="（必填）"/>
                  </div>
                  </div>
               </li>               
              <li class="inner">
                  <div class="item-name">就诊类型:</div>
                  <div class="item-value">
                   	<div class="input-wrap">                   	  
					           <select name="type" >                       			
								<c:forEach items="${fns:getDictList('dis_type')}" var="obj">
								<option value="${obj.value}" <c:if test="${obj.value==contact.gender}">selected</c:if> >${obj.label}</option>
								</c:forEach>
							</select>
					    </div>
                       
                  </div>
               </li>
               <li class="inner">
                 <div class="item-name">就诊日期:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="date" id="date" value="${disLog.date}" />
                  </div>
                  </div>
               </li>  
               <li class="inner">
                 <div class="item-name">就诊医院:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="hospital" value="${disLog.hospital}" />
                  </div>
                  </div>
               </li>  
                 <li class="inner">
                 <div class="item-name">就诊科室:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="dept" value="${disLog.dept}" />
                  </div>
                  </div>
               </li>  
                <li class="inner">
                 <div class="item-name">医生姓名:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="doctor" value="${disLog.doctor}" />
                  </div>
                  </div>
               </li>  
               <li class="inner">
                 <div class="item-name">就诊原因:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="reason" value="${disLog.reason}"/>
                  </div>
                  </div>
               </li> 
                <li class="inner">
                 <div class="item-name">诊断结果:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="result" value="${disLog.result}" />
                  </div>
                  </div>
               </li> 
               <li class="inner">
                 <div class="item-name">医生建议:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="suggestion" value="${disLog.suggestion}" />
                  </div>
                  </div>
               </li> 
               <li class="inner">
                 <div class="item-name">用药处方:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="chufang" value="${disLog.chufang}" />
                  </div>
                  </div>
               </li> 
                <li class="inner">
                 <div class="item-name">病历描述:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="bingli" value="${disLog.bingli}" />
                  </div>
                  </div>
               </li>  
                <li class="inner">
                 <div class="item-name">备注:</div>
                 <div class="item-value">
                   	<div class="input-wrap">
                   <input type="text" name="remarks" value="${disLog.remarks}" />
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


</html>