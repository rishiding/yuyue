<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
        <title>就诊病历-${fns:getConfig('productName')}</title>
         <%@include file="/WEB-INF/views/include/m_head.jsp" %>
     <link rel="stylesheet" href="${ctxStatic}/mobile/css/pages/xunjia_wuliao.css"/>

    <script type="text/javascript">
    var message="${message}";
	if(message){
		layer.msg(message);
	}
$(function() {
	$("#jvForm").validate();
});
var page = 0;

var totalPage = 1;

var loading = false;
load();
$(window).scroll(function () {
    if ($(document).scrollTop() + $(window).height() >= $(document).height()) {
        load();
    }
});
function load() {
    if (page >= totalPage) {
        return;
    }
    page++;
    loading = true;
    $.ajax({
        "url": '${ctx}/reserve/disLog/records',
        dataType: 'json',
        data: {                 
        	pageNo: page,
        	pageSize: 10
        },
        success: function (res) {
        	console.info(res.data);
            try {
                if (res.data) {
                	
                	
                	totalPage=res.data.totalPage;
                	var res=res.data.list;
                	for (var i=0;i<res.length;i++){
                		var c =res[i];
                	
                		var a=$("<a class='weui_cell' href='${ctx}/reserve/disLog/form?id="+c.id+"'></a>");
                		var div1=$("<div class='weui_cell_bd weui_cell_primary'></div>");
                		var div2=$("<div class='wuliao-title'><label>"+c.typeName+"</label><span> -- "+c.patientName+"</span></div>");
                		var div3=$("<div class='detail clearfix'><span class='date'>&nbsp;&nbsp;&nbsp;就诊日期："+c.date+"</span><span class='require'>就诊原因：<label>"+c.reason+"</label></span></div>");
                		
                		div1.append(div2,div3);
                		a.append(div1);
                		$("#hotlist").append(a);                		
                	
                	}
                    
                }else{
                	$("#nouser").show();
                }
            }catch (e) {
               
            } finally {
                loading = false;
            }
        },
        error: function () {
            loading = false;
        }
    })
}


</script>
</head>

<body>
 <header>
    <div class="titlebar reverse"  >
       <a href="javascript:back()" >
            <i class="iconfont">&#xe640;</i>
          </a>
     <h1 > 就诊病历<a href="${ctx}/reserve/disLog/form" style="float:right">增加  &nbsp;&nbsp;</a>
     </h1> 
    </div>
 </header>
 <article style="bottom: 0;">
    <div class="weui_cells weui_cells_access" id="hotlist">  
   
                <div id="nouser" style="display:none">暂无记录</div>
        
 	</div>   
 </article>  
        
        <%@include file="/WEB-INF/views/include/m_foot.jsp" %>
        
    </body>
</html>